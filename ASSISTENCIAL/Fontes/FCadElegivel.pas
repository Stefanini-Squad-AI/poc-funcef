unit FCadElegivel;

interface

uses                                                
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, Menus, MontaSelect, DBTables, Db, Wwquery, Wwdatsrc, Pessoa,
  TB97, MAHlpBtn, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, checklst,
  ComCtrls, TabControlDetalhe, wwdblook, DBCtrls, Mask, wwdbedit, Wwdbspin, ExtDlgs, TB97Ctls, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, CMDBLookupCombo, CmEventosCadastro, ImgList,
  wwdbdatetimepicker, CMDateTimePicker, ExtCtrls, TREdit;

type
  TfrmCadElegivel = class(TfrmPessoa)
    tbsElegivel:  TTabSheet;
    pnlControlesElegivel: TPanel;
    qryElegPatro: TwwQuery;
    dsElegPatro: TwwDataSource;
    qryPatro: TwwQuery;
    qrySitFunc: TwwQuery;
    qryCargo: TwwQuery;
    dbgrdElegivel: TwwDBGrid;
    qryCCusto: TwwQuery;
    updElegPatro: TUpdateSQL;
    tbsPlanosPrev: TTabSheet;
    dbgrdPlanosPrev: TwwDBGrid;
    qryPlanosPrev: TwwQuery;
    dsPlanosPrev: TwwDataSource;
    updPlanosPrev: TUpdateSQL;
    pnlControlesPlanos: TPanel;
    grpInscricao: TGroupBox;
    dbrgrpTipoInsc: TDBRadioGroup;
    GroupBox1: TGroupBox;
    qryPlanPrev: TwwQuery;
    qrySitPart: TwwQuery;
    qryAux: TwwQuery;
    qryDepen: TwwQuery;
    updDepen: TUpdateSQL;
    qryDepenTit: TwwQuery;
    updDepentit: TUpdateSQL;
    Label21: TLabel;
    dbdtInscricao: TCMDateTimePicker;
    Label17: TLabel;
    dblkpcmbPlano: TwwDBLookupCombo;
    Label23: TLabel;
    dblkpcmbSitPart: TwwDBLookupCombo;
    qryGrava: TwwQuery;
    qryAux2: TwwQuery;
    Label2: TLabel;
    dblkpcmbSitPlanoPrev: TwwDBLookupCombo;
    qrySitPlanoPrev: TwwQuery;
    tbsPessFis: TTabSheet;
    dsNaturalidade: TwwDataSource;
    qryNaturalidade: TwwQuery;
    pnlPessFis: TPanel;
    DBCheckBox1: TDBCheckBox;
    dbrgrpSexo: TDBRadioGroup;
    dbrgrpEstCivil: TDBRadioGroup;
    grpFiliacao: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    grpNaturalidade: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    dblkpcmbNaturalidade: TwwDBLookupCombo;
    dbedNacionalidade: TwwDBEdit;
    grpDataNasc: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    wwDBEdit4: TwwDBEdit;
    dbdtNasc: TCMDateTimePicker;
    grpDependentes: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    wwDBSpinEdit1: TwwDBSpinEdit;
    wwDBSpinEdit2: TwwDBSpinEdit;
    wwDBSpinEdit3: TwwDBSpinEdit;
    bbtnContribuicoes: TBitBtn;
    GroupBox2: TGroupBox;
    Label20: TLabel;
    dbedInscNumero: TwwDBEdit;
    Label18: TLabel;
    dbdtRequerimento: TCMDateTimePicker;
    gpDataCancelamento: TGroupBox;
    Label35: TLabel;
    dbDataCancelamento: TCMDateTimePicker;
    gpDataManutencao: TGroupBox;
    Label34: TLabel;
    dbDataInicioManut: TCMDateTimePicker;
    GroupBox7: TGroupBox;
    Label36: TLabel;
    wwDBEdit5: TwwDBEdit;
    GroupBox8: TGroupBox;
    lblPatro: TLabel;
    dblkpcmbPatro: TwwDBLookupCombo;
    lblSitFunc: TLabel;
    dblkpcmbSitPatro: TwwDBLookupCombo;
    GroupBox9: TGroupBox;
    lblCargo: TLabel;
    dblkpcmbCargo: TwwDBLookupCombo;
    Label15: TLabel;
    dblkpcmbCCusto: TwwDBLookupCombo;
    GroupBox10: TGroupBox;
    lblMatricula: TLabel;
    dbedMatricula: TDBEdit;
    Label13: TLabel;
    dbdtAdesao: TCMDateTimePicker;
    lblDataDemissao: TLabel;
    dbDataDemissao: TCMDateTimePicker;
    Label14: TLabel;
    dbedSalario: TDBEdit;
    GroupBox11: TGroupBox;
    Label24: TLabel;
    dbedTempoNaoCreditado: TwwDBEdit;
    Label37: TLabel;
    tbsContaBancaria: TTabSheet;
    dbgrdContaBancaria: TwwDBGrid;
    Panel3: TPanel;
    GroupBoxBanco: TGroupBox;
    Label38: TLabel;
    dblkpcmbAgencia: TwwDBLookupCombo;
    qryContaBancaria: TwwQuery;
    dsContaBancaria: TwwDataSource;
    updContaBancaria: TUpdateSQL;
    GroupBoxConta: TGroupBox;
    Label40: TLabel;
    dbedContaCorrente: TwwDBEdit;
    dbcbFlgContaPref: TDBCheckBox;
    Label39: TLabel;
    dblkpcmbBanco: TwwDBLookupCombo;
    qryAgencia: TwwQuery;
    qryBanco: TwwQuery;
    Label41: TLabel;
    dbedTempoServAnterior: TwwDBEdit;
    Label42: TLabel;
    Labelfilial: TLabel;
    cmbfilial: TwwDBLookupCombo;
    qryfilial: TwwQuery;
    dspatro: TwwDataSource;
    tbshtFundacao: TTabSheet;
    qryfundacao: TwwQuery;
    Panel4: TPanel;
    dblkpcmbFundacao: TwwDBLookupCombo;
    dbedinsc: TDBEdit;
    lblfund: TLabel;
    lblinsc: TLabel;
    dbgrdFundacoes: TwwDBGrid;
    dsfundacoes: TwwDataSource;
    qryfundacoes: TwwQuery;
    updfundacoes: TUpdateSQL;
    qryGrava2: TwwQuery;
    Label43: TLabel;
    wwDBEdit6: TwwDBEdit;
    bbtnOpcoes: TBitBtn;
    qryElegPatroIDPESSJUR: TFloatField;
    qryElegPatroIDPESSOA: TFloatField;
    qryElegPatroIDSITFUNC: TFloatField;
    qryElegPatroCODCENTROCUSTO: TStringField;
    qryElegPatroIDCARGOEXT: TFloatField;
    qryElegPatroMATRICULA: TStringField;
    qryElegPatroDATAADMISSAO: TDateTimeField;
    qryElegPatroSALTOTAL: TFloatField;
    qryElegPatroPARTICIPPREVID: TFloatField;
    qryElegPatroPARTICIPASSIST: TFloatField;
    qryElegPatroIDEMPRESAPROP: TFloatField;
    qryElegPatroNIVEL: TStringField;
    qryElegPatroIDESTAB: TFloatField;
    qryElegPatroTEMPONAOCREDITADO: TFloatField;
    qryElegPatroTEMPOSERVANTERIOR: TFloatField;
    qryElegPatroDATADEMISSAO: TDateTimeField;
    qryElegPatroPATROCINADORA: TStringField;
    qryElegPatroSITFUNC: TStringField;
    qryElegPatroFILIAL: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure qryElegPatroBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure qryElegPatroAfterScroll(DataSet: TDataSet);
    procedure tbcDetalheChange(Sender: TObject);
    procedure dblkpcmbPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbPlanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbSitPartCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure qryPlanosPrevBeforePost(DataSet: TDataSet);
    procedure qryPlanosPrevAfterPost(DataSet: TDataSet);
    procedure dblkpcmbSitPlanoPrevCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure qryPessoaFisicaAfterInsert(DataSet: TDataSet);
    procedure dblkpcmbNaturalidadeCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnContribuicoesClick(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryPlanosPrevAfterInsert(DataSet: TDataSet);
    procedure qryPlanosPrevAfterScroll(DataSet: TDataSet);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure qryContaBancariaBeforePost(DataSet: TDataSet);
    procedure qryContaBancariaAfterInsert(DataSet: TDataSet);
    procedure dblkpcmbAgenciaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbBancoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure dblkpcmbAgenciaEnter(Sender: TObject);
    procedure cmbfilialCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure qryPatroAfterScroll(DataSet: TDataSet);
    Procedure InsereEndereco(Idpessoa : String);
    procedure dblkpcmbSitPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbFundacaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure qryfundacoesAfterInsert(DataSet: TDataSet);
    procedure qryfundacaoBeforeOpen(DataSet: TDataSet);
    procedure dsfundacoesStateChange(Sender: TObject);
    procedure qryfundacoesBeforePost(DataSet: TDataSet);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure qryElegPatroAfterInsert(DataSet: TDataSet);
    procedure dsElegPatroStateChange(Sender: TObject);
    procedure bbtnOpcoesClick(Sender: TObject);
    procedure qryElegPatroAfterPost(DataSet: TDataSet);
    Procedure PessoaChangeSubtipo(IdPessoa: Integer);
    Procedure PessoaSaveSubtipo(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
     bGravaDependente: boolean;
     iIdEventoPrev   : Integer;
     rOpcao1,rOpcao2,rOpcao3: real;

     function  VerificaElegivel :boolean;
     function  VerificaParticipante: boolean;
     function  VerificaContaBancaria: boolean;
     function  PreparaDependente : boolean;

  public
     sidpessjurant,sidpessoaant : String;
     stateelegpatro : TDatasetState;
     procedure GravaContribuicoesParticipante;
     procedure GravaReservasParticipante;
     procedure GravaEVENTOSPREV;

    { Public declarations }

  end;

var
  frmCadElegivel: TfrmCadElegivel;
  bInsereParticipante: boolean;
  IdPessoa : String;
  idEnd : Integer;

  procedure IniciaEventoInscricao(qryAux:TwwQuery; sIdEvento:string);

implementation

uses UAutorizacao, FTelaAut, DBaseDados, UMensErro, UAdmAss,
     UDataBase, USistema, UEventos, UContribuicaoPrev, FCadOpcoesElegivel;
     // FCadContribParticipante

{$R *.DFM}

procedure IniciaEventoInscricao(qryAux:TwwQuery; sIdEvento:string);
begin
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME, FLGINTERNO FROM EVENTOGERADOR ' +
                 ' WHERE  (IDEVENTOGERADOR = ' + sIdEvento+')');
  qryAux.Open;
  //frmCadElegivel.Caption := qryAux.FieldByName('NOME').AsString;
  sIdEventoGerador    := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
  sFlgInterno         := qryAux.FieldByName('FLGINTERNO').AsString;

  AbrirForm(frmCadElegivel, TfrmCadElegivel, False);
end;

// provisorio
procedure TfrmCadElegivel.PessoaChangeSubtipo(IdPessoa: Integer);
begin
   //abrir outras querys
   if qryElegPatro.Active and qryElegPatro.CachedUpdates
   then qryElegPatro.CancelUpdates;
   qryElegPatro.ParamByName('IDPESSOA').Value := IdPessoa;
   qryElegPatro.Close;
   qryElegPatro.Open;
   qryElegPatro.CancelUpdates;

   if qryPlanosPrev.Active and qryPlanosPrev.CachedUpdates
   then qryPlanosPrev.CancelUpdates;
   qryPlanosPrev.ParamByName('IDPESSOA').Value := IdPessoa;
   qryPlanosPrev.Close;
   qryPlanosPrev.Open;
   qryPlanosPrev.CancelUpdates;

   if qryContaBancaria.Active and qryContaBancaria.CachedUpdates
   then qryContaBancaria.CancelUpdates;
   qryContaBancaria.ParamByName('IDPESSOA').Value := IdPessoa;
   qryContaBancaria.Close;
   qryContaBancaria.Open;
   qryContaBancaria.CancelUpdates;

   if qryDepen.Active and qryDepen.CachedUpdates
   then qryDepen.CancelUpdates;
   qryDepen.ParamByName('IDPESSOA').Value := IdPessoa;
   qryDepen.Close;
   qryDepen.Open;
   qryDepen.CancelUpdates;

   if qryDepenTit.Active and qryDepenTit.CachedUpdates
   then qryDepenTit.CancelUpdates;
   qryDepenTit.ParamByName('IDPESSOA').Value := IdPessoa;
   qryDepenTit.Close;
   qryDepenTit.Open;
   qryDepenTit.CancelUpdates;

   if qryfundacoes.Active and qryfundacoes.CachedUpdates
   then qryfundacoes.CancelUpdates;
   qryfundacoes.ParamByName('IDPESSOA').Value := IdPessoa;
   qryfundacoes.Close;
   qryfundacoes.Open;
   qryfundacoes.CancelUpdates;
end;

procedure TfrmCadElegivel.FormCreate(Sender: TObject);
begin
  inherited;
  if sFlgInterno = 'IP' then
     frmCadElegivel.Caption  := 'Inscrição de Participante';
  qryElegPatro.Prepare;
  qryPlanosPrev.Prepare;
  qryContaBancaria.Prepare;
  qryDepen.Prepare;
  qryDepenTit.Prepare;
  qryfundacoes.prepare;
end;

procedure TfrmCadElegivel.CmeCadastroConfirma(Sender: TObject);
begin
   // Testar se tem algum participante a inserir.
   // Se tiver e for o primeiro, inserí-lo como dependente dele
   bGravaDependente := PreparaDependente;
   inherited;
end; //CmeCadastro.Confirma(Self)

procedure TfrmCadElegivel.PessoaSaveSubtipo(Sender: TObject);
begin
   inherited;
   try
      dtmBaseDados.dbBaseDados.ApplyUpdates([qryElegPatro]);
      dtmBaseDados.dbBaseDados.ApplyUpdates([qryPlanosPrev]);
      dtmBaseDados.dbBaseDados.ApplyUpdates([qryContaBancaria]);
      dtmBaseDados.dbBaseDados.ApplyUpdates([qryfundacoes]);
      if (bInsereParticipante = True) and (not qryPlanosPrev.IsEmpty) then
          begin
              GravaContribuicoesParticipante;
              GravaReservasParticipante;
          end;
      if bGravaDependente
      then begin
         dtmBaseDados.dbBaseDados.ApplyUpdates([qryDepen]);
         dtmBaseDados.dbBaseDados.ApplyUpdates([qryDepenTit]);
       end;
   except
      Raise;
   end;
   bInsereParticipante := False;
end;

procedure TfrmCadElegivel.GravaContribuicoesParticipante;
var
  bPrepararContrib  : boolean;
  sDataInicialEvento: string;
begin
  // Grava EventosPrev
  iIdEventoPrev := 0;
  GravaEventosPrev;

  // Grava Histórico de Eventos
  GravaHSTCONTEVENTOSPRFechado(IntToStr(iIdEventoPrev), qryPlanosPrev.FieldByName('IDPLANOPREV').AsString, sIdEventoGerador,
                                                 qryPlanosPrev.FieldByName('IDPESSOA').AsString,
                                                 qryPlanosPrev.FieldbyName('IDPESSJUR').AsString,
                                 '1', False, qryAux, qryGrava);
  //Associa as novas contribuições
  bPrepararContrib := True;

  if (Trim(dbdtInscricao.Text) <> '') then
      begin
          if StrToDate(dbdtInscricao.Text) < Date then
             begin
                  if MsgDlg('Deseja cobrar contribuições retroativas a partir da data de inscrição ?','Informação', mtInformation, [mbNo, mbYes], 1) = mrYes then
                     begin
                         bPrepararContrib   := True;
                         sDataInicialEvento := Trim(dbdtInscricao.Text);
                     end
                  else
                     begin
                         bPrepararContrib   := False;
                         sDataInicialEvento := DateToStr(Date);
                     end;
             end;
      end;

  if Trim(sDataInicialEvento) = '' then
      sDataInicialEvento := DateToStr(Date);

  qryPlanosPrev.First;
  while not qryPlanosPrev.EOF do
      begin
          //qryAux.Close;
          //qryAux.Sql.Clear;
          //qryAux.Sql.Add(' SELECT CP.IDCONTRIBUICAO  '+
          //               ' FROM   CONTPREVEVENTO CP, CONTPREV CT '+
          //               ' WHERE  CP.IDPLANOPREV     = '+qryPlanosPrev.FieldByName('IDPLANOPREV').AsString +
          //               ' AND    CP.IDEVENTOGERADOR = '+sIdEventoGerador +
          //               ' AND    CP.IDPLANOPREV     = CT.IDPLANOPREV    '+
          //               ' AND    CP.IDCONTRIBUICAO  = CT.IDCONTRIBUICAO ');
          //qryAux.Open;

          frmCadElegivel.Update;          
          if not AssociaNovasContribuicoes(qryPlanosPrev.FieldbyName('IDPESSJUR').AsString, qryPlanosPrev.FieldByName('IDPLANOPREV').AsString,
                                           qryPlanosPrev.FieldByName('IDPESSOA').AsString, '1', sIdEventoGerador, sDataInicialEvento, '',
                                           dbedMatricula.Text, qrySitPart.FieldByName('IDSITPART').AsString, dbedSalario.Text, False, bPrepararContrib, qryAux, qryGrava) then
             begin
                MsgDlg('Erro ao associar novas contribuições.','Informação',mtInformation,[mbOk,mbHelp],0);
             end;
          qryPlanosPrev.Next;
      end;
  qryAux.Close;
 {Fim - Associa as novas contribuições}
end;

procedure TfrmCadElegivel.GravaReservasParticipante;
begin
  qryPlanosPrev.First;
  while not qryPlanosPrev.EOF do
      begin
        {Filtra todas as Reservas do Plano do Participante}
         qryAux.Close;
         qryAux.Sql.Clear;
         qryAux.Sql.Add(' SELECT IDTIPORESERVA FROM RESERVAXPLANO ' +
                        ' WHERE  (IDPLANOPREV = ' + qryPlanosPrev.FieldByName('IDPLANOPREV').AsString + ') AND ' +
                        '        (ANALITICOSINTETI = ' + '''A''' + ') AND ' +
                        '        (FLGCOLETIVA = 0) ');
         qryAux.Open;
         qryAux.First;

         while not qryAux.EOF do
            begin
              {Verifica se as Reservas do Participante ainda não foram gravadas}
               qryAux2.Close;
               qryAux2.Sql.Clear;
               qryAux2.Sql.Add(' SELECT IDTIPORESERVA FROM RESERVAPART  ' +
                               ' WHERE  (IDTIPORESERVA = ' + qryAux.FieldbyName('IDTIPORESERVA').AsString + ') AND ' +
                               '        (IDPESSOA      = ' + qryPlanosPrev.FieldByName('IDPESSOA').AsString + ') AND ' +
                               '        (IDPLANOPREV   = ' + qryPlanosPrev.FieldByName('IDPLANOPREV').AsString + ') AND ' +
                               '        (IDPESSJUR     = ' + qryPlanosPrev.FieldbyName('IDPESSJUR').AsString+')');
               qryAux2.Open;

               if qryAux2.IsEmpty then
                  begin
                     {Grava as Reservas do Participante}
                      qryGrava.Close;
                      qryGrava.Sql.Clear;
                      qryGrava.Sql.Add(' INSERT INTO RESERVAPART (IDTIPORESERVA, IDPLANOPREV, IDPESSJUR, IDPESSOA) '+
                                       ' VALUES( ' + qryAux.FieldbyName('IDTIPORESERVA').AsString      + ',' +
                                                     qryPlanosPrev.FieldbyName('IDPLANOPREV').AsString + ',' +
                                                     qryPlanosPrev.FieldbyName('IDPESSJUR').AsString   + ',' +
                                                     qryPlanosPrev.FieldbyName('IDPESSOA').AsString    + ')');
                      try
                         qryGrava.ExecSQL;
                      except
                         on E:EDBEngineError do
                           begin
                                MostrarErro(E);
                                Exit;
                           end;
                      end;
                  end;
               qryAux.Next;
            end;
         qryPlanosPrev.Next;
      end;
end;

function TfrmCadElegivel.VerificaElegivel :boolean;
var sIdRegra,
    sSQL       : string;
{    bErroRegra : boolean;}
begin
   Result := False;
   { Verificar campos obrigatórios do elegivel}
   if Trim(dblkpcmbPatro.Text) = ''
   then begin
      MsgDlg('A Patrocinadora deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
      dblkpcmbPatro.SetFocus;
      Exit;
   end;

   if Trim(dbedMatricula.Text) = ''
   then begin
      MsgDlg('A Matrícula do Funcionário deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
      dbedMatricula.SetFocus;
      Exit;
   end;

   if Trim(dbdtAdesao.Text) = ''
   then begin
      MsgDlg('A Data de Admissão deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
      dbdtAdesao.SetFocus;
      Exit;
   end;

  { Testar regra de validacao de matricula }
  if bTestaRegra
  then begin
     if qryPatro.FieldByName('IdRegraMatricula').AsString <> ''
     then begin
        sSQL := ' SELECT '''+Trim(dbedMatricula.Text)+''' FROM DUAL ';
        sIdRegra := qryPatro.FieldByName('IdRegraMatricula').AsString;

        MsgDlg('ERRO A02 na execução do Sistema.','Erro',mtError,[mbOk,mbHelp],0);
        HALT;
        {if not RegraBooleana(sIdRegra,sSQL,bErroRegra)
        then begin // Regra de Validacao de Matricula = False
           if bErroRegra
           then MsgDlg('Erro na execução da Regra de Validação de Matrícula','Erro',mtError,[mbOk,mbHelp],0)
           else MsgDlg('Regra de Validação de Matrícula não satisfeita','Informação',mtInformation,[mbOk,mbHelp],0);
           dbedMatricula.SetFocus;
           Exit;
        end;}
     end; // if IdRegra <> ''
  end; // if bTestaRegra

  if qryElegPatro.State = dsInsert
  then begin
     // Verificar duplicidade de matricula
     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT IDPESSOA FROM ELEGPATRO WHERE (MATRICULA = '''+Trim(dbedMatricula.Text)+''') AND '+
                ' (IDPESSJUR = '+qryPatro.FieldByName('IdPessoa').AsString+')');
        Open;
        if not IsEmpty
        then begin
           MsgDlg('Matrícula duplicada','Erro',mtError,[mbOk,mbHelp],0);
           dbedMatricula.SetFocus;
           Exit;
        end;
     end;//with qryAux
  end;
  Result := True;
end; //VerificaElegivel

function  TfrmCadElegivel.VerificaParticipante : boolean;
var sIdRegra,
    sSQL : string;
{   bErroRegra :boolean;}
begin
  Result := False;
  { Verificar campos obrigatórios do participante}
  if Trim(dblkpcmbPlano.Text) = ''
  then begin
     MsgDlg('O Plano Previdenciário deve ser informado antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbPlano.SetFocus;
     Exit;
  end;

  if Trim(dblkpcmbSitPart.Text) = ''
  then begin
     MsgDlg('A Situação do Participante na Fundação deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbSitPart.SetFocus;
     Exit;
  end;

  if Trim(dblkpcmbSitPlanoPrev.Text) = ''
  then begin
     MsgDlg('A Situação do Participante no Plano deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbSitPlanoPrev.SetFocus;
     Exit;
  end;

  if Trim(dbdtRequerimento.Text) = ''
  then begin
     MsgDlg('A Data de Requerimento deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
     dbdtRequerimento.SetFocus;
     Exit;
  end;

  if Trim(dbdtInscricao.Text) = ''
  then begin
     MsgDlg('A Data de Inscrição deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
     dbdtInscricao.SetFocus;
     Exit;
  end;

  if StrToDate(dbdtRequerimento.Text) < qryElegPatro.FieldByName('DATAADMISSAO').Value
  then begin
     MsgDlg('A Data de Requerimento deve ser maior que a Data de Admissão.','Erro',mtError,[mbOk,mbHelp],0);
     dbdtRequerimento.SetFocus;
     Exit;
  end;

  if StrToDate(dbdtInscricao.Text) < qryElegPatro.FieldByName('DATAADMISSAO').Value
  then begin
     MsgDlg('A Data de Inscrição deve ser maior que a Data de Admissão.','Erro',mtError,[mbOk,mbHelp],0);
     dbdtInscricao.SetFocus;
     Exit;
  end;

  if StrToDate(dbdtInscricao.Text) < StrToDate(dbdtRequerimento.Text)
  then begin
     MsgDlg('A Data de Inscrição deve ser maior que a Data de Requerimento.','Erro',mtError,[mbOk,mbHelp],0);
     dbdtInscricao.SetFocus;
     Exit;
  end;

  // Testar regra de Admissao
  if bTestaRegra
  then begin
     if qryPlanPrev.FieldByName('IdRegraAdmissao').AsString <> ''
     then begin
        sIdRegra := qryPlanPrev.FieldByName('IdRegraAdmissao').AsString;

        sSQL := ' SELECT '+qryElegPatro.FieldByName('IdPessoa').AsString  +' AS IDPESSOA,    '+
                           qryPlanPrev.FieldByName('IdPlanoPrev').AsString+' AS IDPLANOPREV, '+
                           qryElegPatro.FieldByName('IdPessJur').AsString +' AS IDPESSJUR    ';
        if qryElegPatro.FieldByName('IdSitFunc').AsString <> ''
        then sSQL := sSQL +', '+qryElegPatro.FieldByName('IdSitFunc').AsString+' AS IDSITFUNC ';
        if qryElegPatro.FieldByName('CodCentroCusto').AsString <> ''
        then sSQL := sSQL+', '''+ qryElegPatro.FieldByName('CodCentroCusto').AsString+''' AS CODCENTROCUSTO ';
        if qryElegPatro.FieldByName('IdCargo').AsString <> ''
        then sSQL := sSQL +', '+qryElegPatro.FieldByName('IdCargo').AsString+' AS IDCARGO ';
        if qryElegPatro.FieldByName('Matricula').AsString <> ''
        then sSQL := ssQL + ', '''+qryElegPatro.FieldByName('Matricula').AsString+''' AS MATRICULA ';
        if qryElegPatro.FieldByName('DataAdmissao').AsString <> ''
        then sSQL := sSQL +', '''+ qryElegPatro.FieldByName('DataAdmissao').AsString+''' AS DATAADMISSAO ';
        if qryElegPatro.FieldByName('SalTotal').AsString <> ''
        then sSQL := sSQL +', '+qryElegPatro.FieldByName('SalTotal').AsString+' AS SALTOTAL ';
        if qryElegPatro.FieldByName('PARTICIPPREVID').AsString <> ''
        then sSQL := sSQL +', '+qryElegPatro.FieldByName('PARTICIPPREVID').AsString+' AS PARTICIPPREVID ';
        if qryElegPatro.FieldByName('PARTICIPASSIST').AsString <> ''
        then sSQL := sSQL + ', '+qryElegPatro.FieldByName('PARTICIPASSIST').AsString+' AS PARTICIPASSIST ';
        if qryElegPatro.FieldByName('NIVEL').AsString <> ''
        then sSQL := sSQL+', '+qryElegPatro.FieldByName('NIVEL').AsString+' AS NIVEL ';
        if qryElegPatro.FieldByName('TEMPOSERVANTERIOR').AsString <> ''
        then sSQL := sSQL +', '+qryElegPatro.FieldByName('TEMPOSERVANTERIOR').AsString+' AS TEMPOSERVANTERIOR ';
        if qryPessoaFisica.FieldByName('DataNasc').AsString <> ''
        then sSQL := sSQL + ', '''+  qryPessoaFisica.FieldByName('DataNasc').AsString+''' AS DATANASC ';
        if qryPessoaFisica.FieldByName('Sexo').AsString <> ''
        then sSQL := sSQL + ', '''+  qryPessoaFisica.FieldByName('Sexo').AsString+''' AS SEXO ';
        if qry.FieldByName('NumDocumento').AsString <> ''
        then sSQL := sSQL + ', '''+  qry.FieldByName('NumDocumento').AsString+''' AS NUMDOCUMENTO ';
        if qryPessoaFisica.FieldByName('DataMORTE').AsString <> ''
        then sSQL := sSQL + ', '''+  qryPessoaFisica.FieldByName('DataMORTE').AsString+''' AS DATAMORTE ';
        if qryPessoaFisica.FieldByName('ESTCIVIL').AsString <> ''
        then sSQL := sSQL + ', '''+  qryPessoaFisica.FieldByName('ESTCIVIL').AsString+''' AS ESTCIVIL ';
        sSQL := sSQL + ' FROM DUAL ';

        MsgDlg('ERRO A01 na execução do Sistema.','Erro',mtError,[mbOk,mbHelp],0);
        HALT;
        {if not RegraBooleana(sIdRegra,sSQL,bErroRegra)
        then begin // Regra de admissao = False
           if bErroRegra
           then MsgDlg('Erro na execução da Regra de Admissão','Erro',mtError,[mbOk,mbHelp],0)
           else MsgDlg('Regra de Admissão não satisfeita','Informação',mtInformation,[mbOk,mbHelp],0);
           Exit;
        end;}

     end; // if IdRegra <> ''
  end; // if bTestaRegra
  Result := True;
end; //VerificaParticipante

function TfrmCadElegivel.VerificaContaBancaria:boolean;
begin
   Result := False;
   if Trim(dblkpcmbBanco.Text) = '' then
      begin
           MsgDlg('O Banco deve ser informado antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
           dblkpcmbBanco.SetFocus;
           Exit;
      end;

   if Trim(dblkpcmbAgencia.Text) = '' then
      begin
           MsgDlg('A Agência Bancária deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
           dblkpcmbAgencia.SetFocus;
           Exit;
      end;

   if Trim(dbedContaCorrente.Text) = '' then
      begin
           MsgDlg('A Conta Corrente deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
           dbedContaCorrente.SetFocus;
           Exit;
      end;
   Result := True;
end;

function  TfrmCadElegivel.PreparaDependente :boolean;
begin
   Result := False;
   if (qryPlanosPrev.RecordCount = 1) and (bInsereParticipante = True)
   then begin
      qryDepen.Insert;
      qryDepenTit.Insert;

      { Preencher querys de dependencia para gravar participante como seu proprio dependente }
      qryDepen.FieldByName('IdPessoa').Value := qry.FieldByname('IDPESSOA').AsString;
      qryDepenTit.FieldByName('IdPessoa').Value := qry.FieldByname('IDPESSOA').AsString;
      qryDepenTit.FieldByName('IdTitular').Value := qry.FieldByname('IDPESSOA').AsString;
      qryDepenTit.FieldByName('IdDependencia').Value := 'PRP';
      qryDepenTit.FieldByName('NumSequencia').Value := 0;
      qryDepenTit.FieldByName('FLGCONTAIMPOSTOR').Value := 0;
      qryDepenTit.FieldByName('FLGCONTASALARIOF').Value := 0;
      qryDepenTit.FieldByName('flgBeneficiario').Value := 1;
      Result := True;
   end
   else if (qryPlanosPrev.IsEmpty) and (not qryDepen.IsEmpty)
        then begin
           qryDepen.Delete;
           qryDepenTit.Delete;
           Result := True;
        end;
end;//PreparaDependente

procedure TfrmCadElegivel.FormActivate(Sender: TObject);
begin
  inherited;
  qryPatro.Close;   qryPatro.Open;
  //qryfilial.close;  qryfilial.open;
  qrySitFunc.Close; qrySitFunc.Open;
  qrySitPart.Close; qrySitPart.Open;
  qrySitPlanoPrev.Close; qrySitPlanoPrev.Open;
  qryCargo.Close;   qryCargo.Open;
  qryCCusto.Close;
  qryCCusto.ParamByName('IdEmpresa').AsInteger := Sistema.IdEmpresa;
  qryCCusto.Open;
  qryNaturalidade.Close; qryNaturalidade.Open;
  qryAgencia.Close; qryAgencia.Open;
  qryBanco.Close; qryBanco.Open;
  qryfundacao.close;  qryfundacao.open;

  dbcbFlgContaPref.Checked := False;
end;

procedure TfrmCadElegivel.qryElegPatroBeforePost(DataSet: TDataSet);
begin
  inherited;

{  if not VerificaElegivel
  then begin
     pgctrlDetalhe.ActivePage := tbsElegivel;
     Abort;
  end;
}
  if qryPlanosPrev.IsEmpty
  then qryElegPatro.FieldbyName('ParticipPrevid').AsInteger := 0;
  qryElegPatro.FieldbyName('ParticipAssist').AsInteger := 0;
  qryElegPatro.FieldByName('IdEmpresaProp').AsInteger := qryCCusto.FieldByName('IdEmpresa').AsInteger;
end;

procedure TfrmCadElegivel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryElegPatro.Close;
  qryElegPatro.Unprepare;
  qryPlanosPrev.Close;
  qryPlanosPrev.Unprepare;
  qryContaBancaria.Close;
  qryContaBancaria.Unprepare;
  qryDepen.Close;
  qryDepen.Unprepare;
  qryDepenTit.Close;
  qryDepenTit.Unprepare;
  qryfundacoes.close;
  qryfundacoes.unprepare;
end;

procedure TfrmCadElegivel.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   try
   qryElegPatro.CancelUpdates;
   qryPlanosPrev.CancelUpdates;
   qryContaBancaria.CancelUpdates;
   qryDepen.CancelUpdates;
   qryDepentit.CancelUpdates;
   qryfundacoes.CancelUpdates;
   except
   end;
end;

procedure TfrmCadElegivel.CmeDetalheInsert(Sender: TObject);
begin
   inherited;

   if pgCtrlDetalhe.ActivePage = tbshtFundacao
   then begin //DadosFuncionais
      qryFundacoes.FieldByname('IDPESSOA').Value := qry.FieldByname('IDPESSOA').AsString;
      dblkpcmbFundacao.SetFocus ;
   end;   

   if pgCtrlDetalhe.ActivePage = tbsElegivel
   then begin //DadosFuncionais
      qryElegPatro.FieldByname('IDPESSOA').Value := qry.FieldByname('IDPESSOA').AsString;
      dblkpcmbPatro.SetFocus ;
   end
   else if pgCtrlDetalhe.ActivePage = tbsPlanosPrev
        then begin // Planos Previdenciarios
           qryPlanosPrev.FieldByname('IDPESSOA').Value := qry.FieldByname('IDPESSOA').AsString;
           qryPlanosPrev.FieldByName('IdPessJur').AsInteger := qryElegPatro.FieldByName('IdPessJur').AsInteger;
           dblkpcmbPlano.SetFocus ;
        end
   else if pgCtrlDetalhe.ActivePage = tbsContaBancaria
        then begin // Conta Bancaria
           qryContaBancaria.FieldByname('IDPESSOA').Value := qry.FieldByname('IDPESSOA').AsString;
           dblkpcmbBanco.SetFocus ;
        end;
end;

procedure TfrmCadElegivel.bbtnOkDetClick(Sender: TObject);
begin
  if (pgctrlDetalhe.ActivePage = tbsElegivel)
  then begin
     if not VerificaElegivel then Exit;
     {if (qryelegpatro.State = dsinsert) and (cmbfilial.text <> '') then
     begin
        InseriuElegivel := True;
     end;}
  end //if activePage = tbsElegivel
  else if (pgctrlDetalhe.ActivePage = tbsPlanosPrev)
       then begin
          if not VerificaParticipante then Exit;
       end//if activePage = tbsPlanosPrev
  else if (pgctrlDetalhe.ActivePage = tbsContaBancaria)
       then begin
          if not VerificaContaBancaria then Exit;
       end;
  try
     inherited;
  except
     exit;
  end;

  {Limpa os campos da Conta Bancária}
   if qryContaBancaria.State in [dsInsert] then
      begin
           dblkpcmbBanco.Text := '';
           dbcbFlgContaPref.Checked := False;
      end;

  if (pgctrlDetalhe.ActivePage = tbsPlanosPrev) then
      begin
           if Trim(sIdEventoGerador) = '' then // Se chama o form do Menu Cadastro, não pode inserir participante, só elegivel.
              sbtnInsDet.Enabled := False
           else // Se chama o form do Menu Participantes\Eventos, pode inserir participante e elegivel.
              sbtnInsDet.Enabled := True;
      end
  else
      sbtnInsDet.Enabled := True;
end;

procedure TfrmCadElegivel.qryElegPatroAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qryElegPatro.Active then Exit;

  if qryElegPatro.FieldByName('DATADEMISSAO').AsString = '' then
     begin
          lblDataDemissao.Visible := False;
          dbDataDemissao.Visible  := False;
     end
  else
     begin
          lblDataDemissao.Visible := True;
          dbDataDemissao.Visible  := True;
     end;

  qryPlanPrev.Close;
  qryPlanPrev.ParamByName('IdPessJur').AsInteger := qryElegPatro.FieldByName('IdPessJur').AsInteger;
  qryPlanPrev.Open;
end;

procedure TfrmCadElegivel.tbcDetalheChange(Sender: TObject);
begin
  if (pgctrlDetalhe.ActivePage = tbsElegivel) and
     (qryElegPatro.State in [dsInsert,dsEdit])
  then begin
     if not VerificaElegivel
     then begin
        pgctrlDetalhe.ActivePage := tbsElegivel;
        tbcDetalhe.TabIndex := 4;
        Abort;
     end;
  end;

  if (pgctrlDetalhe.ActivePage = tbsPlanosPrev) and
     (qryPlanosPrev.State in [dsInsert,dsEdit])
  then begin
  
     if not VerificaParticipante
     then begin
        pgctrlDetalhe.ActivePage := tbsPlanosPrev;
        tbcDetalhe.TabIndex := 5;
        Abort;
     end;
  end;

  if (pgctrlDetalhe.ActivePage = tbsContaBancaria) and
     (qryContaBancaria.State in [dsInsert,dsEdit])
  then begin
     if not VerificaContaBancaria
     then begin
        pgctrlDetalhe.ActivePage := tbsContaBancaria;
        tbcDetalhe.TabIndex := 7;
        Abort;
     end;
  end;

  { Limpar o datafield do edit para se mudar de dataset
    nao dar erro de campo inexistente }
  if dbedPaiDetalhe.DataField = 'PATROCINADORA'
  then dbedPaiDetalhe.DataField := '';

  inherited;

  if (pgctrlDetalhe.ActivePage = tbsPlanosPrev) then
      begin
           if Trim(sIdEventoGerador) = '' then // Se chama o form do Menu Cadastro, não pode inserir participante, só elegivel.
              sbtnInsDet.Enabled := False
           else // Se chama o form do Menu Participantes\Eventos, pode inserir participante e elegivel.
              sbtnInsDet.Enabled := True;
      end
  else
      sbtnInsDet.Enabled := True;

  if (pgctrlDetalhe.ActivePage = tbshtFundacao) then
  begin
       dbedPaiDetalhe.Visible := False;
       dbedPaiDetalhe.DataSource := nil;
       dbedPaiDetalhe.DataField := '';
       tb97TituloDetalhe.Visible := False;
       qryfundacoes.Close;
       qryfundacoes.ParamByName('Idpessoa').AsInteger := qry.FieldByName('Idpessoa').AsInteger;
       qryfundacoes.Open;
  end;

  if (pgctrlDetalhe.ActivePage = tbsPlanosPrev) then
  begin
       dbedPaiDetalhe.Visible := True;
       dbedPaiDetalhe.DataSource := dsElegPatro;
       dbedPaiDetalhe.DataField := 'PATROCINADORA';
       qryPlanosPrev.Filter := 'IDPESSJUR = '''+IntToStr(qryElegPatro.FieldByName('IDPESSJUR').AsInteger)+'''';
       tb97TituloDetalhe.Visible := True;
       qryPlanPrev.Close;
       qryPlanPrev.ParamByName('IdPessJur').AsInteger := qryElegPatro.FieldByName('IdPessJur').AsInteger;
       qryPlanPrev.Open;
  end;
end;

procedure TfrmCadElegivel.dblkpcmbPlanoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  qryPlanosPrev.FieldbyName('Plano').AsString := qryPlanPrev.FieldByName('Nome').AsString;

  { Gerar Numero de Inscricao Automaticamente, caso o parametro diga que é automatico }
  if (qryPlanPrev.FieldByName('flgAutoNumInsc').AsInteger = 1)
  then begin
     dbedInscNumero.Enabled := False;
     dbedInscNumero.Color := clSilver;
     if (qryPlanosPrev.State = dsInsert)
     then begin
        dbedInscNumero.Enabled := False;
        dbedInscNumero.Color := clSilver;
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' SELECT MAX(INSCRICAONUMERO)+1 AS PROXINSC FROM PARTPREVPLAN '+
                       ' WHERE (IDPLANOPREV = '+qryPlanPrev.FieldByName('IdPlanoPrev').AsString+')');
        qryAux.Open;
        if Trim(qryAux.FieldByName('proxInsc').AsString) = ''
        then qryPlanosPrev.FieldbyName('InscricaoNumero').AsFloat := qryPlanPrev.FieldByName('NumInscInicial').AsFloat
        else qryPlanosPrev.FieldbyName('InscricaoNumero').AsFloat :=
                      qryAux.FieldByName('proxInsc').AsFloat;
        qryAux.Close;
        dbedInscNumero.Text := qryPlanosPrev.FieldByName('InscricaoNumero').AsString;
     end;
  end
  else begin
     dbedInscNumero.Enabled := True;
     dbedInscNumero.Color := clWindow;
  end;
end;

procedure TfrmCadElegivel.dblkpcmbSitPartCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryPlanosPrev.FieldbyName('SITPART').AsString := qrySitPart.FieldByName('Descricao').AsString;
end;

procedure TfrmCadElegivel.dblkpcmbSitPlanoPrevCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryPlanosPrev.FieldbyName('SITPLANO').AsString := qrySitPlanoPrev.FieldByName('Descricao').AsString;
end;

procedure TfrmCadElegivel.dblkpcmbSitPatroCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryElegPatro.FieldbyName('SITFUNC').AsString := qrySitFunc.FieldByName('Descricao').AsString;
end;

procedure TfrmCadElegivel.qryPlanosPrevBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qryPlanosPrev.State = dsInsert
  then bInsereParticipante := True;
end;

procedure TfrmCadElegivel.qryPlanosPrevAfterPost(DataSet: TDataSet);
begin
  inherited;
  if not (qryElegPatro.State in [dsEdit,dsInsert])
  then begin
     qryElegPatro.Edit;
     qryElegPatro.FieldByName('ParticipPrevid').AsInteger := 1;
     qryElegPatro.Post;
  end
  else qryElegPatro.FieldByName('ParticipPrevid').AsInteger := 1
end;

procedure TfrmCadElegivel.qryPessoaFisicaAfterInsert(DataSet: TDataSet);
begin
  inherited;
  dblkpcmbNaturalidade.Text := '';
  dbedNacionalidade.Text    := '';
  qryPessoaFisica.FieldByName('flgIsentoIRRF').AsInteger := 0;
end;

procedure TfrmCadElegivel.dblkpcmbNaturalidadeCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryPessoaFisica.FieldbyName('IdPais').AsInteger := qryNaturalidade.FieldByName('IdPais').AsInteger;
end;

procedure TfrmCadElegivel.bbtnContribuicoesClick(Sender: TObject);
begin
  inherited;
  {Mostrar tela de contribuicoes do participante}
  //==frmCadContribParticipante := TfrmCadContribParticipante.Create(Application);
  //==frmCadContribParticipante.AssociaContrib(dbedNomeFantasia.Text,qryElegPatro.FieldByName('Patrocinadora').AsString,
  //==                                         qryPlanosPrev.FieldByName('Plano').AsString,
  //==                                         dbdtInscricao.Text,
  //==                                         qryPlanosPrev.FieldByName('IdPessoa').AsInteger,
  //==                                         qryPlanosPrev.FieldByName('IdPessJur').AsInteger,
  //==                                         qryPlanosPrev.FieldByName('IdPlanoPrev').AsInteger,1,False);
  //==frmCadContribParticipante.Free;
end;

procedure TfrmCadElegivel.dsStateChange(Sender: TObject);
begin
  inherited;
  if ds.DataSet.State = dsInsert
  then bbtnContribuicoes.Enabled := False
  else bbtnContribuicoes.Enabled := True;
end;

procedure TfrmCadElegivel.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
end;

//procedure que insere endereços comerciais dos elegíveis
Procedure TfrmCadElegivel.InsereEndereco(Idpessoa : string);
begin
   qryaux.close;
   qryaux.sql.clear;
   qryaux.sql.add(' SELECT ENDPESS.IDPESSOA,IDENDERECO,IDPAIS,CODESTADO,NUMERO,COMPLEMENTO,'+
                  ' BAIRRO,CIDADE,CEP,TIPOENDERECO,NOME '+
                  ' FROM ELEGPATRO, ENDPESS  '+
                  ' WHERE (ELEGPATRO.IDPESSOA = '+IdPessoa+')'+
                  ' AND   (IDESTAB = ENDPESS.IDPESSOA) ');
   qryaux.open;
   while not qryaux.eof do
   begin
      qryaux2.close;
      qryaux2.sql.clear;
      idEnd := LeUltRegistro(qryAux2,'ENDPESS');
      //
      qryaux2.close;
      qryaux2.sql.clear;
      qryaux2.SQL.add(' INSERT INTO ENDPESS(IDPESSOA,IDENDERECO,'+
                            ' IDPAIS,CODESTADO,NUMERO,COMPLEMENTO,BAIRRO,CIDADE,CEP,'+
                            ' TIPOENDERECO,NOME)'+
                            ' VALUES ('+idpessoa+','+inttostr(idend)+','+
                            ' '+qryaux.fieldbyname('IDPAIS').AsString+','+
                            ' '''+qryaux.fieldbyname('CODESTADO').AsString+''','+
                            ' '''+qryaux.fieldbyname('NUMERO').AsString+''','+
                            ' '''+qryaux.fieldbyname('COMPLEMENTO').AsString+''','+
                            ' '''+qryaux.fieldbyname('BAIRRO').AsString+''','+
                            ' '''+qryaux.fieldbyname('CIDADE').AsString+''','+
                            ' '''+qryaux.fieldbyname('CEP').AsString+''','+
                            ' ''C'','+
                            ' '''+qryaux.fieldbyname('NOME').AsString+''') ');
      try
         qryaux2.ExecSql;
      except end;    
      //
      qryaux.next;
   end; //while
end;

procedure TfrmCadElegivel.qryPlanosPrevAfterInsert(DataSet: TDataSet);
begin
  inherited;
  // Preencher valores default para datas e tipo de inscricao
  qryPlanosPrev.FieldByName('RequerimentoData').AsDateTime := qryElegPatro.FieldByName('DataAdmissao').AsDateTime;
  qryPlanosPrev.FieldByName('InscricaoData').AsDateTime    := qryElegPatro.FieldByName('DataAdmissao').AsDateTime;
  qryPlanosPrev.FieldbyName('InscricaoTipo').AsString := 'O';
end;

procedure TfrmCadElegivel.qryPlanosPrevAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qryPlanosPrev.Active then Exit;

  if qryPlanosPrev.FieldByName('DATACANCELAMENTO').AsString = '' then
     gpDataCancelamento.Visible := False
  else
     gpDataCancelamento.Visible := True;

  if qryPlanosPrev.FieldByName('DATAINICIOMANUT').AsString = '' then
     gpDataManutencao.Visible   := False
  else
     gpDataManutencao.Visible   := True;
end;

procedure TfrmCadElegivel.qryContaBancariaBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qryContaBancaria.State in [dsinsert] then
     begin
          qryAux.Close;
          qryAux.Sql.Clear;
          qryAux.Sql.Add(' SELECT MAX(IDCBANCARIA) + 1 AS PROXIMOIDCBANCARIA FROM CONTABANCARIA ');
          qryAux.Open;
          if (qryAux.FieldByName('PROXIMOIDCBANCARIA').AsString = '') or
             (qryAux.FieldByName('PROXIMOIDCBANCARIA').AsString = '0') then
              qryContaBancaria.FieldByName('IDCBANCARIA').AsString := '1'
          else
              qryContaBancaria.FieldByName('IDCBANCARIA').AsString := qryAux.FieldByName('PROXIMOIDCBANCARIA').AsString;
     end;
end;

procedure TfrmCadElegivel.qryContaBancariaAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if dbcbFlgContaPref.Checked = True then
     qryContaBancaria.FieldByName('FLGCONTAPREF').AsString := '1'
  else
     qryContaBancaria.FieldByName('FLGCONTAPREF').AsString := '0';
end;

procedure TfrmCadElegivel.dblkpcmbBancoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryContaBancaria.FieldbyName('BANCO').AsString := qryBanco.FieldByName('BANCO').AsString;
end;

procedure TfrmCadElegivel.dblkpcmbAgenciaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryContaBancaria.FieldbyName('AGENCIA').AsString := qryAgencia.FieldByName('AGENCIA').AsString;
end;

procedure TfrmCadElegivel.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  if pgCtrlDetalhe.ActivePage = tbsContaBancaria then
     begin
         dblkpcmbBanco.Text := '';
         dbcbFlgContaPref.Checked := False;
     end;

  stateelegpatro := dsbrowse;
  sidpessjurant := '';
  sidpessoaant := '';
end;

procedure TfrmCadElegivel.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  if pgCtrlDetalhe.ActivePage = tbsContaBancaria then
     dblkpcmbBanco.Text := qryContaBancaria.FieldByName('BANCO').AsString;
end;

procedure TfrmCadElegivel.dblkpcmbAgenciaEnter(Sender: TObject);
begin
  inherited;
  qryAgencia.Close;
  qryAgencia.ParamByName('pIdBanco').AsString := qryBanco.FieldbyName('IDPESSOA').AsString;
  qryAgencia.Open;
end;

procedure TfrmCadElegivel.cmbfilialCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if qryelegpatro.State in [dsedit,dsinsert] then
  qryElegPatro.FieldbyName('Filial').AsString := qryFilial.FieldByName('Nome').AsString;
end;

procedure TfrmCadElegivel.dblkpcmbPatroCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryElegPatro.FieldbyName('Patrocinadora').AsString :=  qryPatro.FieldByName('Nome').AsString;

  qryFilial.Close;
  qryFilial.ParamByName('idpessoa').AsInteger := qryPatro.FieldByName('idpessoa').AsInteger;
  qryFilial.Open;
end;

procedure TfrmCadElegivel.qryPatroAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryFilial.Close;
  qryFilial.ParamByName('idpessoa').AsInteger := qryPatro.FieldByName('idpessoa').AsInteger;
  qryFilial.Open;
end;

procedure TfrmCadElegivel.dblkpcmbFundacaoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   qryfundacoes.fieldbyname('NOME').AsString := qryfundacao.fieldbyname('NOME').AsString;
end;

procedure TfrmCadElegivel.qryfundacoesAfterInsert(DataSet: TDataSet);
begin
  inherited;
   qryfundacao.close;
   qryfundacao.open;   
end;

procedure TfrmCadElegivel.qryfundacaoBeforeOpen(DataSet: TDataSet);
begin
  inherited;
   qryfundacao.parambyname('idpessoa').AsInteger := qry.fieldbyname('idpessoa').AsInteger;
end;

procedure TfrmCadElegivel.dsfundacoesStateChange(Sender: TObject);
begin
   inherited;
   if qryfundacoes.state = dsinsert then
   begin
      dblkpcmbFundacao.enabled := true;
      dbedinsc.enabled := true;
   end
   else
   begin
      dblkpcmbFundacao.enabled := False;
      dbedinsc.enabled := False;
   end;
end;

procedure TfrmCadElegivel.qryfundacoesBeforePost(DataSet: TDataSet);
begin
   inherited;
   qryfundacoes.fieldbyname('idpessoa').AsInteger   := qry.fieldbyname('idpessoa').AsInteger;
   qryfundacoes.fieldbyname('idfundacao').AsInteger := qryfundacao.fieldbyname('idpessoa').AsInteger;
end;

procedure TfrmCadElegivel.sbtnApagarClick(Sender: TObject);
begin
   // qryElegPatro.Delete;
   if (not qryPlanosPrev.IsEmpty) then
   begin
      MsgDlg('Não é permitido efetuar a exclusão, já se tornou participante.','Informação',mtInformation,[mbOk,mbHelp],0);
      Exit;
   end;
   inherited;
end;

procedure TfrmCadElegivel.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  if (pgctrlDetalhe.ActivePage = tbsPlanosPrev) then
      begin
           if Trim(sIdEventoGerador) = '' then  //Se chama o form do Menu Cadastro, não pode inserir participante, só elegivel.
              sbtnInsDet.Enabled := False
           else    //Se chama o form do Menu Participantes\Eventos, pode inserir participante e elegivel.
              sbtnInsDet.Enabled := True;
      end
  else
      sbtnInsDet.Enabled := True;
end;

procedure TfrmCadElegivel.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  if (pgctrlDetalhe.ActivePage = tbsPlanosPrev) then
      begin
           if Trim(sIdEventoGerador) = '' then // Se chama o form do Menu Cadastro, não pode inserir participante, só elegivel.
              sbtnInsDet.Enabled := False
           else                                // Se chama o form do Menu Participantes\Eventos, pode inserir participante e elegivel.
              sbtnInsDet.Enabled := True;
      end
  else
      sbtnInsDet.Enabled := True;
end;

procedure TfrmCadElegivel.GravaEventosPrev;
var
  sFlgEfetivado, sDataEfetivado, sFlgSitFuncImed, sFlgSitPartImed, sFlgSitPlanoImed,
  sIdSitFunc,    sIdSitPart,     sIdSitPlanoPrev, sIdPessoa,       sIdPessJur,
  sIdPlanoPrev,  sSeqProposta  : string;

begin
  sFlgEfetivado    := '1';
  sDataEfetivado   := ' To_Date(''' + DateToStr(Date) + ''',''dd/MM/yyyy'')';

  sFlgSitFuncImed  := '1';
  sFlgSitPartImed  := '1';
  sFlgSitPlanoImed := '1';

  sIdSitFunc       := '';
  sIdSitPart       := '';
  sIdSitPlanoPrev  := '';

  sIdPessoa        := qry.FieldByName('IDPESSOA').AsString;
  sIdPlanoPrev     := qryPlanosPrev.FieldByName('IDPLANOPREV').AsString;
  sIdPessjur       := qryElegPatro.FieldByName('IDPESSJUR').AsString;
  sSeqProposta     := '1';

  if bInsereParticipante then
     begin
          iIdEventoPrev := LeUltRegistro(qryAux,'EVENTOSPREV');
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(' INSERT INTO EVENTOSPREV(IDEVENTOSPREV,   DATAREGISTRO,   DATAEVENTO,      ' +
                         '                         IDPESSOA,        IDPESSJUR,      IDPLANOPREV,  SEQPROPOSTA, ' +
                         '                         IDSITFUNCATUAL,  IDSITPARTATUAL, IDSITPLANOATUAL, ' +
                         '                         IDSITFUNCNOVO,   IDSITPARTNOVO,  IDSITPLANONOVO,  ' +
                         '                         IDEVENTOGERADOR, FLGSITFUNCIMED, FLGSITPARTIMED, FLGSITPLANOIMED, ' +
                         '                         DATAEFETIVADO,   FLGEFETIVADO) ' +
                         ' VALUES(' + IntToStr(iIdEventoPrev) + ',' + ' To_Date(''' + DateToStr(Date) + ''',''dd/MM/yyyy'')' + ',' + ' To_Date(''' + Trim(dbdtInscricao.Text) + ''',''dd/MM/yyyy'')' + ',' +
                                      sIdPessoa + ',' + sIdPessJur + ',' + sIdPlanoPrev   + ',' + sSeqProposta + ',' + '''' +
                                      qrySitFunc.FieldbyName('IDSITFUNC').AsString + '''' + ',' + qrySitPart.FieldbyName('IDSITPART').AsString + ',' + qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString + ',' + '''' +
                                      qrySitFunc.FieldbyName('IDSITFUNC').AsString + '''' + ',' + qrySitPart.FieldbyName('IDSITPART').AsString + ',' + qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString + ',' +
                                      sIdEventoGerador + ',' + sFlgSitFuncImed + ',' + sFlgSitPartImed + ',' + sFlgSitPlanoImed + ',' +
                                      sDataEfetivado + ',' + sFlgEfetivado + ')');
          try
             qryAux.ExecSQL;
          except
             on E:EDBEngineError do
               begin
                    MostrarErro(E);
                    Exit;
               end;
          end;
     end
  else
     begin
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.Sql.Add(' UPDATE EVENTOSPREV SET DATAALTERADO = To_Date(''' + DateToStr(Date) + ''',''dd/MM/yyyy'')' + ',' +
                         '                        DATAEVENTO   = To_Date(''' + Trim(dbdtInscricao.Text) + ''',''dd/MM/yyyy'')' + ',' +
                         '                        IDSITFUNCATUAL  = ''' + qrySitFunc.FieldbyName('IDSITFUNC').AsString + ''',' +
                         '                        IDSITPARTATUAL  = ' + qrySitPart.FieldbyName('IDSITPART').AsString + ',' +
                         '                        IDSITPLANOATUAL = ' + qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString  + ',' +
                         '                        IDSITFUNCNOVO   = ''' + qrySitFunc.FieldbyName('IDSITFUNC').AsString + ''',' +
                         '                        IDSITPARTNOVO   = ' + qrySitPart.FieldbyName('IDSITPART').AsString + ',' +
                         '                        IDSITPLANONOVO  = ' + qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString  +
                         ' WHERE (SEQPROPOSTA     = ' + sSeqProposta + ') AND ' +
                         '       (IDPESSJUR       = ' + sIdPessJur   + ') AND ' +
                         '       (IDPLANOPREV     = ' + sIdPlanoPrev + ') AND ' +
                         '       (IDPESSOA        = ' + sIdPessoa    + ') AND ' +
                         '       (IDEVENTOGERADOR = ' + sIdEventoGerador + ') AND ' +
                         '       (DATAVOLTA IS NULL) ');
          try
             qryAux.ExecSQL;
          except
             on E:EDBEngineError do
               begin
                    MostrarErro(E);
                    Exit;
               end;
          end;
     end;
end;

procedure TfrmCadElegivel.qryElegPatroAfterInsert(DataSet: TDataSet);
begin
  inherited;
  dbedSalario.Enabled := (qryElegPatro.State = dsInsert);
end;

procedure TfrmCadElegivel.dsElegPatroStateChange(Sender: TObject);
begin
  inherited;
  dbedSalario.Enabled := (qryElegPatro.State = dsInsert);
end;

procedure TfrmCadElegivel.bbtnOpcoesClick(Sender: TObject);
var bPodeAlterarOpcoes {, bOpcoesExistem} : boolean;
    cAuxSeparador : char;
begin
  inherited;
  // Verificar se participante já fez opções
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3 FROM ELEGPATRO ' +
                 ' WHERE (IDPESSJUR   = ' +qryelegpatro.fieldbyname('idpessjur').AsString+ ') AND '+
                 ' (IDPESSOA = '+qryelegpatro.fieldbyname('idpessoa').AsString+') ' );
  qryAux.Open;

  if qryAux.IsEmpty then
  begin
     rOpcao1 := 0;
     rOpcao2 := 0;
     rOpcao3 := 0;
  end
  else
  begin
     if qryAux.FieldByName('VALORBASE1').AsString <> '' then
       rOpcao1 := qryAux.FieldByName('VALORBASE1').AsFloat
     else
       rOpcao1 := 0;

     if qryAux.FieldByName('VALORBASE2').AsString <> '' then
       rOpcao2 := qryAux.FieldByName('VALORBASE2').AsFloat
     else
       rOpcao2 := 0;

     if qryAux.FieldByName('VALORBASE3').AsString <> '' then
       rOpcao3 := qryAux.FieldByName('VALORBASE3').AsFloat
     else
       rOpcao3 := 0;
  end;

  {If sTipoPrevidencia = 'F' then}
    bPodeAlterarOpcoes := True;
  {else
    bPodeAlterarOpcoes := False;}

  if not qryAux.IsEmpty then
  begin // Opcoes já cadastradas
   { bOpcoesExistem := True;}
     frmCadOpcoesElegivel := TfrmCadOpcoesElegivel.Create(Application);
     frmCadOpcoesElegivel.LerOpcoes(dbedNomeFantasia.text,  dblkpcmbPatro.text,
                                 qrypatro.FieldByName('NOMEVALORBASE1').AsString,
                                 qrypatro.FieldByName('NOMEVALORBASE2').AsString,
                                 qrypatro.FieldByName('NOMEVALORBASE3').AsString,
                                 qrypatro.FieldByName('NUMOPCOES').AsInteger,
                                 rOpcao1, rOpcao2, rOpcao3, bPodeAlterarOpcoes,
                                 qrypatro.FieldByName('FLGEDITAOP1').AsInteger,
                                 qrypatro.FieldByName('FLGEDITAOP2').AsInteger,
                                 qrypatro.FieldByName('FLGEDITAOP3').AsInteger,
                                 qryelegpatro.fieldbyname('IDPESSJUR').AsInteger,
                                 qryelegpatro.fieldbyname('IDPESSOA').AsInteger,
                                 '','');
     frmCadOpcoesElegivel.Free;
  end
  else begin // Cadastrar Opcoes
   { bOpcoesExistem := False;}
     frmCadOpcoesElegivel := TfrmCadOpcoesElegivel.Create(Application);
     frmCadOpcoesElegivel.LerOpcoes(dbedNomeFantasia.text, dblkpcmbPatro.text,
                                 qrypatro.FieldByName('NOMEVALORBASE1').AsString, qrypatro.FieldByName('NOMEVALORBASE2').AsString,
                                 qrypatro.FieldByName('NOMEVALORBASE3').AsString,
                                 qrypatro.FieldByName('NUMOPCOES').AsInteger,
                                 rOpcao1, rOpcao2, rOpcao3, bPodeAlterarOpcoes,
                                 qrypatro.FieldByName('FLGEDITAOP1').AsInteger,
                                 qrypatro.FieldByName('FLGEDITAOP2').AsInteger,
                                 qrypatro.FieldByName('FLGEDITAOP3').AsInteger,
                                 qryelegpatro.fieldbyname('IDPESSJUR').AsInteger,
                                 qryelegpatro.fieldbyname('IDPESSOA').AsInteger,
                                 '', '');

     frmCadOpcoesElegivel.Free;
  end;

  // Gravar Opcoes do participante na BenefPlanoPart
  {if (rOpcao1 >= 0) and (rOpcao2 >= 0) and (rOpcao3 >= 0) and
     (not bOpcoesExistem)
  then begin // Opcoes ainda nao existiam
     qryAux.Close;
     qryAux.SQL.Clear;
     cAuxSeparador    := DecimalSeparator;
     DecimalSeparator := '.';
     qryAux.SQL.Add(' INSERT INTO ELEGPATRO (IDPESSJUR,IDPESSOA,VALORBASE1, '+
                    '             VALORBASE2,VALORBASE3) '+
                    ' VALUES ('+ qryelegpatro.fieldbyname('IDPESSJUR').AsString + ','+
                                 qryelegpatro.fieldbyname('IDPESSOA').AsString + ',' +
                                 FormatFloat('#0.00000',rOpcao1)+','+
                                 FormatFloat('#0.00000',rOpcao2)+','+
                                 FormatFloat('#0.00000',rOpcao3)+')');
     DecimalSeparator := cAuxSeparador;
     try
        qryAux.ExecSQL;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;//try
  end
  else begin // atualizar opcoes
     if(rOpcao1 >= 0) and (rOpcao2 >= 0) and (rOpcao3 >= 0) and
       (bOpcoesExistem)
     then begin}

     stateelegpatro := qryelegpatro.state;
     sidpessjurant := qryelegpatro.fieldbyname('idpessjur').AsString;
     sidpessoaant := qryelegpatro.fieldbyname('idpessoa').AsString;

     if (rOpcao1 >= 0) and (rOpcao2 >= 0) and (rOpcao3 >= 0) and
        (frmCadOpcoesElegivel.ModalResult = mrok) and
        (qryelegpatro.state = dsedit)
     then begin
        qryAux.Close;
        qryAux.SQL.Clear;
        cAuxSeparador    := DecimalSeparator;
        DecimalSeparator := '.';
        qryAux.SQL.Add(' UPDATE ELEGPATRO SET VALORBASE1 = ' + FormatFloat('#0.00000',rOpcao1) + ',' +
                       '                      VALORBASE2 = ' + FormatFloat('#0.00000',rOpcao2) + ',' +
                       '                      VALORBASE3 = ' + FormatFloat('#0.00000',rOpcao3) +
                       ' WHERE (IDPESSJUR   = ' + qryelegpatro.fieldbyname('IDPESSJUR').AsString   + ') AND ' +
                       '       (IDPESSOA    = ' + qryelegpatro.fieldbyname('IDPESSOA').AsString   + ') ' );
        DecimalSeparator := cAuxSeparador;
        try
           qryAux.ExecSQL;
        except
           on E:EDBEngineError do
           begin
              MostrarErro(E);
              Exit;
           end;
        end;// except
     end;//if

     //end; // if
  //end;

end;

procedure TfrmCadElegivel.qryElegPatroAfterPost(DataSet: TDataSet);
var cAuxSeparador : char;
begin
  inherited;
  if (rOpcao1 >= 0) and (rOpcao2 >= 0) and (rOpcao3 >= 0) and
     ( stateelegpatro = dsinsert)
  then begin
     qryAux.Close;
     qryAux.SQL.Clear;
     cAuxSeparador    := DecimalSeparator;
     DecimalSeparator := '.';
     qryAux.SQL.Add(' UPDATE ELEGPATRO SET VALORBASE1 = ' + FormatFloat('#0.00000',rOpcao1) + ',' +
                    '                      VALORBASE2 = ' + FormatFloat('#0.00000',rOpcao2) + ',' +
                    '                      VALORBASE3 = ' + FormatFloat('#0.00000',rOpcao3) +
                    ' WHERE (IDPESSJUR   = ' +sidpessjurant+ ') AND ' +
                    '       (IDPESSOA    = ' +sidpessoaant+ ') ' );
     DecimalSeparator := cAuxSeparador;
     try
        qryAux.ExecSQL;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;// except
  end;//if
end;

end.


