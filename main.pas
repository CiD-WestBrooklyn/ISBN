unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  MaskEdit, Spin;

type

  { Tpane }

  Tpane = class(TForm)
    button_help: TButton;
    button_start: TButton;
    check_spin: TCheckBox;
    edit_isbn: TMaskEdit;
    label_isbn: TLabel;
    label_land: TLabel;
    spin_land: TSpinEdit;
    procedure button_startClick(Sender: TObject);
  private

  public

  end;

var
  pane: Tpane;

implementation

{$R *.lfm}

(**

   gets the country of the isbn.
   returns a new value from the spin if its enabled

**)
function getLand(isbn : String):Integer;
begin
      getLand := 123456789;
      IF pane.check_spin.Checked THEN
      begin
           getLand := pane.spin_land.Value;

      end ELSE
      begin
           try
             getLand := StrToInt(Copy(isbn, 5, 1));
           finally

           IF getLand = 123456789 THEN begin

                getLand := 3;
                 ShowMessage('Convert Error at getLand --> overlook the input');
           end;
         end
      end;

end;

{ Tpane }

procedure Tpane.button_startClick(Sender: TObject);
begin

      ShowMessage(IntToStr(getLand(edit_isbn.Text)));


end;





end.

