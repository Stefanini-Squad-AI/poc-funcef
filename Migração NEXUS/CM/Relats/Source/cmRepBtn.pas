unit cmRepBtn;

interface

uses
   SysUtils, WinTypes, WinProcs, Messages, Classes,
   Graphics, Controls, Forms, Dialogs,stdctrls, QuickRpt, Buttons;

type
   TExecuteReport= (erPrint, erPreview);
   TcmReportBtn = class(TBitBtn)
   private
      FReport: TQuickRep;
      FExecute: TExecuteReport;
   protected
   public
      procedure Click;override;
   published
      property Report: TQuickRep read FReport write FReport;
      property Execute: TExecuteReport read FExecute write FExecute;
   end;

Procedure Register;

implementation


Procedure Register;
Begin
   RegisterComponents('CM Standard', [TcmReportBtn]);
End;

procedure TcmReportBtn.Click;
begin
   inherited Click;

   if FReport <> nil
   then begin
      case FExecute of
         erPreview: FReport.Preview;
         erPrint: FReport.Print;
      end;
   end;

end;
end.

