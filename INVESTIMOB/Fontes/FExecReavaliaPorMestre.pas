unit FExecReavaliaPorMestre;

//	-------------------------------------------------------------------------------------------------
//
//	      Reavaliação por Imóvel Mestre
//
//	   Autor          :  André Pontes
//	   Data de Início	:  20/01/2000
//	   Data de Término:
//
//	   Modificações	:
//
// -------------------------------------------------------------------------------------------------
// obs:  Reavaliação positiva: 'G' --> 'Ganha'
//       Reavaliação negativa: 'P' --> 'Perde'
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, Mask, wwdbedit, 
  ComCtrls, DBCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery,
  wwdblook, Wwdatsrc, Wwdbspin, wwdbdatetimepicker, CMDateTimePicker,
  FOkCancelarImob;

type
  TfrmExecReavaliaPorMestre = class(TFrmOkCancelarImob)
    qryBemXImovel: TwwQuery;
    qryBemXImovelPLACA: TFloatField;
    qryBemXImovelDESBEM: TStringField;
    qryBemXImovelSUMVALCTB: TFloatField;
    qryBemXImovelVLRREAVAL: TFloatField;
    qryBemXImovelVIDAUTIL: TFloatField;
    qryBemXImovelGrupoExtenso: TStringField;
    qryBemXImovelVlrAnterior: TFloatField;
    qryBemXImovelIDIMOVEL: TFloatField;
    qryBemXImovelIDBEM: TFloatField;
    qryBemXImovelIXBGRUPO: TStringField;
    qryBemXImovelSUMVALCTBIMOB: TFloatField;
    qryImovel: TwwQuery;
    wwQuery2: TwwQuery;
    qryMestre: TwwQuery;
    qryBemXMestre: TwwQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    StringField2: TStringField;
    FloatField7: TFloatField;
    StringField3: TStringField;
    FloatField8: TFloatField;
    updBemXMestre: TUpdateSQL;
    updImovel: TUpdateSQL;
    qryLookTipoOperPositiva: TwwQuery;
    qryLookTipoOperPositivaDESCTIPOOPERACAO: TStringField;
    qryLookTipoOperPositivaIDTIPOOPERACAO: TFloatField;
    qryLookTipoOperPositivaNATUREZAOPERACAO: TStringField;
    qryLookTipoOperNegativa: TwwQuery;
    btnCalcula: TBitBtn;
    dtsBemXMestre: TwwDataSource;
    dtsImovel: TwwDataSource;
    qryImovelIDIMOVEL: TFloatField;
    qryImovelIMONOME: TStringField;
    qryImovelIMOMATRICULA: TStringField;
    qryImovelIMOCODIGO: TStringField;
    qryImovelCUSTO_CONTABIL: TFloatField;
    qryImovelVLR_LAUDO: TFloatField;
    qryLookTipoOperNegativaIDTIPOOPERACAO: TFloatField;
    qryLookTipoOperNegativaDESCTIPOOPERACAO: TStringField;
    qryLookTipoOperNegativaNATUREZAOPERACAO: TStringField;
    qryBemXMestreIDIMOVEL: TFloatField;
    Panel2: TPanel;
    lblProgress: TLabel;
    lblContadorImovel: TLabel;
    lblProgressoImovel: TLabel;
    lblContador: TLabel;
    Progress: TProgressBar;
    ProgressBar: TProgressBar;
    Label1: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    Label15: TLabel;
    Label4: TLabel;
    PageControl1: TPageControl;
    tbsImovel: TTabSheet;
    DBgrdImoveis: TwwDBGrid;
    tbsBem: TTabSheet;
    DBgrdBens: TwwDBGrid;
    btnBuscaMestre: TBitBtn;
    edtMestre: TEdit;
    edtDataReaval: TCMDateTimePicker;
    DBspnVidaUtil: TwwDBSpinEdit;
    GroupBox1: TGroupBox;
    Label42: TLabel;
    Label2: TLabel;
    DBcboTipoOperPositiva: TwwDBLookupCombo;
    DBcboTipoOperNegativa: TwwDBLookupCombo;
    edtObsLaudo: TEdit;
    DBedtValorReavalia: TRealEdit;

    procedure btnBuscaMestreClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnCalculaClick(Sender: TObject);
    procedure edtDataReavalExit(Sender: TObject);
    procedure DBgrdImoveisCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdImoveisTopRowChanged(Sender: TObject);
    procedure DBgrdBensCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdBensTopRowChanged(Sender: TObject);
    procedure qryBemXMestreCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

  private { Private declarations }
    fCC_Mestre : extended;
    iMestre    : integer;
    bHabilita  : boolean;

    procedure DesabilitaBotoes;
    procedure HabilitaBotoes;

    function CalculaRateio: boolean;
    function CalculaRateioBem: boolean;
    procedure ProcessaReavaliacao;

    function VerificaPreenchimento: boolean;



  public { Public declarations }

  end;



