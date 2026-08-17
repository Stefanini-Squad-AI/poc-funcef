unit fMTMovFechamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  uCtrlFechamento;

type
  TfrmMTMovFechamento = class(TfrmOkCancelar)
    Data: TLabel;
    edDataMov: TCMDateTimePicker;
    chkDeprecImob: TCheckBox;
    procedure DataClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Fechamento : TCtrlFechamento;
  public
    { Public declarations }
  end;

var
  frmMTMovFechamento: TfrmMTMovFechamento;

implementation

{$R *.DFM}

Uses uMensErro, dBasedados, uSistema, uIntegraBack, uDiasUteis;

procedure TfrmMTMovFechamento.FormCreate(Sender: TObject);
Var
   iAnoFim, iMesFim, iDiaFim,
   iAno, iMes, iDia           : Word;

begin
   inherited;
   Fechamento := TCtrlFechamento.Create;
   Fechamento.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                         Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   //-------------------------------------------------------------------------------------
   DecodeDate((date() - 30), iAno, iMes, iDia);
   DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
   edDataMov.Date := EncodeDate(iAnoFim, iMesFim, iDiaFim);
end;
//========================================================================================
procedure TfrmMTMovFechamento.DataClick(Sender: TObject);
begin
   inherited;
   if Sistema.NomeUsuario = 'SERGIO.CM' then
      chkDeprecImob.Visible := True;
end;
//========================================================================================
procedure TfrmMTMovFechamento.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if edDataMov.Text = '' then
   begin
      MsgDlg('Data do Fechamento deve ser definida! ','Erro',mtError,[mbOk],0);
      edDataMov.SetFocus;
      exit;
   end;
   //----------------------------------------------------------------------------------
   if not Fechamento.ExecutaFechamento(Sistema.IdModulo, Sistema.IdEmpresa,
                                       edDataMov.Date,chkDeprecImob.Checked) then
      MsgDlg('Processamento Abortado.' + #13 + #13 + Fechamento.MessageInfo,
             'Erro',mtError,[mbOK],0)
   else
      MsgDlg('Processamento Encerrado.', 'Erro', mtError, [mbOK], 0);
end;
//========================================================================================
procedure TfrmMTMovFechamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Fechamento.Free;
end;

end.
