//*****************************************************************************
// Data	     : 08/02/2007
// Código    : AL_3
// Pendencia : 20704
// SOL       : 36184
// Motivo(S) : Ajuste na implementação abaixo, que foi liberada para o padrão 14
//               Ajustes no montaselect e nos dbLookUp
//*****************************************************************************
// Data	     : 08/02/2007
// Código    : AL_2
// Pendencia : 20704
// SOL       : 36184
// Motivo(S) : Implementação da Cadastro de Conselheiro
//*****************************************************************************
// Data     : 04/08/2004
// Código   : AL_1
// Motivo   : Diminuição manual do tamanho do form para sumir com a orelha de
//            enquadramento
//            DFM - Propriedade Visible da orelha Enquadramento recebe False
//*****************************************************************************

unit FCadCarteira;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, wwdblook, StdCtrls, Mask, wwdbedit, MontaSelect, DBTables,
  Db, Wwdatsrc, Wwquery, TB97, MAHlpBtn, Buttons, ExtCtrls, TB97Ctls,
  TB97Tlbr, DBCtrls, IvDictio, IvMulti, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList, IvEMulti, FCadastroCSInv, fcLabel,
  //AL_2
  uRendaVariavel;

type
  TfrmCadCarteira = class(TfrmCadastroCSInv)
    QryGestor: TwwQuery;
    DSGestor: TwwDataSource;
    qryAux: TwwQuery;
    //AL_3
    QryTabClassif: TwwQuery;
    QryClassificacao: TwwQuery;
    QryEnquadramento: TwwQuery;
    DsEnquadramento: TwwDataSource;
    UpdEnquadra: TUpdateSQL;
    QryEnquadramentoIDINVESTIMENTO: TFloatField;
    QryEnquadramentoCODTABCLASSINV: TStringField;
    QryEnquadramentoCODCLASSINVEST: TStringField;
    QryEnquadramentoDTENQUADRA: TDateTimeField;
    QryEnquadramentoIDCARTEIRAINVEST: TFloatField;
    QryEnquadramentoDESCTABCLASSINV: TStringField;
    QryEnquadramentoDESCCARTINVEST: TStringField;
    QryEnquadramentoDESCCLASSINVEST: TStringField;
    //AL_3
    qryData: TwwQuery;
    Label4: TLabel;
    //AL_3
    QryPlano: TwwQuery;
    QryPlanoIDPLANOPREV: TFloatField;
    qryPatro: TwwQuery;
    qryPatroNOME: TStringField;
    qryPatroIDPESSOA: TFloatField;
    //AL_3
    QryPlanoNOME: TStringField;
    //AL_3
    QryTipoInvestimento: TwwQuery;
    qryMercado: TwwQuery;
    Label8: TLabel;
    //AL_3
    qryMercadoDESCMERCADO: TStringField;
    qryMercadoIDMERCADO: TFloatField;
    QryTipoInvestimentoIDTIPOINVEST: TFloatField;
    QryTipoInvestimentoDESCTIPOINVEST: TStringField;
    //AL_3
    qryIDCARTEIRAINVEST: TFloatField;
    qryDESCCARTINVEST: TStringField;
    qryIDGESTORCARTEIRA: TFloatField;
    qryFLGCARTPROP: TFloatField;
    qryFLGCALCDIARIO: TStringField;
    qryDATAINICIO: TDateTimeField;
    qryFLGTRATALOTE: TStringField;
    qryIDPLANOPREV: TFloatField;
    qryIDPATROCINADORA: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryIDMERCADO: TFloatField;
    qryFLGORDMOVINV: TStringField;
    //AL_3
    qryFLGCARTLASTRO: TStringField;
    //AL_3
    qryFLGCARTTERC: TStringField;
    //AL_3
    pnlCombos: TPanel;
    Label2: TLabel;
    DBENomeCarteira: TwwDBEdit;
    Label1: TLabel;
    DBLkGestor: TwwDBLookupCombo;
    Label5: TLabel;
    DBLkPatro: TwwDBLookupCombo;
    DbLkTipoMercado: TwwDBLookupCombo;
    Label9: TLabel;
    DbLkTipoInvestimento: TwwDBLookupCombo;
    Label7: TLabel;
    DBLkPlano: TwwDBLookupCombo;
    Label6: TLabel;
    lblConselheiro: TLabel;
    dblkConselheiro: TwwDBLookupCombo;
    qryConselheiro: TwwQuery;
    pnlDetalhes: TPanel;
    Label3: TLabel;
    dbdtDataInicio: TCMDateTimePicker;
    DBCkBCartProp: TDBCheckBox;
    DBCkBFLGCARTTERC: TDBCheckBox;
    dbckCartLastro: TDBCheckBox;
    DBCkBOrdemMov: TDBCheckBox;
    DbRdAtualiza: TDBRadioGroup;
    qryConselheiroIDCONSELHINVEST: TFloatField;
    qryConselheiroDESCONSELINVEST: TStringField;
    qryIDCONSELHINVEST: TFloatField;
    procedure bbtnConfirmarClick(Sender: TObject);

    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure DbLkcTabClassifChange(Sender: TObject);
    procedure SB1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    DataAnterior: TDate;
    sInsere     : Boolean;

  end;