var
  frmExecReavaliaPorMestre: TfrmExecReavaliaPorMestre;



implementation
{$R *.DFM}
uses
  uSistema, uMensErro, uDatabase, DBaseDados, uVerificaPreenchimento, dLookImobiliario, uFuncoesImob,
  uModulo, uIntegraBack, uOperComum, FCadastroCS, uAtivoFixo, DMS;



procedure TfrmExecReavaliaPorMestre.DesabilitaBotoes;
begin
   Screen.Cursor := crHourGlass;

   btnCalcula.Enabled      := False;
   bHabilita               := bbtnConfirmar.Enabled;
   bbtnConfirmar.Enabled   := False;
   bbtnCancelar.Enabled    := False;
   bbtnSair.Enabled        := False;
end;



procedure TfrmExecReavaliaPorMestre.HabilitaBotoes;
begin
   btnCalcula.Enabled      := True;
   bbtnConfirmar.Enabled   := bHabilita;
   bbtnCancelar.Enabled    := True;
   bbtnSair.Enabled        := True;

   Screen.Cursor := crDefault;
end;



function TfrmExecReavaliaPorMestre.CalculaRateio: boolean;
begin
   DesabilitaBotoes;

   try
      CalculaRateioBem;

   finally
      HabilitaBotoes;
   end;
end;



function TfrmExecReavaliaPorMestre.CalculaRateioBem: boolean;
var
   fAtualBem, fQuantBem : double;
   iImovel, iImovelAnt  : integer;
   fCC_Imovel, CC_Atual : extended;

begin
   with qryBemXMestre do begin

      fQuantBem := qryBemXMestre.RecordCount;
      fAtualBem := 0;

      First;
      iImovelAnt := qryBemXMestreIDIMOVEL.AsInteger;

      MostraProgresso(ProgressBar, lblProgress, lblContador, fQuantBem, 'Processando Bens...');

      while not(EOF) do begin

         fAtualBem := fAtualBem + 1;
         AndaProgresso(ProgressBar, lblProgress, lblContador, fAtualBem, fQuantBem);

         iImovel  := qryBemXMestreIDIMOVEL.AsInteger;

         Edit;

      end;
   end;

end;

procedure TfrmExecReavaliaPorMestre.ProcessaReavaliacao;
var
   iBem, iReavaliacao, iModulo, iEmpresaProp, iTipoOper  : integer;
   iPlano, iOperacao, iPlanilha, iDocumento, iFatura     : integer;

   fSldReavalImob    : double;      // saldo de reavaliação desprezando-se depreciações e correções
   fSldReaval        : double;      // saldo de reavaliação
   fVlrReavalTotal   : currency;    // valor da reavaliação do Imóvel (a soma de todos os bens)
   fVlrReavalBem     : currency;
   fSldReavalTotal   : currency;

   fNoDoc            : extended;
   dDataReaval       : TDateTime;
   iResultOper       : shortint;
   iVidaUtil         : smallint;
   sHistOper, sErro  : string;
   sObsLaudo         : string;
begin

end;



