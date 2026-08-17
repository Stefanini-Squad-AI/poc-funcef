//******************************************************************************
// Data	    : 23/08/2007
// LINHA(S) : AL_3
// Motivo(S): Implementação do Saldo de Quantidade Antigo (CC) SALDOQTDECPMF
//******************************************************************************
// Data	    : 24/11/2004
// LINHA(S) : AL_2
// Motivo(S): Implementação da exclusa na OPERCUSTODIA e na HISTCUSTODIA.
//******************************************************************************
// Data	    : 24/11/2004
// LINHA(S) : AL_1
// Motivo(S): Implementação do lançamento na OPERCUSTODIA.(para poder se excluido)
//******************************************************************************
// Data	    :14/04/2004
// Origem   :FUNCEF
// Função   :bbtnConfirmarClick
// LINHA(S) :527
// Motivo(S): Essa alteração permite incluir um saldo mesmo que essa já tenha
//            sido inicializado.
//******************************************************************************

unit FSaldoIniCart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, DBCtrls, wwdblook, wwdbedit, Wwdotdot, Wwdbcomb, UDataBase,
  TREdit, UOperacaoInvest, UOperComum, dOperComum, dOperacaoInvest, UBibliotecaInvest,
  UMensErro, USistema, ComCtrls, CmEventosCadastro, ImgList,
  wwdbdatetimepicker, CMDateTimePicker;