var
  frmCadCarteira: TfrmCadCarteira;

implementation

Uses
  UmensErro,UDataBase, USistema, UBibliotecaInvest, FBuscaClassif;
{$R *.DFM}

procedure TfrmCadCarteira.CmeCadastroInsert(Sender: TObject);
begin
   with qry do
   begin
   	Close;
        SQL.Clear;
        SQL.Add('SELECT CI.IDCARTEIRAINVEST,CI.DESCCARTINVEST,CI.IDGESTORCARTEIRA, ');
        SQL.Add('       CI.FLGCARTPROP, CI.FLGCALCDIARIO, CI.DATAINICIO,           ');
        SQL.Add('       FLGTRATALOTE, CI.IDPLANOPREV, CI.IDPATROCINADORA,          ');
        SQL.Add('       CI.IDTIPOINVEST, CI.IDMERCADO, CI.FLGORDMOVINV,CI.FLGCARTLASTRO,');
        //AL_2
        SQL.Add('       CI.FLGCARTTERC, CI.IDCONSELHINVEST                         ');
        SQL.Add('FROM '+ Sistema.PrefixoServidor +'CARTEIRAINVEST CI               ');
        SQL.Add('WHERE 1 = 2                                                       ');
        Prepare;
        Open;
   end;
   inherited;
end;

procedure TfrmCadCarteira.CmeCadastroFind(Sender: TObject);
begin
   if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
   begin
   	with qry do
       begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT CI.IDCARTEIRAINVEST,CI.DESCCARTINVEST,CI.IDGESTORCARTEIRA, ');
        SQL.Add('       CI.FLGCARTPROP, CI.FLGCALCDIARIO, CI.DATAINICIO,           ');
        SQL.Add('       FLGTRATALOTE, CI.IDPLANOPREV, CI.IDPATROCINADORA,          ');
        SQL.Add('       CI.IDTIPOINVEST, CI.IDMERCADO, CI.FLGORDMOVINV,CI.FLGCARTLASTRO, ');
        //AL_2
        SQL.Add('       CI.FLGCARTTERC, CI.IDCONSELHINVEST                         ');
        SQL.Add('FROM '+ Sistema.PrefixoServidor +'CARTEIRAINVEST CI               ');
        SQL.Add('WHERE CI.IDCARTEIRAINVEST = '+ MontaSelect.ValoresChave[0]         );
        Prepare;
      	Open;
        If qry.FieldByName('FLGORDMOVINV').AsString = '' Then
           DBCkBOrdemMov.Checked := False;
        If qry.FieldByName('FLGCARTLASTRO').AsString = '' Then
           dbckCartLastro.Checked := False;
        If qry.FieldByName('FLGCARTTERC').AsString = '' Then
           DBCkBFLGCARTTERC.Checked := False;

       end;
   end
   Else
     DBCkBOrdemMov.Checked := False;
   inherited;
   DataAnterior := qry.FieldByName('DataInicio').AsDateTime
end;