function TfrmExecReavaliaPorMestre.VerificaPreenchimento: boolean;
begin
	Result := False;
	try

      // Imóvel
		if length(trim(edtMestre.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar o Imóvel Mestre!', btnBuscaMestre);

      // Data da Operação
		if length(trim(edtDataReaval.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data da Reavaliação!', edtDataReaval);

      // Custo contábil
		if fCC_Mestre <= 0 then
         if MsgDlg('O Custo Contábil do Imóvel Mestre é realmente ZERO?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
            raise EValidacao.CreateVal('Favor verificar o Custo Contábil do Imóvel Mestre!', btnBuscaMestre);

      // Valor do Laudo
		if DBedtValorReavalia.Value < 0 then
         raise EValidacao.CreateVal('É necessário indicar o Valor do Laudo!', DBedtValorReavalia);

		if DBedtValorReavalia.Value = 0 then
         if MsgDlg('O Valor do Laudo é realmente ZERO?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
            raise EValidacao.CreateVal('É necessário indicar o Valor do Laudo!', DBedtValorReavalia);

      // Vida Útil
      if DBspnVidaUtil.Value <= 0 then
         if MsgDlg('A Vida Útil remanescente é realmente ZERO?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
            raise EValidacao.CreateVal('É necessário indicar a Vida Útil remanescente!', DBspnVidaUtil);

      // Obs Laudo
		if length(trim(edtObsLaudo.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário preecher as Observações do Laudo!', edtObsLaudo);

      // Tipo de Operação
		if DBcboTipoOperPositiva.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Operação a ser usado para Reavaliação com saldo positivo!', DBcboTipoOperPositiva);

		if DBcboTipoOperNegativa.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Operação a ser usado para Reavaliação com saldo negativo!', DBcboTipoOperNegativa);

	except

      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;
   Result := True;
end;



procedure TfrmExecReavaliaPorMestre.btnBuscaMestreClick(Sender: TObject);
begin
   dtmMS.MS_ImovelMestre.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_ImovelMestre.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      bbtnConfirmar.Enabled := False;

      iMestre        := StrToInt(dtmMS.MS_ImovelMestre.ValoresChave[0]);
      edtMestre.Text := dtmMS.MS_ImovelMestre.ValoresChave[1];

      LimpaParametros(qryImovel);
      qryImovel.ParamByName('PIDIMOVELMESTRE').AsInteger := iMestre;
      qryImovel.Open;

      LimpaParametros(qryBemXMestre);
      qryBemXMestre.ParamByName('PIDIMOVELMESTRE').AsInteger := iMestre;
      qryBemXMestre.Open;

      fCC_Mestre := -1;
      if ( (length(trim(edtDataReaval.Text)) > 0) and (length(trim(edtMestre.Text)) > 0) ) then begin
         fCC_Mestre := FuncoesImob.CC_Mestre(iMestre, edtDataReaval.Date);
      end;

      Screen.Cursor := crDefault;
   end;

   btnBuscaMestre.SetFocus;
end;



procedure TfrmExecReavaliaPorMestre.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then ProcessaReavaliacao;
end;



procedure TfrmExecReavaliaPorMestre.btnCalculaClick(Sender: TObject);
begin
   if VerificaPreenchimento then if CalculaRateio then bbtnConfirmar.Enabled := True;
end;



procedure TfrmExecReavaliaPorMestre.edtDataReavalExit(Sender: TObject);
begin
   if fCC_Mestre = -1 then begin
      if ( (length(trim(edtDataReaval.Text)) > 0) and (length(trim(edtMestre.Text)) > 0) ) then begin
         fCC_Mestre := FuncoesImob.CC_Mestre(iMestre, edtDataReaval.Date);
      end;
   end;
end;



procedure TfrmExecReavaliaPorMestre.DBgrdImoveisCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecReavaliaPorMestre.DBgrdImoveisTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecReavaliaPorMestre.DBgrdBensCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecReavaliaPorMestre.DBgrdBensTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecReavaliaPorMestre.qryBemXMestreCalcFields(DataSet: TDataSet);
begin
   inherited;
   qryBemXImovelGrupoExtenso.asString := FuncoesImob.GrupoExtenso(qryBemXImovelIXBGRUPO.asString);
end;



procedure TfrmExecReavaliaPorMestre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryLookTipoOperPositiva.Close;
   qryLookTipoOperNegativa.Close;

   qryBemXMestre.Close;
   qryImovel.Close;

   if Modulo.bIntegraGestao then begin
      // atualiza os saldos das carteiras
      OperComum.AtualizaSaldos(Modulo.fVlrPrimeiraCota, -1{DataLimite});
   end;

   inherited;
end;



procedure TfrmExecReavaliaPorMestre.FormShow(Sender: TObject);
begin
   inherited;

   qryLookTipoOperPositiva.Open;
   if not(qryLookTipoOperPositiva.isEmpty) then begin
      qryLookTipoOperPositiva.First;
      DBcboTipoOperPositiva.LookupValue   := IntToStr(qryLookTipoOperPositivaIDTIPOOPERACAO.asInteger);
   end;

   qryLookTipoOperNegativa.Open;
   if not(qryLookTipoOperNegativa.isEmpty) then begin
      qryLookTipoOperNegativa.First;
      DBcboTipoOperNegativa.LookupValue   := IntToStr(qryLookTipoOperNegativaIDTIPOOPERACAO.asInteger);
   end;
end;

end.



