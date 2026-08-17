unit FAlteraEvento;
//***************************************************************************************
// Autor(a)     :  Ewerton Beltramini
// Data         :  28/10/2020
// SIG          :  SIG83736
// Descricao    :  Criação de tela para a edição de eventos.
//***************************************************************************************

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Mask, wwdbedit, ComCtrls, Buttons, UConsPart, StdCtrls,
  MontaSelect, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  DBCtrls, Machklb, checklst, UCtrlDocumento, UCtrlLancamento;

type
  TfrmAlteraEvento = class(TfrmOkCancelar)
    qryContribAssociar: TwwQuery;
    qryUltEventoGerador: TwwQuery;
    dtsUltEventoGerador: TwwDataSource;
    qryGrava: TwwQuery;
    qryAux: TwwQuery;
    MontaSelectPart: TMontaSelect;
    lblValores: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    lblPatro: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    edNome: TEdit;
    edPatro: TEdit;
    edMatricula: TEdit;
    edPlano: TEdit;
    Panel5: TPanel;
    Label1: TLabel;
    lblSitPatro: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    edInscNumero: TEdit;
    edSitPatro: TEdit;
    edSitPlano: TEdit;
    edSitFundacao: TEdit;
    Panel3: TPanel;
    bbtnProcurar: TBitBtn;
    pnlInformacao: TPanel;
    Label4: TLabel;
    Label9: TLabel;
    dbedDataEfetivado: TwwDBEdit;
    qryProcessoBenef: TwwQuery;
    dbchkEfetivado: TDBCheckBox;
    qryContribEvento: TwwQuery;
    qryVerificaDataFinal: TwwQuery;
    qryLogOcorrencia: TwwQuery;
    qryEventoTransfPlano: TwwQuery;
    qryDesfazDocumentos: TwwQuery;
    qryAux2: TwwQuery;
    QryAlteraEvendo: TwwQuery;
    QryAlteraEvendoIDEVENTOSPREV: TFloatField;
    QryAlteraEvendoIDSITPLANOATUAL: TFloatField;
    QryAlteraEvendoIDREGRACALCBENEF: TFloatField;
    QryAlteraEvendoIDBENEFICIO: TFloatField;
    QryAlteraEvendoIDPESSOA: TFloatField;
    QryAlteraEvendoIDSITFUNCATUAL: TFloatField;
    QryAlteraEvendoIDEVENTOGERADOR: TFloatField;
    QryAlteraEvendoIDPESSJUR: TFloatField;
    QryAlteraEvendoIDSITPARTATUAL: TFloatField;
    QryAlteraEvendoIDPLANOPREV: TFloatField;
    QryAlteraEvendoIDSITPLANONOVO: TFloatField;
    QryAlteraEvendoIDSITPARTNOVO: TFloatField;
    QryAlteraEvendoDATAREGISTRO: TDateTimeField;
    QryAlteraEvendoDATAEVENTO: TDateTimeField;
    QryAlteraEvendoFLGEFETIVADO: TFloatField;
    QryAlteraEvendoDATAEFETIVADO: TDateTimeField;
    QryAlteraEvendoDATAALTERADO: TDateTimeField;
    QryAlteraEvendoDATAVOLTA: TDateTimeField;
    QryAlteraEvendoFLGSITFUNCIMED: TFloatField;
    QryAlteraEvendoIDSITFUNCNOVO: TFloatField;
    QryAlteraEvendoFLGSITPARTIMED: TFloatField;
    QryAlteraEvendoFLGSITPLANOIMED: TFloatField;
    QryAlteraEvendoSEQPROPOSTA: TFloatField;
    QryAlteraEvendoFLGTPDEMISSAO: TFloatField;
    QryAlteraEvendoIDREGRARESGATE: TFloatField;
    QryAlteraEvendoFLGCOBROUPATRO: TFloatField;
    QryAlteraEvendoTRGDTINCLUSAO: TDateTimeField;
    QryAlteraEvendoTRGUSERINCLUSAO: TStringField;
    QryAlteraEvendoSALPARTICIPACAO: TFloatField;
    QryAlteraEvendoINSCRICAONUMERO: TFloatField;
    QryAlteraEvendoFLGMIGRADO: TFloatField;
    QryAlteraEvendoDATAREQUERIMENTO: TDateTimeField;
    QryAlteraEvendoMATRICULA: TStringField;
    QryAlteraEvendoIDCALCULO: TFloatField;
    QryAlteraEvendoIDCONCESSAOBENEFICIOWEB: TFloatField;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DsAlteraEvendo: TDataSource;
    Label11: TLabel;
    DBEdit2: TDBEdit;
    Label13: TLabel;
    DBEdit3: TDBEdit;
    Label14: TLabel;
    DBEdit4: TDBEdit;
    Label15: TLabel;
    DBEdit5: TDBEdit;
    Label16: TLabel;
    DBEdit6: TDBEdit;
    Label17: TLabel;
    DBEdit7: TDBEdit;
    Label18: TLabel;
    DBEdit8: TDBEdit;
    Label19: TLabel;
    DBEdit9: TDBEdit;
    Label20: TLabel;
    DBEdit10: TDBEdit;
    Label22: TLabel;
    DBEdit12: TDBEdit;
    updAlteraEvendo: TUpdateSQL;
    DBLookupComboBox1: TDBLookupComboBox;
    QryPlanoDesc: TwwQuery;
    DscPlanoDesc: TDataSource;
    QryPlanoDescNOME: TStringField;
    DBLookupComboBox2: TDBLookupComboBox;
    QryPlanoAtual: TwwQuery;
    StringField1: TStringField;
    DscPlanoAtual: TDataSource;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    DBLookupComboBox6: TDBLookupComboBox;
    DBLookupComboBox7: TDBLookupComboBox;
    DBLookupComboBox8: TDBLookupComboBox;
    QryEventoGerador: TwwQuery;
    StringField2: TStringField;
    DscEventoGerador: TDataSource;
    DscPlanoNovo: TDataSource;
    QryPlanoNovo: TwwQuery;
    StringField3: TStringField;
    QrySitPartAtual: TwwQuery;
    StringField4: TStringField;
    DscSitPartAtual: TDataSource;
    QrySitPartNovo: TwwQuery;
    StringField5: TStringField;
    DscSitPartNovo: TDataSource;
    QrySitPartPatrocNovo: TwwQuery;
    StringField6: TStringField;
    DscSitPartPatrocNovo: TDataSource;
    QrySitPartPatrocAtual: TwwQuery;
    StringField7: TStringField;
    DscSitPartPatrocAtual: TDataSource;
    QryPlanoDescIDPLANOPREV: TFloatField;
    QryPlanoAtualIDSITPLANOPREV: TFloatField;
    QryEventoGeradorIDEVENTOGERADOR: TFloatField;
    QryPlanoNovoIDSITPLANOPREV: TFloatField;
    QrySitPartAtualIDSITPART: TFloatField;
    QrySitPartNovoIDSITPART: TFloatField;
    QrySitPartPatrocAtualIDSITFUNC: TFloatField;
    QrySitPartPatrocNovoIDSITFUNC: TFloatField;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MontaSelectPartBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
  private
    { Private declarations }
    CtrlDocumento           : TCtrlDocumento; 
    CtrlLancamento          : TCtrlLancamento;
    iIdEventoPrev: integer;


    sIdEventosPrev, sFlgMigrado,
    sIdPessoa, sIdPessJur, sIdPlanoPrev, sSeqProposta: String;
    sIdSitFunc, sIdSitPart, sIdSitPlanoPrev: String;
    sFlgSitFuncImed, sFlgSitPartImed, sFlgSitPlanoImed: String;
    sFlgEfetivado, sDataEfetivado: String;
    bAltera: boolean;
    sEstadoEvento: String;
    sResultadoRegra: String;
    rOpcao1,               rOpcao2,                  rOpcao3               : real;

    sNumerosProcesso : String;

    sTempoAfastado : String;
    iNumOpcoesPatro : word;
    bObrigaOpPatro1,
    bObrigaOpPatro2,
    bObrigaOpPatro3 : boolean;

    bEfetivado: boolean;

    procedure LimpaCampos;
    procedure VerificaEstadoEvento;

  public
    { Public declarations }
  end;

