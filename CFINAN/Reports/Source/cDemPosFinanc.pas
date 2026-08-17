unit cDemPosFinanc;

//==============================================================================
// Analista  : Marcus Oliveira
// Pendência : 21860
// Data      : 28/05/2007
// Descrição : Altera o Label de Banco para Conta Bancária
//==============================================================================
{**********************************************************}
{  Autor     : Rodolpho da Silva                           }
{  Data      : 29/04/2005                                  }
{  Pendência : 17761                                       }
{**********************************************************}



interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cRelatorio, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcCombo, fcColorCombo, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, uMensErro, uVerificaPreenchimento, CMDBLookupCombo,
  Db, DBClient, uCMClientDataSet, uCmSqlParams;

type
  TcfgDemPosFinanc = class(TcfgRelatorio)
    cboPortador: TCMDBLookupCombo;
    Label2: TLabel;
    edtDataFinal: TCMDateTimePicker;
    Label3: TLabel;
    SqlPortador: TCMSqlParams;
    cdsPortador: TCMClientDataSet;

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);


  private { Private declarations }

    function VerificaPreenchimento: Boolean;


  public  { Public declarations }


  end;




var
  cfgDemPosFinanc: TcfgDemPosFinanc;




implementation
{$R *.DFM}
uses
  dDemPosFinanc;



{ TcfgDemPosFinanc }




function TcfgDemPosFinanc.VerificaPreenchimento: Boolean;
begin
   Result := False;
   try
      if cboPortador.Text = '' then
         raise EValidacao.CreateVal('O campo ''BANCO'' tem que ser preenchido!', cboPortador)
      else
      if edtDataFinal.Text = '' then
         raise EValidacao.CreateVal('O campo ''DATA FINAL'' tem que ser preenchido!', edtDataFinal)
      else
         Result := True;

   except
      on ev : EValidacao do
      begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
end;




procedure TcfgDemPosFinanc.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if VerificaPreenchimento then
   begin
     with dtmDemPosFinanc do
     begin
        // Mestre
        SqlMestre.Prepare;
        SqlMestre.ParamByName('DATAFINAL').AsDate      := edtDataFinal.Date;
        SqlMestre.ParamByName('CODPORTADOR').AsString  := cboPortador.LookupValue;
        SqlMestre.Open;

        // Detalhe
        SqlDetalhe.Prepare;
        SqlDetalhe.ParamByName('DATAFINAL').AsDate     := edtDataFinal.Date;
        SqlDetalhe.ParamByName('CODPORTADOR').AsString := cboPortador.LookupValue;
        SqlDetalhe.Open;

        //  Instancia a variável que define a cor da linha de destaque
        cCorLinhaSeparadora := cboCorLinha.SelectedColor;

        // Instancia a variável que define se exibe as linhas separadoras
        bMostraLinhaSeparadora := ckbImpLinhas.Checked;


        lbPortador.Caption  := cboPortador.Text;
        lbDataFinal.Caption := 'Data Final:  ' + edtDataFinal.Text;

     end;
     ModalResult := mrOk;
   end;
end;




procedure TcfgDemPosFinanc.FormCreate(Sender: TObject);
begin
  inherited;
  SqlPortador.Prepare;
  SqlPortador.Open;
end;



end.