type
  TfrmCadSaldoIniCart = class(TfrmCadastroCS)
    qryCarteira: TwwQuery;
    dtsCarteira: TwwDataSource;
    qryInvestimento: TwwQuery;
    dtsInvestimento: TwwDataSource;
    cboCarteira: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    qryContrato: TwwQuery;
    dteContrato: TwwDataSource;
    Label10: TLabel;
    cboLote: TwwDBLookupCombo;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryContratoIDLOTE: TStringField;
    Bevel1: TBevel;
    Label11: TLabel;
    qryTipoInvest: TwwQuery;
    qryTipoInvestDESCTIPOINVEST: TStringField;
    qryTipoInvestIDTIPOINVEST: TFloatField;
    dtsTipoInvest: TwwDataSource;
    cboTipoInvest: TwwDBLookupCombo;
    cboInvestimento: TwwDBLookupCombo;
    QryAux: TwwQuery;
    Label12: TLabel;
    LkcCustodiante: TwwDBLookupCombo;
    Label15: TLabel;
    QryBuscaCustodiante: TwwQuery;
    pgcDetalhes: TPageControl;
    tbsSaldos: TTabSheet;
    Panel1: TPanel;
    Label3: TLabel;
    DbeSInvest: TwwDBEdit;
    Label8: TLabel;
    dbeSRend: TwwDBEdit;
    Label13: TLabel;
    dbeSJuros: TwwDBEdit;
    Label14: TLabel;
    dbeSPremio: TwwDBEdit;
    Label16: TLabel;
    wwDBEdit1: TwwDBEdit;
    tbsOutros: TTabSheet;
    Panel2: TPanel;
    qryIDHISTCARTINV: TFloatField;
    qryIDDESPCARTINVEST: TFloatField;
    qryIDLANCIMOVEL: TFloatField;
    qryPLANO: TFloatField;
    qryCODDOCUMENTO: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryPLNCODIGO: TFloatField;
    qryIDOPERACAOINVEST: TFloatField;
    qryIDMODULO: TFloatField;
    qryIDEMPRESAPROP: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryIDDESPOPERINVEST: TFloatField;
    qryIDINVESTIMENTO: TFloatField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryDATAMOVCARTINV: TDateTimeField;
    qryVLRMOVCARTINV: TFloatField;
    qryCOTASMOVCARTINV: TFloatField;
    qrySALDOVLRINVCART: TFloatField;
    qrySALDOQTDEINVCART: TFloatField;
    qrySALDOVLRCARTINV: TFloatField;
    qrySALDOCOTASCARTINV: TFloatField;
    qryHISTMOVCARTINV: TStringField;
    qryNATURMOVCARTINV: TStringField;
    qryTIPMOVCARTINV: TStringField;
    qryFLGCALCSALDO: TStringField;
    qryMOVIMATU: TFloatField;
    qrySALDOATU: TFloatField;
    qryMOVIMCAR: TFloatField;
    qrySALDOCAR: TFloatField;
    qryIDLOTE: TStringField;
    qryMOVIMAQUI: TFloatField;
    qrySALDOAQUI: TFloatField;
    qrySALDOREND: TFloatField;
    qryQTDEMOVINVCART: TFloatField;
    qryFLGCUSTODIA: TStringField;
    qryRECPAG: TStringField;
    qryNATURMOVOPER: TStringField;
    qryNUMLANCTO: TFloatField;
    qrySALDOJUROS: TFloatField;
    qryVLRJUROS: TFloatField;
    qrySALDOPREMIO: TFloatField;
    qryVLRPREMIO: TFloatField;
    qrySALDOVARIACAO: TFloatField;
    qrySALDOIRPROV: TFloatField;
    qrySALDOIRAPU: TFloatField;
    qrySALDOIOFPROV: TFloatField;
    qrySALDOIOFAPU: TFloatField;
    qrySALDOAGIO: TFloatField;
    Label17: TLabel;
    Label18: TLabel;
    dbeIRProv: TwwDBEdit;
    dbeIRApurado: TwwDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    dbeIOFProv: TwwDBEdit;
    dbeIOFApurado: TwwDBEdit;
    Label21: TLabel;
    dbeAgio: TwwDBEdit;
    Label4: TLabel;
    QbQtdInvest: TwwDBEdit;
    Label7: TLabel;
    dbeSAqui: TwwDBEdit;
    Label6: TLabel;
    EdCustoCarregamento: TRealEdit;
    Label9: TLabel;
    Label5: TLabel;
    EdSaldoAtuarial: TRealEdit;
    QryAchaCustodia: TwwQuery;
    QryAchaCustodiaIDCUSTODIA: TFloatField;
    QryBuscaCustodianteIDCUSTODIANTE: TFloatField;
    QryBuscaCustodianteSGLCUSTODIANTE: TStringField;
    QryAchaCustodiaIDCUSTODIANTE: TFloatField;
    qryIDPLANPREVCTBPATR: TFloatField;
    qryCarteiraDESCCARTINVEST: TStringField;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    qryCarteiraIDCARTEIRAGERENC: TFloatField;
    qryCarteiraDATAINICIO: TDateTimeField;
    qryIDCARTEIRAGERENC: TFloatField;
    qryCarteiraID: TFloatField;
    dbeData: TCMDateTimePicker;
    QryDelHistCustodia: TwwQuery;
    QryDelOperCustodia: TwwQuery;
    QrySelOperCustodia: TwwQuery;
    Label22: TLabel;
    QbQtdIAntiganvest: TwwDBEdit;
    qrySALDOQTDECPMF: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure cboCarteiraChange(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure EdSaldoAtuarialExit(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure qryContratoAfterOpen(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure cboCarteiraExit(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    PreencheInvest: boolean;
    Investimento, Carteira: Longint;
    Lote: string;
    OperacaoInvest: TOperacaoInvest;
    Query: TwwQuery;
    wQtdCotaini: Real;
    wMoecodigo: integer;

    procedure SetParametro(Query: TwwQuery; Param: Longint; Indice: integer);

  end;

var
  frmCadSaldoIniCart         : TfrmCadSaldoIniCart;
  wIdCarteira, wIdTipoInvest : String;
  iIdHistCustodia            : Integer;  

implementation

{$R *.DFM}

uses DBasedados;

// Procedimentos do Padrão

procedure TfrmCadSaldoIniCart.SetParametro(Query: TwwQuery; Param: Longint; Indice: integer);
begin
  Query.Close;
  Query.Params[Indice].Value := Param;
  Query.Open
end;

procedure TfrmCadSaldoIniCart.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then Begin
       PreencheInvest := false;
       SetParametro(qry, StrToInt(MontaSelect.ValoresChave[0]), 0);
       PreencheInvest := true;

       qryTipoInvest.Locate('IDTIPOINVEST',StrToInt(MontaSelect.ValoresChave[1]),[]);
       cboTipoInvest.Text := qryTipoInvest.FieldByName('DescTipoInvest').AsString;
       cboTipoInvest.LookupValue := MontaSelect.ValoresChave[1];
       cboTipoInvest.RefreshDisplay;

       qryInvestimento.Locate('IDINVESTIMENTO', qry.FieldByName('IdInvestimento').AsInteger,[]);
       cboInvestimento.Text := qryInvestimento.FieldByName('DescInvestimento').AsString;
       cboInvestimento.LookupValue := qry.FieldByName('IdInvestimento').AsString;

       qryCarteira.Locate('IdCarteiraInvest',qry.FieldByName('IdCarteiraInvest').AsInteger,[]);
       cboCarteira.Text := qryCarteira.FieldByName('DESCCARTINVEST').AsString;
       cboCarteira.LookupValue := qry.FieldByName('IdCarteiraInvest').AsString;

       qryContrato.Locate('IdLote',qry.FieldByName('IdLote').AsString,[]);
       cboLote.Text := qryContrato.FieldByName('IdLote').AsString;
       cboLote.LookupValue := qry.FieldByName('IdLote').AsString;
       cboLote.RefreshDisplay;

       with qryAchaCustodia do begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('CARTEIRA').asInteger     := qryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;
            ParamByName('INVESTIMENTO').asInteger := qryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
            ParamByName('IDLOTE').asString := qryContrato.FieldByName('IDLOTE').asString;
            Open;
       end;

       QryBuscaCustodiante.Locate('IDCUSTODIANTE',QryAchaCustodia.FieldByName('IDCUSTODIANTE').AsInteger,[]);
       LkcCustodiante.Text := QryBuscaCustodiante.FieldByName('SGLCUSTODIANTE').AsString;
       LkcCustodiante.LookupValue := QryBuscaCustodiante.FieldByName('IDCUSTODIANTE').AsString;

  End;
end;

procedure TfrmCadSaldoIniCart.CmeCadastroEdit(Sender: TObject);
begin
  cboCarteira.Enabled     := false;
  cboInvestimento.Enabled := false;
  cboTipoInvest.Enabled   := false;
  cboLote.Enabled         := false;
  inherited;
  PreencheInvest          := true;
end;

procedure TfrmCadSaldoIniCart.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  PreencheInvest          := False;
  cboCarteira.Enabled     := True;
  cboInvestimento.Enabled := True;
  cboTipoInvest.Enabled   := True;
  cboLote.Enabled         := True;
end;

procedure TfrmCadSaldoIniCart.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  cboCarteira.Enabled     := True;
  cboInvestimento.Enabled := True;
  cboTipoInvest.Enabled   := True;
  cboLote.Enabled         := True
end;

procedure TfrmCadSaldoIniCart.CmeCadastroDelete(Sender: TObject);
begin
   FlgHistCartInv(qry.FieldByName('IdHistCartInv').AsInteger, 'EXC');
  inherited;
   OperComum.AtualizaSaldos(wQtdCotaini,-1);
   if qryCarteira.FieldByName('IDCARTEIRAGERENC').AsInteger = 0 then
   begin
      with qryAchaCustodia do begin
         Close;
         if not(Prepared) then Prepare;
         ParamByName('CARTEIRA').asInteger     := qryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;
         ParamByName('INVESTIMENTO').asInteger := qryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
         ParamByName('IDLOTE').asString := qryContrato.FieldByName('IDLOTE').asString;
         Open;
      end;

      MarcaFlgHistCustodia (qryAchaCustodia.FieldByName('IDCUSTODIA').AsInteger, -1,-1);

      ExecutaQuery(QryAux,'DELETE FROM HISTCUSTODIA WHERE IDCUSTODIA = '''+
                          qryAchaCustodia.FieldByName('IDCUSTODIA').AsString+'''');

   // Atualiza Saldos da Custodia
      OperacaoInvest.AtualizaSaldosCustodia;
   end;

end;

//  Métodos do Formulário
procedure TfrmCadSaldoIniCart.FormCreate(Sender: TObject);
begin
  Inherited;
  SetParametro(qry, -1, 0);
  qryCarteira.Open;
  qryInvestimento.Open;
  qryTipoInvest.Open;
  qryContrato.Open;
  PreencheInvest     := false;
  Query              := TwwQuery.Create(Self);
  Query.DatabaseName := 'BaseDados';

  FazQuery(Query, 'Select VlrCotaIniCart,MoeCodigo From ParamInvest');
  wQtdCotaini := Query.FieldByName('VlrCotaIniCart').AsFloat;
  wMoeCodigo  := Query.FieldByName('MoeCodigo').AsInteger;

  MontaSelect.Filtro.Add('HISTCARTINV.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrevCtbPatro));

end;

procedure TfrmCadSaldoIniCart.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Qry.Close;
  QryInvestimento.Close;
  QryCarteira.Close;
  QryContrato.Close;
  QryTipoInvest.Close;
  Query.Close;
  Query.Free;
  Query := nil;
  QryBuscaCustodiante.Close;

  inherited
end;

procedure TfrmCadSaldoIniCart.bbtnConfirmarClick(Sender: TObject);
var
   fSALDO, fValorCota, fSaldoInicialCotas, fSaldoInicialValor, Cotacao : Double;
   sqlq, Ope: string;
   IdOperCustodia,IdHistCartInv: integer;
   Insere, Edita: boolean;
   DataCotacao: TDateTime;
   QrySaldoCarteira: TwwQuery;
   CarteiraGerenc : String;
begin
  IdOperCustodia := -1;

  If Trim(cboInvestimento.Text) = '' Then Begin
    MsgDlg('O Investimento deve ser informado. ', 'Mensagem do Sistema',
           MtError, [MbOk], 0);
    if cboInvestimento.CanFocus then
       cboInvestimento.SetFocus;
    exit;
  End;

  If Trim(cboTipoInvest.Text) = '' Then Begin
    MsgDlg('O Investimento deve ser informado. ', 'Mensagem do Sistema', MtError, [MbOk], 0);
    if cboTipoInvest.CanFocus then
       cboTipoInvest.SetFocus;
    exit;
  End;

  If Trim(LkcCustodiante.Text) = '' Then Begin
    MsgDlg('O Custodiante deve ser informado. ', 'Mensagem do Sistema', MtError, [MbOk], 0);
    if LkcCustodiante.CanFocus then
       LkcCustodiante.SetFocus;
    exit;
  End;

  Try
     If Not dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.StartTransaction;
     try
        Edita := false;
        Insere:= false;
        Screen.Cursor := crHourGlass;
        Investimento  := qry.FieldByName('IdInvestimento').AsInteger;
        Carteira      := qry.FieldByName('IdCarteiraInvest').AsInteger;
        Lote := qry.FieldByName('IdLote').AsString;
        sqlq := '';
        // Atribuição de valores prédefinidos e críticas
        if qry.State in [dsInsert, dsEdit] then
        begin
             if qry.State in [dsInsert] then
             begin
                Insere := true;
                qry.FieldByName('IDHISTCARTINV').AsInteger   := LeUltRegistro(nil,'HistCartInv');
             end;

             IdHistCartInv := qry.FieldByName('IDHISTCARTINV').AsInteger;

             qry.FieldByName('DATAMOVCARTINV').AsDateTime := StrToDate(dbeData.Text);
             // Atribui valores constantes
             qry.FieldByName('TIPMOVCARTINV').AsString   := 'INI';
             qry.FieldByName('NATURMOVCARTINV').AsString := 'A';
             qry.FieldByName('FLGCUSTODIA').AsString     := '';
             qry.FieldByName('HISTMOVCARTINV').AsString  := 'Saldo Inicial';
             qry.FieldByName('IDMODULO').AsInteger       := Sistema.IdModulo;
             qry.FieldByName('IDEMPRESAPROP').AsInteger  := Sistema.IdEmpresa;
             qry.FieldByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

             // Atribui Saldo igual a VlrMovInvCart
             qry.FieldByName('VLRMOVCARTINV').AsFloat :=
                 qry.FieldByName('SALDOVLRINVCART').AsFloat;

             // Atribui Saldos aos Movimentos
             qry.FieldByName('QTDEMOVINVCART').AsFloat :=
                 qry.FieldByName('SALDOQTDEINVCART').AsFloat;

             qry.FieldByName('MOVIMATU').AsFloat :=
                 qry.FieldByName('SALDOATU').AsFloat;

             qry.FieldByName('MOVIMCAR').AsFloat :=
                 qry.FieldByName('SALDOCAR').AsFloat;

             qry.FieldByName('MOVIMAQUI').AsFloat :=
                 qry.FieldByName('SALDOAQUI').AsFloat;

             // Calcula SaldoCotasCartInv. Sai se valor inicial não existir
             If wQtdCotaini <= 0 Then Begin
                  MessageBox(Handle, 'Número inicial de cotas não foi devidamente '+
                             'parametrizado.','Erro',MB_APPLMODAL or MB_OK or
                             MB_ICONEXCLAMATION);
                  bbtnCancelarClick(Sender);
                  Exit;
             End;

             QrySaldoCarteira := TwwQuery(dtmOperacaoInvest.qrySaldoCarteira);
             With QrySaldoCarteira Do Begin
               Close;
               ParamByName('IDCARTEIRA').asInteger := qry.FieldByName('IDCARTEIRAINVEST').AsInteger;
               ParamByName('IDCARTEIRAGERENC').asInteger := qry.FieldByName('IDCARTEIRAGERENC').AsInteger;
               If qry.FieldByName('IDCARTEIRAGERENC').AsInteger = 0 Then
                  ParamByName('IDCARTEIRAGERENC').Clear;
               ParamByName('DATAMOV').asDateTime   := qry.FieldByName('DATAMOVCARTINV').AsDateTime;
               ParamByName('IDHISTORICO').asInteger:= high(integer);
               Open;
               First;
             End;

   // Verifica se esta será a primeira movimentação da carteira
             If QrySaldoCarteira.IsEmpty then begin
                qry.FieldByName('COTASMOVCARTINV').AsFloat :=
                     qry.FieldByName('SALDOVLRINVCART').AsFloat / wQtdCotaini;
                qry.FieldByName('SALDOCOTASCARTINV').AsFloat :=
                     qry.FieldByName('SALDOVLRINVCART').AsFloat / wQtdCotaini;
                qry.FieldByName('SALDOVLRCARTINV').AsFloat :=
                     qry.FieldByName('SALDOVLRINVCART').AsFloat;
             End Else Begin
               qry.FieldByName('SALDOVLRCARTINV').AsFloat :=
                   QrySaldoCarteira.FieldByName('SALDOVLRCARTINV').AsFloat +
                   qry.FieldByName('SALDOVLRINVCART').AsFloat;
             End;

             //Calcula SaldoAtu e SaldoCar
             FazQuery(Query, 'SELECT MOEDAATU FROM PARAMINVEST');
             //if Cotacao = 0 then  {Removido - em teste}
             If Not OperComum.BuscaCotacaoMoeda(Query.FieldByName
                        ('MoedaAtu').AsInteger, qry.FieldByName('DataMovCartInv').
                        AsDateTime,'',Cotacao, DataCotacao) then
             Begin
                  MsgDlg('Moeda de indexação do valor atuarial não foi '+
                         'devidamente cadastrada', 'Erro', MTWARNING, [MBOK],0);
                  bbtnCancelarClick(Sender);
                  exit
             End;
// Preenche campo de SALDO ATUARIAL e CUSTO DE CARREGAMENTO com o Valor de Tela
// Dividido pela pela Cotacao da Moeda Atuarial
             Qry.FieldByName('SALDOATU').AsFloat :=
               (EdSaldoAtuarial.Value / Cotacao);
             Qry.FieldByName('SALDOCAR').AsFloat :=
               (EdCustoCarregamento.Value / Cotacao);
// Copia Valores para os Campos de Movimento
             Qry.FieldByName('MOVIMATU').AsFloat :=Qry.FieldByName('SALDOATU').AsFloat;
             Qry.FieldByName('MOVIMCAR').AsFloat :=Qry.FieldByName('SALDOCAR').AsFloat;
        end;

        Investimento  := qry.FieldByName('IDINVESTIMENTO').AsInteger;
        Carteira      := qry.FieldByName('IDCARTEIRAINVEST').AsInteger;
        CarteiraGerenc:= qry.FieldByName('IDCARTEIRAGERENC').AsString;
        If Length(Trim(CarteiraGerenc)) = 0 Then
           CarteiraGerenc := 'NULL';

        wIdCarteira   :=qry.FieldByName('IDCARTEIRAINVEST').AsString;
        wIdTipoInvest :=qry.FieldByName('IDTIPOINVEST').AsString;

        Lote := qry.FieldByName('IdLote').AsString;
        sqlq := '';

        if Trim(Lote) <> '' then
           sqlq := ' and IdLote='+#39+Lote+#39
        else
           sqlq := ' and IdLote Is Null';

        // Verifica se um "INI", Carteira e Investimento já existem na tabela
        if qry.State in [dsInsert] then
        begin
           if FazQuery(Query, 'Select IdHistCartInv From HistCartInv Where '+
                       'DataMovCartInv='+#39+dbeData.Text+#39+
                       ' and TIPMOVCARTINV = ''INI'''+
                       ' and IdCarteiraInvest='+IntToStr(Carteira)+
                       ' and IDCARTEIRAGERENC = '+CarteiraGerenc+
                       ' and IdInvestimento='+IntToStr(Investimento) + sqlq) then
           begin
               MessageBox(Handle, 'O investimento informado já foi inicializado'+
                             ' anteriormente.','Erro [Inicialização de Histórico',
                             MB_APPLMODAL or MB_OK or MB_ICONEXCLAMATION);
               bbtnCancelarClick(Sender);
               SetParametro(qry, Query.FieldByName('IdHistCartInv').AsInteger,0);
               PreencheInvest := true;
               Exit;
           end;
        end;

        if qry.State in [dsEdit] then begin
          Edita := true;
          Ope   := 'ALT'
        end else begin
          Edita := true;
          Ope   := 'INC'
        end;

        //Al_1
        qry.ApplyUpdates;
        qry.CommitUpdates;

        // Só insere custódia se não for Carteira Gerencial
        if qryCarteiraIDCARTEIRAGERENC.AsInteger = 0 then
        begin
           IdOperCustodia := LeUltRegistro(Nil,'OPERCUSTODIA');
           // Atribui chave primária da tabela
           if Insere then
           begin
              //Al_1
              OperacaoInvest.AlimentaOperCustodia(
                    IdOperCustodia,-1,-1,IdHistCartInv,IdHistCartInv,
                    Carteira,
                    Carteira,
                    Investimento,
                    StrToInt(LkcCustodiante.LookupValue),
                    StrToInt(LkcCustodiante.LookupValue),
                    -1,-1,
                    qry.FieldByName('SALDOQTDEINVCART').AsFloat,
                    qry.FieldByName('DATAMOVCARTINV').AsDateTime,
                    qry.FieldByName('IdLote').AsString, '',
                    -1);

              OperacaoInvest.InsereCustodia(
                    qry.FieldByName('IDCARTEIRAINVEST').AsInteger,
                    qry.FieldByName('IDINVESTIMENTO').AsInteger,
                    StrToInt(LkcCustodiante.LookupValue),
                    -1, -1,
                    IdOperCustodia,
                    qry.FieldByName('IdLote').AsString,  'I',
                    qry.FieldByName('DATAMOVCARTINV').AsDateTime,
                    qry.FieldByName('SALDOQTDEINVCART').AsFloat,iIdHistCustodia);
           end
           else
           begin
              //Al_1
              OperacaoInvest.AlimentaOperCustodia(
                    IdOperCustodia,-1,-1,IdHistCartInv,IdHistCartInv,
                    Carteira,
                    Carteira,
                    Investimento,
                    StrToInt(LkcCustodiante.LookupValue),
                    StrToInt(LkcCustodiante.LookupValue),
                    -1,-1,
                    qry.FieldByName('SALDOQTDEINVCART').AsFloat,
                    qry.FieldByName('DATAMOVCARTINV').AsDateTime,
                    qry.FieldByName('IdLote').AsString, '',
                    -1);

              OperacaoInvest.InsereCustodia(
                    qry.FieldByName('IDCARTEIRAINVEST').AsInteger,
                    qry.FieldByName('IDINVESTIMENTO').AsInteger,
                    StrToInt(LkcCustodiante.LookupValue),
                    -1, -1,
                    IdOperCustodia,                    
                    qry.FieldByName('IdLote').AsString,  'I',
                    qry.FieldByName('DATAMOVCARTINV').AsDateTime,
                   (qry.FieldByName('SALDOQTDEINVCART').AsFloat -
                    qry.FieldByName('SALDOQTDEINVCART').OldValue),iIdHistCustodia);
           end;

           OperacaoInvest.AtualizaSaldosCustodia;
           
        end;

        //Marca flag de calculo de saldo
        if Edita then
        begin
             FlgHistCartInv(IdHistCartInv, Ope);
             OperComum.AtualizaSaldos(wQtdCotaini,-1);
             // Se existir o lote altera SaldoTitLote em ContratoInvestim
             if Trim(cboLote.Text) <> '' then
                ExecutarQuery(Query,
                              'UPDATE CONTRATOINVESTIM SET SALDOTITLOTE = '+
                               IntToStr(qry.FieldByName('SALDOQTDEINVCART').AsInteger)+' '+
                              ' WHERE IDINVESTIMENTO ='+IntToStr(Investimento)+' AND '+' '+
                              'IDLOTE ='+#39+qry.FieldByName('IDLOTE').AsString+#39);

        end;

     except
           dtmBaseDados.dbBaseDados.Rollback;
           raise;
     end;
  finally
         if dtmBaseDados.dbBaseDados.Intransaction then
            dtmBaseDados.dbBaseDados.Commit;

         Screen.Cursor := crDefault
  end;
  inherited;
  pgcDetalhes.ActivePage := tbsSaldos;
  if cboInvestimento.CanFocus then
     cboInvestimento.SetFocus;
end;

procedure TfrmCadSaldoIniCart.cboCarteiraChange(Sender: TObject);
begin
     inherited;
     if qry.State in [dsEdit, dsInsert] then
        if Trim(qryCarteira.FieldByName('DataInicio').AsString) ='' then begin
             MessageBox(Handle,'A Carteira selecionada não possui data de início.'+#10+
                               'Altere o cadastro da Carteira para continuar',
                               'Erro', MB_OK or MB_APPLMODAL or MB_ICONEXCLAMATION);
             bbtnCancelarClick(Sender);
             Exit
        end;
end;

procedure TfrmCadSaldoIniCart.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  qryCarteira.Locate('IdCarteiraInvest',qry.FieldByName('IdCarteiraInvest').AsInteger,[])
end;

procedure TfrmCadSaldoIniCart.qryAfterScroll(DataSet: TDataSet);
Var
  Cotacao     : Double;
  DataCotacao : TDateTime;
begin
  inherited;
// Busca Moeda Atuarial
  FazQuery(QryAux,'SELECT MOEDAATU FROM PARAMINVEST');
// Busca as Cotacoes
  OperComum.BuscaCotacaoMoeda(QryAux.FieldByName('MOEDAATU').AsInteger,
                                   Qry.FieldByName('DATAMOVCARTINV').AsDateTime,
                                   '',Cotacao, DataCotacao);
  EdCustoCarregamento.Text := FloatToStr(Qry.FieldByName('SALDOCAR').AsFloat * Cotacao);
  EdSaldoAtuarial.Text     := FloatToStr(Qry.FieldByName('SALDOATU').AsFloat * Cotacao);
end;

procedure TfrmCadSaldoIniCart.EdSaldoAtuarialExit(Sender: TObject);
begin
  inherited;
  If Qry.State In [DsInsert] Then
     EdCustoCarregamento.Value := EdSaldoAtuarial.Value;
end;

procedure TfrmCadSaldoIniCart.bbtnCancelarClick(Sender: TObject);
Var
  Cotacao    : Double;
  DataCotacao: TDateTime;
begin
  Inherited;
// Busca Moeda Atuarial
  FazQuery(QryAux,'SELECT MOEDAATU FROM PARAMINVEST');
// Busca as Cotacoes
  OperComum.BuscaCotacaoMoeda(QryAux.FieldByName('MOEDAATU').AsInteger,
                                   Qry.FieldByName('DATAMOVCARTINV').AsDateTime,
                                   '',Cotacao, DataCotacao);
  EdCustoCarregamento.Text := FloatToStr(Qry.FieldByName('SALDOCAR').AsFloat * Cotacao);
  EdSaldoAtuarial.Text     := FloatToStr(Qry.FieldByName('SALDOATU').AsFloat * Cotacao);
  pgcDetalhes.ActivePage   := tbsSaldos;

  qryCarteira.Locate('IDCARTEIRAINVEST;IDCARTEIRAGERENC',
          VarArrayOf([Qry.FieldByName('IDCARTEIRAINVEST').AsInteger,
                      Qry.FieldByName('IDCARTEIRAGERENC').AsInteger]),[loPartialKey]);

  cboCarteira.Text := qryCarteira.FieldByName('DESCCARTINVEST').AsString;
end;

procedure TfrmCadSaldoIniCart.FormShow(Sender: TObject);
begin
  inherited;
  wIdCarteira   :='';
  wIdTipoInvest :='';
  QryBuscaCustodiante.Open;
  QryCarteira.Open;
end;

procedure TfrmCadSaldoIniCart.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  If wIdCarteira <> '' Then Begin
    If Qry.State In [DsInsert, DsEdit] Then Begin

      qry.FieldByName('IDCARTEIRAINVEST').AsString:=wIdCarteira;
      cboCarteira.RefreshDisplay;

      qry.FieldByName('IDTIPOINVEST').AsString:=wIdTipoInvest;
      cboTipoInvest.RefreshDisplay;
    End;
  End;
  if cboCarteira.CanFocus then
     cboCarteira.SetFocus;
end;

procedure TfrmCadSaldoIniCart.qryContratoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  If QryContrato.RecordCount = 1 Then Begin
    cboLote.LookupValue := QryContrato.FieldByName('IDLOTE').AsString;
    cboLote.RefreshDisplay;
  End Else If QryContrato.RecordCount <> 1 Then Begin
    cboLote.LookupValue := '';
    cboLote.Text := '';
  End;
end;
procedure TfrmCadSaldoIniCart.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then      //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)

end;

procedure TfrmCadSaldoIniCart.cboCarteiraExit(Sender: TObject);
begin
  inherited;
   Qry.FieldByName('IDCARTEIRAINVEST').AsInteger :=
        QryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;

   Qry.FieldByName('IDCARTEIRAGERENC').AsInteger :=
        QryCarteira.FieldByName('IDCARTEIRAGERENC').AsInteger;

   If QryCarteira.FieldByName('IDCARTEIRAGERENC').AsInteger = 0 Then
      Qry.FieldByName('IDCARTEIRAGERENC').Clear;

   dbeData.Date := QryCarteira.FieldByName('DATAINICIO').AsDateTime;
end;

procedure TfrmCadSaldoIniCart.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
     If MontaSelect.ValoresChave[3] <> '' Then
     Begin
        If QryCarteira.Locate('IDCARTEIRAINVEST;IDCARTEIRAGERENC',
                    VarArrayOf([MontaSelect.ValoresChave[2],MontaSelect.ValoresChave[3]]),
                    [loPartialKey]) Then
           cboCarteira.Text := QryCarteira.FieldByName('DESCCARTINVEST').AsString
     End
     Else
     Begin
        If QryCarteira.Locate('IDCARTEIRAINVEST',MontaSelect.ValoresChave[2], [loPartialKey]) Then
           cboCarteira.Text := QryCarteira.FieldByName('DESCCARTINVEST').AsString
     End;
     dbeData.Date := StrToDate(MontaSelect.ValoresChave[4]);
  end;
end;

procedure TfrmCadSaldoIniCart.sbtnApagarClick(Sender: TObject);
begin
    //AL_2
    if MsgDlg('Confirma a Exclusão ?', 'Mensagem do Sistema ', mtConfirmation , [mbYes, mbNo], 0) = mrNo Then
       Exit;

    Try
       If Not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;

       OperComum.LimpaParametros(QrySelOperCustodia);
       QrySelOperCustodia.ParamByName('IDHISTCARTINVDEST').AsInteger :=
                               Qry.FieldByName('IDHISTCARTINV').AsInteger;
       QrySelOperCustodia.Open;

       OperComum.LimpaParametros(QryDelHistCustodia);
       QryDelHistCustodia.ParamByName('IDOPERCUSTODIA').AsInteger :=
                               QrySelOperCustodia.FieldByName('IDOPERCUSTODIA').AsInteger;
       QryDelHistCustodia.ExecSQL;

       OperComum.LimpaParametros(QryDelOperCustodia);
       QryDelOperCustodia.ParamByName('IDOPERCUSTODIA').AsInteger :=
                               QrySelOperCustodia.FieldByName('IDOPERCUSTODIA').AsInteger;
       QryDelOperCustodia.ExecSQL;

       QrySelOperCustodia.Close;

       Qry.Delete;
       Qry.CommitUpdates;

       if dtmBaseDados.dbBaseDados.Intransaction then
          dtmBaseDados.dbBaseDados.Commit;


       cboCarteira.Text    := '';
       dbeData.Text        := '';
       cboTipoInvest.Text  := '';
       LkcCustodiante.Text := '';

       sbtnApagar.Enabled  := False;
       sbtnAlterar.Enabled := False;
       pnlFundo.Enabled    := False;

    Except
       MessageBox(Handle, 'Não foi possível excluir o registro.',
                          'Erro',MB_APPLMODAL or MB_OK or MB_ICONEXCLAMATION);
       bbtnCancelarClick(Sender);
    End;

end;

end.