procedure TfrmCadCarteira.bbtnConfirmarClick(Sender: TObject);
begin
   //AL_3
   if Trim(DbLkTipoInvestimento.Text) = '' then
   begin
      MsgDlg('Tipo de Investimento não informado.','Atenção',mtWarning,[mbOK],0);
      if DbLkTipoInvestimento.CanFocus then
         DbLkTipoInvestimento.SetFocus;
      exit;
   end;

   if Trim(dbdtDataInicio.Text) = '' then
   begin
      MsgDlg('Data de Inicio não pode estar vazia.','Atenção',mtWarning,[mbOK],0);
      if dbdtDataInicio.CanFocus then
         dbdtDataInicio.SetFocus;
      exit;
   end;

   if Trim(dbeNomeCarteira.Text) = '' then
   begin
      MsgDlg('Nome da Carteira deve ser informado. ','Atenção',mtWarning,[mbOK],0);
      if dbeNomeCarteira.CanFocus then
         dbeNomeCarteira.SetFocus;
      exit;
   end;

   if ds.DataSet.State in [dsInsert] then
      if qry.FieldByName('IDCARTEIRAINVEST').AsInteger <=0 then
         qry.FieldByName('IDCARTEIRAINVEST').AsInteger := LeUltRegistro(nil,'CARTEIRAINVEST');

   qryData.Close;
   qryData.SQL.Clear;
   qryData.SQL.Add('Select Min(H.DataMovCartInv) as DataMovCartInv'+
                   ' From HistCartInv H Where IdCarteiraInvest='+
                   qry.FieldByName('IdCarteiraInvest').AsString);
   qryData.Open;

   If (Qry.State In [DsInsert]) Or
     (QryData.FieldByName('DataMovCartInv').AsDateTime = 0) Then Begin
     DataAnterior := Qry.FieldByName('DataInicio').AsDateTime;
   End;

   If (StrToDate(dbdtDataInicio.Text) >= QryData.FieldByName('DataMovCartInv').AsDateTime) Then
      qry.FieldByName('DataInicio').AsDateTime := DataAnterior
   Else
   Begin
        qryData.Close;
        qryData.SQL.Clear;
        qryData.SQL.Add('Select TipMovCartInv From HistCartInv Where '+
                        'IdCarteiraInvest='+qry.FieldByName('IdCarteiraInvest').AsString+
                        ' and TipMovCartInv='+#39+'INI'+#39);
        qryData.Open;
        if (not qryData.IsEmpty) And (DataAnterior <> 0) then
           qry.FieldByName('DataInicio').AsDateTime := DataAnterior
   end;

   inherited;
   qryData.Close;
   PnlFundo.Enabled := True;
  //AL_3

end;

procedure TfrmCadCarteira.CmeCadastroDelete(Sender: TObject);
begin
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add( 'SELECT HCI.IDCARTEIRAINVEST ');
      SQL.Add( 'FROM '+ Sistema.PrefixoServidor +'HISTCARTINV HCI ');
      SQL.Add( 'WHERE HCI.IDCARTEIRAINVEST = '+qry.FieldByname('IdCarteiraInvest').AsString );

      Prepare;
      Open;

      if not(IsEmpty) then
      begin
         MsgDlg('Carteira Utilizada em Arquivo de Histórico , Não pode ser Excluído',LerMensagem(2),mtError,[mbOk],0);
         exit;
      end;
   end;

   If Not QryEnquadramento.IsEmpty Then Begin
      MsgDlg('Carteira possui enquadramento.','Mensagem do Sistema ',mtWarning,[mbOk],0);
      Exit;
   End;

   inherited;
end;

procedure TfrmCadCarteira.sbtnInserirClick(Sender: TObject);
begin
  sInsere      := True;
  DataAnterior := 0;
  inherited;
   //AL_2
   if qry.State = dsInsert then
   begin
      Qry.FieldByName('FLGCARTPROP').AsInteger  :=0;
      Qry.FieldByName('FLGCALCDIARIO').AsInteger:=0;
      Qry.FieldByName('FLGTRATALOTE').AsString  :='N';
      Qry.FieldByName('FLGORDMOVINV').AsString  :='N';
      Qry.FieldByName('FLGCARTLASTRO').AsString  :='N';
      Qry.FieldByName('FLGCARTTERC').AsString  :='N';

      DBCkBOrdemMov.Checked := False;
   end;
end;

procedure TfrmCadCarteira.FormShow(Sender: TObject);
begin
  inherited;

  DBCkBFLGCARTTERC.Checked:= False;

  QryTabClassif.Open;
  QryClassificacao.Open;
  QryGestor.Open;
  QryPlano.Open;
  QryPatro.Open;
  QryTipoInvestimento.Open;
  QryMercado.Open;
  //AL_2
  qryConselheiro.Open

end;

procedure TfrmCadCarteira.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  FazQuery(QryEnquadramento,
    'SELECT CXI.IDINVESTIMENTO, CXI.CODTABCLASSINV, CXI.CODCLASSINVEST, CXI.DTENQUADRA, '+
    '       CXI.IDCARTEIRAINVEST, TCI.DESCTABCLASSINV, CAR.DESCCARTINVEST,       '+
    '       CIN.DESCCLASSINVEST                                                  '+
    'FROM CLASSINVXINVEST CXI, CARTEIRAINVEST CAR, TABCLASSIFINVEST TCI,'+
    '     CLASSIFINVEST CIN                                                   '+
    'WHERE (CXI.IDCARTEIRAINVEST = '+
      QuotedStr(Qry.FieldByName('IDCARTEIRAINVEST').AsString)+') AND '+
    '      (CXI.IDINVESTIMENTO IS NULL)              AND                         '+
    '      (CXI.IDCARTEIRAINVEST = CAR.IDCARTEIRAINVEST) AND                     '+
    '      (CXI.CODTABCLASSINV = TCI.CODTABCLASSINV) AND                         '+
    '      (TCI.CODTABCLASSINV = CIN.CODTABCLASSINV) AND                         '+
    '      (CXI.CODCLASSINVEST = CIN.CODCLASSINVEST)                             ');


end;

procedure TfrmCadCarteira.DbLkcTabClassifChange(Sender: TObject);
begin
  inherited;

  If Not QryTabClassif.IsEmpty Then Begin
    FazQuery(QryClassificacao,
      'SELECT CODTABCLASSINV, CODCLASSINVEST, DESCCLASSINVEST, CLASSIFANALIT '+
      'FROM CLASSIFINVEST  '+
      'WHERE CLASSIFANALIT  = ''A'' AND '+
      '      CODTABCLASSINV = '+
        QuotedStr(QryTabClassif.FieldByName('CODTABCLASSINV').AsString));
  End;
end;

procedure TfrmCadCarteira.SB1Click(Sender: TObject);
begin
  inherited;
// Carrega Formulario de Consulta de Classificacoes
  Application.CreateForm(TFrmBuscaClassif, FrmBuscaClassif);
  FrmBuscaClassif.wCodTabelaClassif  :=
    QryTabClassif.FieldByName('CODTABCLASSINV').AsString;
  FrmBuscaClassif.wDescTabelaClassif :=
    QryTabClassif.FieldByName('DESCTABCLASSINV').AsString;
// Mostra Formulario
  FrmBuscaClassif.ShowModal;

// Busca Informacao
  If FrmBuscaClassif.wClassifEscolhida <> '' Then
    QryEnquadramento.FieldByName('CODCLASSINVEST').AsString :=
      FrmBuscaClassif.wClassifEscolhida;
// Libera Formulario
  FrmBuscaClassif.Free;
end;

procedure TfrmCadCarteira.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  QryTabClassif.Close;
  QryClassificacao.Close;
  QryTipoInvestimento.Close;
  QryMercado.Close;
  //AL_2
  qryConselheiro.Close;
end;

procedure TfrmCadCarteira.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled:=True;
  //AL_3
  If sInsere = True Then
  Begin
     DBCkBCartProp.Checked := False;
     DBCkBFLGCARTTERC.Checked := False;
     DBCkBOrdemMov.Checked := False;
  End
  Else
  Begin
     If qry.FieldByName('FLGCARTPROP').AsString = '' Then
        DBCkBCartProp.Checked := False
     Else If qry.FieldByName('FLGCARTTERC').AsString = '' Then
        DBCkBFLGCARTTERC.Checked := False
     Else If qry.FieldByName('FLGORDMOVINV').AsString = '' Then
        DBCkBOrdemMov.Checked := False;
  End;
end;

procedure TfrmCadCarteira.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled   :=True;
  //AL_3
end;

procedure TfrmCadCarteira.sbtnAlterarClick(Sender: TObject);
begin
  sInsere      := False;
  inherited;
  //AL_2
   if qry.State = dsEdit then
   begin
      If qry.FieldByName('FLGORDMOVINV').AsString = '' Then
         DBCkBOrdemMov.Checked := False;
      If qry.FieldByName('FLGCARTTERC').AsString = '' Then
         DBCkBFLGCARTTERC.Checked := False;
   end;
end;

procedure TfrmCadCarteira.sbtnApagarClick(Sender: TObject);
begin
  inherited;
   DBCkBCartProp.Checked := False;
   DBCkBFLGCARTTERC.Checked := False;
   DBCkBOrdemMov.Checked := False;
end;

end.










