var
  frmAlteraEvento: TfrmAlteraEvento;

implementation

uses
  UAdmPrev, UDataBase, UMensErro, FTelaAut, DBaseDados, FCadContribParticipante,
  UMovReserva, FMostraContribuicoes, UEventos, UParticipante, UContribuicaoPrev,
  FCadOpcoesElegivel, UBeneficio, USistema, DAPrev,  DDividaEP, UIntegraEP;

{$R *.DFM}

procedure TfrmAlteraEvento.LimpaCampos;
begin
  edNome.Text        := '';
  edMatricula.Text   := '';
  edPatro.Text       := '';
  edPlano.Text       := '';
  edSitPatro.Text    := '';
  edSitFundacao.Text := '';
  edSitPlano.Text    := '';
  edInscNumero.Text  := '';
//  dbedtEvento.Text := '';
  //chkAcoes.Items.Clear;

  bbtnProcurar.SetFocus;
//  ConsPart1.Enabled := false;
//  bbtnOpcoes.enabled := false;

  QryAlteraEvendo.Close;

end;

procedure TfrmAlteraEvento.VerificaEstadoEvento;
begin
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT EP.FLGEFETIVADO, EG.IDEVENTOGERADOR ' +
                 ' FROM EVENTOGERADOR EG, EVENTOSPREV EP ' +
                 ' WHERE EG.FLGINTERNO = ' + '''' + sFlgInterno + '''' + ' AND ' +
                 '       EG.IDEVENTOGERADOR = EP.IDEVENTOGERADOR AND ' +
                 '       EP.SEQPROPOSTA     = ' + sSeqProposta + ' AND ' +
                 '       EP.IDPESSJUR       = ' + sIdPessJur   + ' AND ' +
                 '       EP.IDPLANOPREV     = ' + sIdPlanoPrev + ' AND ' +
                 '       EP.IDPESSOA        = ' + sIdPessoa);
  try
     qryAux.Open;
  except
     on E:EDBEngineError do
       begin
            MostrarErro(E);
            Exit;
       end;
  end;

  if qryAux.IsEmpty then
     sEstadoEvento := 'NAO REGISTRADO' // Pode Inserir
  else
  if qryAux.FieldByName('FLGEFETIVADO').AsString = '0' then
     begin
          sEstadoEvento := 'REGISTRADO'; // Pode Alterar
          sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
     end
  else
     sEstadoEvento := 'EFETIVADO' // Não pode Alterar, nem inserir um novo
