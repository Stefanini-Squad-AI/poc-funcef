//******************************************************************************
//Data	    : 25/07/2006
//Código    : Al_4
//Pendencia : 22965
//Motivo(S) : Implementação de segregação de Planos
//*****************************************************************************
//Data	    : 06/03/2006
//Código    : Al_3
//Motivo(S) : Implementação da trava de fechamento
//*****************************************************************************
//Data	    : 23/01/2006
//Código    : Al_2
//Motivo(S) : Ajuste na busca do botão procura para trazer correta a boleta
//*****************************************************************************
//Data	    : 15/06/2005
//Código    : Al_1
//Motivo(S) : Acerto no filtro do MontaSelect para trazer somente Boletas com
//            TIPMOVBOLETA = 'OPE'
//*****************************************************************************

unit FParamFechaBoleta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, wwdblook, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList;

type
  TfrmParamFechaBoleta = class(TfrmCadastroCS)
    QryBoleta: TwwQuery;
    QryCorretValores: TwwQuery;
    QryBoletaIDBOLETA: TStringField;
    QryBoletaSTATUS: TStringField;
    Panel1: TPanel;
    Label2: TLabel;
    dbDtaOperacao: TCMDateTimePicker;
    Label1: TLabel;
    dblCorretora: TwwDBLookupCombo;
    lblBoleta: TLabel;
    dblkBoleta: TwwDBLookupCombo;
    dblPlanoPatro: TwwDBLookupCombo;
    Label4: TLabel;
    qryPlanoPatro: TwwQuery;
    qryPlanoPatroPLANPRVCONTABPATRO: TStringField;
    qryPlanoPatroIDPLANPREVCTBPATR: TFloatField;
    qryPlanoPatroIDPLANOPREV: TFloatField;
    qryPlanoPatroIDPATRO: TFloatField;
    QryCorretValoresIDCORRETVALORES: TFloatField;
    QryCorretValoresSGLCORRETVALORES: TStringField;
    procedure bbtnConfirmarClick(Sender: TObject);
   
    Procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbDtaOperacaoExit(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure dblCorretoraExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblPlanoPatroExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamFechaBoleta: TfrmParamFechaBoleta;

implementation

uses FPrincipal, FFechaBoleta, UMensErro,UBibliotecaInvest, UOperComum, URendaVariavel;

{$R *.DFM}

procedure TfrmParamFechaBoleta.bbtnConfirmarClick(Sender: TObject);
begin
//  inherited;

   // AL_3
   if RendaVariavel.VerEmAbertura then
      Exit;

   If dbDtaOperacao.Date = 0 Then
   Begin
      MsgDlg('Informe a Data.                ', 'Mensagem do Sistema',MtError,[MbOk],0);
      if dbDtaOperacao.CanFocus then
         dbDtaOperacao.SetFocus;
      Exit;
   End;
   If dblCorretora.Text = '' Then
   Begin
      MsgDlg('Informe a Corretora.           ', 'Mensagem do Sistema',MtError,[MbOk],0);
      if dblCorretora.CanFocus then
         dblCorretora.SetFocus;
      Exit;
   End;
   If dblkBoleta.Text = '' Then
   Begin
      MsgDlg('Informe a Boleta               ', 'Mensagem do Sistema',MtError,[MbOk],0);
      if dblkBoleta.CanFocus then
         dblkBoleta.SetFocus;
      Exit;
   End;
   Application.CreateForm(TFrmFechaBoleta,FrmFechaBoleta);
   FrmFechaBoleta.wBoletaFecha := QryBoleta.FieldByName('STATUS').AsString;
   FrmFechaBoleta.wDocumento   := QryBoleta.FieldByName('IDBOLETA').AsString;
   FrmFechaBoleta.wIdLote      := QryBoleta.FieldByName('IDBOLETA').AsString;
   FrmFechaBoleta.wIdCorretora := QryCorretValores.FieldByName('IDCORRETVALORES').AsString;
   FrmFechaBoleta.ShowModal;
   FrmFechaBoleta.Free;

end;

Procedure TfrmParamFechaBoleta.CmeCadastroFind(Sender: TObject);
Begin
   //Al_2
   if dbDtaOperacao.CanFocus then
      dbDtaOperacao.SetFocus;

   If (MontaSelect.ValoresChave.Count > 0) And (MontaSelect.ValoresChave[0] <> '') Then
   Begin
      dbDtaOperacao.Text := MontaSelect.ValoresChave[1];

      //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009      
      dblPlanoPatroExit(Sender);

      if dblCorretora.CanFocus then
         dblCorretora.SetFocus;

      dblCorretora.LookupValue := MontaSelect.ValoresChave[0];
      dblCorretora.PerformSearch;

      if dblkBoleta.CanFocus then
         dblkBoleta.SetFocus;

      dblkBoleta.Text   := MontaSelect.ValoresChave[3];
      dblkBoleta.PerformSearch;

   End
   Else
   Begin
      dbDtaOperacao.Text := '';
      dblCorretora.Text  := '';
      dblkBoleta.Text := '';
   End;
End;

procedure TfrmParamFechaBoleta.FormShow(Sender: TObject);
begin
  inherited;
// TESTA SE LANCAMENTO É RETROATIVO
   If FPrincipal.TipoMenuInvest = 'A' Then Begin
     MsgDlg('Sistema utilizado para Ambos os Tipos de Investimento.'+#13+
            'Escolha apenas um dos Tipos.','Mensagem do Sistema', MtError, [MbOk],0);
     Close;
     Exit;
   End;

   QryBoleta.Open;

   //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
   dbDtaOperacao.Date := pRPI.DATAMOVTORV;         

   //AL_4
   qryPlanoPatro.Close;
   qryPlanoPatro.ParamByName('DATAOPERACAO').AsString := dbDtaOperacao.Text;
   qryPlanoPatro.Open;

   //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009   
   OperComum.LimpaParametros(QryCorretValores);
   QryCorretValores.ParamByName('P_DATAOPERACAO').AsString := dbDtaOperacao.Text;
   QryCorretValores.Open;

   CMeCadastro.AtualizaBotoes(self);

   dbDtaOperacaoExit(Sender);

      //AL_4
      if dblPlanoPatro.CanFocus then
         dblPlanoPatro.SetFocus;

   if Trim(dblkBoleta.Text) <> '' then
      bbtnConfirmar.SetFocus;

end;

procedure TfrmParamFechaBoleta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then      //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True);
end;

procedure TfrmParamFechaBoleta.dbDtaOperacaoExit(Sender: TObject);
begin
   //AL_4 - Ini
   inherited;
   if Trim(dbDtaOperacao.Text) = '' then
   begin
      MsgDlg('Data não Informada', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Exit;
   end;
   dblkBoleta.Clear;
   dblCorretora.Clear;
   dblPlanoPatro.Clear;

   qryPlanoPatro.Close;
   qryPlanoPatro.ParamByName('DATAOPERACAO').AsString := dbDtaOperacao.Text;
   qryPlanoPatro.Open;
   if qryPlanoPatro.RecordCount = 1 then
   begin
      dblPlanoPatro.Text := qryPlanoPatro.FieldByName('PLANPRVCONTABPATRO').AsString;
      dblPlanoPatro.PerformSearch;
      dblPlanoPatroExit(Sender);
   end;
   //AL_4 - Fim
end;

//AL_4
procedure TfrmParamFechaBoleta.dblPlanoPatroExit(Sender: TObject);
begin
   inherited;
   OperComum.LimpaParametros(QryCorretValores);
   //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
   if (Trim(dbDtaOperacao.Text) <> '') then
   begin
      dblkBoleta.Clear;
      dblCorretora.Clear;

      QryCorretValores.ParamByName('P_DATAOPERACAO').AsString := dbDtaOperacao.Text;

      //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
      if (dblPlanoPatro.Text <> '') then
         qryBoleta.ParamByName('IDPLANPREVCTBPATR').AsInteger := qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger;

      QryCorretValores.Open;
      if QryCorretValores.RecordCount = 1 then
      begin
         dblCorretora.Text := QryCorretValores.FieldByName('SGLCORRETVALORES').AsString;
         dblCorretora.PerformSearch;
         dblCorretoraExit(Sender);
      end;
   end
   else
      QryCorretValores.Open;
end;

procedure TfrmParamFechaBoleta.dblCorretoraExit(Sender: TObject);
begin
   inherited;
   //AL_4 - ini
   OperComum.LimpaParametros(QryBoleta);
   if (Trim(dbDtaOperacao.Text) <> '') and (Trim(dblCorretora.Text) <> '') then
   begin
      qryBoleta.ParamByName('IDFORCLI').AsInteger := QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
      qryBoleta.ParamByName('DDATAREF').AsString  := dbDtaOperacao.Text;
      //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
      if (dblPlanoPatro.Text <> '') then
         qryBoleta.ParamByName('IDPLANPREVCTBPATR').AsInteger := qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger;
      qryBoleta.Open;
      if qryBoleta.RecordCount = 1 then
      begin
         dblkBoleta.Text        := QryBoleta.FieldByName('IDBOLETA').AsString;
         dblkBoleta.LookupValue := QryBoleta.FieldByName('IDBOLETA').AsString;
         dblkBoleta.PerformSearch;
         bbtnConfirmar.SetFocus;
      end;
   end
   else
      QryBoleta.Open;
   //AL_4 - fim
end;

procedure TfrmParamFechaBoleta.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   pnlFundo.Enabled      := True;
   bbtnConfirmar.Enabled := True;
end;

procedure TfrmParamFechaBoleta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   qryBoleta.Close;
   QryCorretValores.Close;
end;


end.