end;



procedure TfrmAlteraEvento.bbtnProcurarClick(Sender: TObject);
begin
  inherited;

  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     sIdPessoa          := MontaSelectPart.ValoresChave[0];
     sIdPessJur         := MontaSelectPart.ValoresChave[1];
     sIdPlanoPrev       := MontaSelectPart.ValoresChave[2];
     sIdSitFunc         := MontaSelectPart.ValoresChave[16];
     sIdSitPart         := MontaSelectPart.ValoresChave[17];
     sIdSitPlanoPrev    := MontaSelectPart.ValoresChave[18];
     sSeqProposta       := MontaSelectPart.ValoresChave[19];
     edNome.Text        := MontaSelectPart.ValoresChave[3];
     edMatricula.Text   := MontaSelectPart.ValoresChave[4];
     edPatro.Text       := MontaSelectPart.ValoresChave[5];
     edPlano.Text       := MontaSelectPart.ValoresChave[6];
     edSitPatro.Text    := MontaSelectPart.ValoresChave[7];
     edSitFundacao.Text := MontaSelectPart.ValoresChave[8];
     edSitPlano.Text    := MontaSelectPart.ValoresChave[9];
     edInscNumero.Text  := MontaSelectPart.ValoresChave[12];


     if Trim(MontaSelectPart.ValoresChave[20]) = ''
     then iNumOpcoesPatro    := 0
     else iNumOpcoesPatro    := StrToInt(MontaSelectPart.ValoresChave[20]);
     bObrigaOpPatro1         := (Trim(MontaSelectPart.ValoresChave[21]) = '1');
     bObrigaOpPatro2         := (Trim(MontaSelectPart.ValoresChave[22]) = '1');
     bObrigaOpPatro3         := (Trim(MontaSelectPart.ValoresChave[23]) = '1');

     if Trim(MontaSelectPart.ValoresChave[24]) <> ''
     then rOpcao1 := StrToFloat(ClienteNumero(MontaSelectPart.ValoresChave[24]))
     else rOpcao1 := 0;

     if Trim(MontaSelectPart.ValoresChave[25]) <> ''
     then rOpcao2 := StrToFloat(ClienteNumero(MontaSelectPart.ValoresChave[25]))
     else rOpcao2 := 0;

     if Trim(MontaSelectPart.ValoresChave[26]) <> ''
     then rOpcao3 := StrToFloat(ClienteNumero(MontaSelectPart.ValoresChave[26]))
     else rOpcao3 := 0;

     sIdEventosPrev := MontaSelectPart.ValoresChave[29];
     sFlgMigrado    := MontaSelectPart.ValoresChave[30];

     pnlInformacao.Enabled := True;
     bbtnConfirmar.Enabled := True;
     bbtnCancelar.Enabled  := True;


     if trim(sFlgMigrado) = '1' then
     begin
        MsgDlg(' Este evento NÃO foi gerado pelo sistema.'+#13+
               ' Não poderá ser cancelado. ','Aviso',mtWarning,[mbOk],0);
        LimpaCampos;
        Exit;
     end;

     // SELECIONA O ULTIMO EVENTO GERADOR E SUA SITUACÃO
     qryultEventoGerador.Close;
     qryultEventoGerador.ParamByName('IDEVENTOSPREV').AsInteger := strtoint(sIdEventosPrev);
     qryultEventoGerador.Open;
     if qryUltEventoGerador.IsEmpty
     then  begin
        MsgDlg('Nenhum evento foi encontrado para este participante. Verifique. ','Informação',mtInformation,[mbOk],0);
        LimpaCampos;
        Exit;
     end;

     QryAlteraEvendo.Close;
     QryAlteraEvendo.ParamByName('IDEVENTOSPREV').AsInteger := strtoint(sIdEventosPrev);
     QryAlteraEvendo.Open;

     QryPlanoDesc.Close;
     QryPlanoAtual.Close;
     QryEventoGerador.Close;
     QryPlanoNovo.Close;
     QrySitPartAtual.Close;
     QrySitPartNovo.Close;
     QrySitPartPatrocAtual.Close;
     QrySitPartPatrocNovo.Close;

     QryPlanoDesc.Open;
     QryPlanoAtual.Open;
     QryEventoGerador.Open;
     QryPlanoNovo.Open;
     QrySitPartAtual.Open;
     QrySitPartNovo.Open;
     QrySitPartPatrocAtual.Open;
     QrySitPartPatrocNovo.Open;    

     dtmBaseDados.dbBaseDados.StartTransaction;  

     if QryAlteraEvendo.FieldByName('FLGEFETIVADO').AsInteger = 0 then
     begin
          bAltera := True;
          bEfetivado := False;
          QryAlteraEvendo.Edit;
     end
     else
     begin
          bAltera := False;
          bEfetivado := True;
          //if MsgDlg('Evento já efetivado! Deseja continuar?','Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          //   Exit;
     end;
  end;      
end;



procedure TfrmAlteraEvento.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  //if bEfetivado then
  //begin
  //     MsgDlg('Não é possivel realizar alterações em eventos já efetivados!','Informação',mtInformation,[mbOk],0);
  //     QryAlteraEvendo.Cancel;
  //     Exit;
  //end;   

  if MsgDlg('Confirma Alteração do evento? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    QryAlteraEvendo.ApplyUpdates;
    dtmBaseDados.dbBaseDados.Commit;
    MsgDlg('Alteração de Evento efetuado com sucesso.','Informação',mtInformation,[mbOk],0);
    LimpaCampos;
  end
  else
  begin
    QryAlteraEvendo.Cancel;
    dtmBaseDados.dbBaseDados.Rollback;
    MsgDlg('Operação Cancelada!!','Informação',mtInformation,[mbOk],0);
    LimpaCampos;
  end;
end;



procedure TfrmAlteraEvento.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if MsgDlg('Todas as operações executadas serão canceladas. Confirma ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
        LimpaCampos;
     end;
     QryAlteraEvendo.Cancel;

end;            

procedure TfrmAlteraEvento.FormShow(Sender: TObject);
begin
  inherited;
  if (sistema.idmodulo = 454) then   // Higor Nayde Ferreira SOL  211709/15287 KINTANA 2050393
    MontaSelectPart.Filtro.Add(' EVENTOGERADOR.IDEVENTOGERADOR IN (129,130) ');// Higor Nayde Ferreira SOL  211709/15287 KINTANA 2050393

  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
end;



procedure TfrmAlteraEvento.FormCreate(Sender: TObject);
begin
  inherited;
  
   try
      CtrlDocumento := TCtrlDocumento.Create;
      CtrlDocumento.Initialize( dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True
                               );
   except
      MsgDlg('Erro ao criar Controle de Documentos.','Erro',mtError,[mbOK],0);
      Abort;
   end;
   

   
   try
      CtrlLancamento := TCtrlLancamento.Create;
      CtrlLancamento.Initialize( dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True
                               );
   except
      MsgDlg('Erro ao criar Controle de Lançamento Contábil.','Erro',mtError,[mbOK],0);
      Abort;
   end;



   InicializaEP;
   
end;

procedure TfrmAlteraEvento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil( CtrlDocumento );  
  FreeAndNil( CtrlLancamento ); 

  inherited;
end;


procedure TfrmAlteraEvento.MontaSelectPartBeforeOpenCds(
  var sqlText: String; strListParams: TStringList);
begin
  inherited;
  sqlText := Copy(sqlText, 1, Pos('ORDER BY', sqlText)-1);
  sqlText := sqlText + ' ORDER BY C3 DESC';
end;



end.



