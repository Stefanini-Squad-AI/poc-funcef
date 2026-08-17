// Alterado por André Tavares  09/10/2003 - pendência 15124

unit fCadDepTitPlanAss;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, MontaSelect,
  DBCtrls, Db, DBTables, Wwquery, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, Menus, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, URegra;

type
  TfrmCadDepTitPlanAss = class(TfrmSairAjuda)
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnInserir: TToolbarButton97;
    sbtnAlterar: TToolbarButton97;
    sbtnProcurar: TToolbarButton97;
    sbtnApagar: TToolbarButton97;
    qryPessoa: TwwQuery;
    qryDependente: TwwQuery;
    qryBenef: TwwQuery;
    dsPlanAss: TwwDataSource;
    dsDependente: TwwDataSource;
    dsBenef: TwwDataSource;
    qryaux: TwwQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    sbtnAssocia: TSpeedButton;
    sbtnAssociaTodos: TSpeedButton;
    sbtnDesassocia: TSpeedButton;
    sbtnDesassociaTodos: TSpeedButton;
    Panel4: TPanel;
    lokuplstbenefrel: TDBLookupListBox;
    Panel6: TPanel;
    Label1: TLabel;
    wwDBGrid1: TwwDBGrid;
    Panel7: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblpart: TLabel;
    lblpatro: TLabel;
    lblplano: TLabel;
    montaSelDepend: TMontaSelect;
    Panel8: TPanel;
    lokuplstdepend: TDBLookupListBox;
    Label3: TLabel;
    // DetalhamentodoDependente2: TMenuItem;
    Label8: TLabel;
    lblMatricula: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    lblInscricao: TLabel;
    qryPlanAss: TwwQuery;
    lblDtInclusao: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    lblBenef: TLabel;
    RegraInscBenef: TRegra;
    qryRegraInscBenef: TwwQuery;
    qryInscBenefAss: TwwQuery;
    qryUpdBenefAss: TwwQuery;
    qryContribAss: TwwQuery;
    qryInsContAss: TwwQuery;
    qryRegraCancBenef: TwwQuery;
    RegraCancBenef: TRegra;
    qryUpdContAss: TwwQuery;
    qryUpdDepenTit: TwwQuery;
    qryInsDepenTit: TwwQuery;
    qryDelDepenTit: TwwQuery;
    qryBenefAss: TwwQuery;
    Label10: TLabel;
    lblSituacao: TLabel;
    montaSel2: TMontaSelect;
    Shape1: TShape;
    Label7: TLabel;
    lblSitPlanAss: TLabel;
    Label13: TLabel;
    lblSitPrev: TLabel;
    lblSitInsc: TLabel;
    qryNucleo: TwwQuery;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnAssociaClick(Sender: TObject);
    procedure sbtnAssociaTodosClick(Sender: TObject);
    procedure sbtnDesassociaClick(Sender: TObject);
    procedure sbtnDesassociaTodosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btndependClick(Sender: TObject);
    procedure qryBenefBeforeOpen(DataSet: TDataSet);
    procedure qryDependenteBeforeOpen(DataSet: TDataSet);
    procedure lokuplstdependMouseDown(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; X, Y: integer);
    procedure lokuplstbenefrelMouseDown(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; X, Y: integer);
    procedure lokuplstdependDragOver(Sender, Source: TObject; X, Y: integer;
              State: TDragState; var Accept: boolean);
    procedure lokuplstbenefrelDragOver(Sender, Source: TObject; X, Y: integer;
              State: TDragState; var Accept: boolean);
    procedure lokuplstdependDragDrop(Sender, Source: TObject; X, Y: integer);
    procedure lokuplstbenefrelDragDrop(Sender, Source: TObject; X, Y: integer);
    procedure qryPlanAssAfterScroll(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure lokuplstdependoutroDragOver(Sender, Source: TObject; X, Y: integer;
              State: TDragState; var Accept: boolean);
    procedure btnDepClick(Sender: TObject);
    procedure lokuplstdependDblClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure lokuplstbenefrelDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
    iIdPlanoPrev, iIdPessJur, iIdFilial, iIdPlanAss, iIdTitular, iIdResponsavel,
    iCodPortForma: integer;
    bAbriuOutroForm, Consulta, telaconsulta: boolean;
    sMatricula, sInscricao: string;
    function AtualizaContribuicoes(piIdTitular, piIdDependente, piIdPlanAss, piIdPlanoPrev,
             piIdPessJur, piSeqProposta, piFlgAtivo: integer): boolean;
    function VerificaReInscricao(piIdTitular, piIdDependente, piIdPlanAss, piIdPlanoPrev,
             piIdPessJur, piSeqProposta: integer; var pdtEntrada, pdtCancelamento: TDateTime): boolean;
    function AtualizaBeneficiario(piIdTitular, piIdDependente, piIdPlanAss, piIdPlanoPrev,
             piIdPessJur, piSeqProposta, piFlgAtivo: integer; psObsCancel: string;
             pdtEntrada, pdtCancelamento: TDateTime): boolean;
    procedure InfPartAss;

  public
    { Public declarations }
  end;

var
  frmCadDepTitPlanAss: TfrmCadDepTitPlanAss;

implementation

uses FTelaAut, UDataBase, UMensErro, FCadDependenteASS, UParticipante, UAdmAss,
     FInscBenefAss, fCancBenefAss, fInserePart, FCadGeralPart;

{$R *.DFM}

procedure TfrmCadDepTitPlanAss.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  iIdPessJur := 0;
  iIdPlanoPrev := 0;
  iIdTitular := 0;

  sbtnProcurar.Down := false;

  try
     If (frmInserePart = Nil) and (frmCadGeralPart = Nil) then MontaSel2.Executar;
     if (MontaSel2.RetornouValor) and (frmInserePart = Nil) and (frmCadGeralPart = Nil) then
     (* Usuário entrou pela chamada normal - tela principal    *)
     begin
       iIdTitular   := StrToIntDef(MontaSel2.ValoresChave[0],0);
       iIdPlanAss   := StrToIntDef(Montasel2.ValoresChave[1],0);
       iIdPlanoPrev := StrToIntDef(MontaSel2.ValoresChave[2],0);
       iIdPessJur   := StrToIntDef(Montasel2.ValoresChave[3],0);
       if  MontaSel2.ValoresChave[4] <> '' then
         iIdFilial  := StrToIntDef(Montasel2.ValoresChave[4],0);
       sMatricula   := MontaSel2.ValoresChave[5];
       sInscricao   := MontaSel2.ValoresChave[6];

       InfPartAss;
     //==========
//       btndepend.enabled := true;
     end;

     if frmInserePart <> Nil then
     (* Usuário entrou pela tela de inserçao de participante   *)
     begin
       iIdTitular   := frmInserePart.iIdTitular;
       iIdPlanAss   := frmInserePart.iIdPlanAss;
       iIdPlanoPrev := frmInserePart.iIdPlanoPrev;
       iIdPessJur   := frmInserePart.iIdPessJur;
       if  frmInserePart.iIdFilial > 0 then
         iIdFilial  := frmInserePart.iIdFilial;
       sMatricula   := frmInserePart.sMatricula;
       sInscricao   := frmInserePart.sInscricao;

       InfPartAss;
//
     end;

     if frmCadGeralPart <> Nil then
     begin
     (* Usuário entrou pela tela de cadastro geral             *)
       iIdTitular   := frmCadGeralPart.iIdTitular;
       iIdPlanAss   := frmCadGeralPart.iIdPlanAss;
       iIdPlanoPrev := frmCadGeralPart.iIdPlanoPrev;
       iIdPessJur   := frmCadGeralPart.iIdPessJur;
       if  frmCadGeralPart.iIdFilial > 0 then
         iIdFilial  := frmCadGeralPart.iIdFilial;
       sMatricula   := frmCadGeralPart.sMatricula;
       sInscricao   := frmCadGeralPart.sInscricao;

       InfPartAss;
//
     end;

  except
     qrypessoa.close;
     qryPlanAss.close;
     qrydependente.close;
     qrybenef.close;

     lblPart.Caption := '';
     lblPatro.Caption := '';
     lblPlano.Caption := '';
     lblInscricao.Caption := '';
     lblSituacao.Caption := '';
     lblSitPlanAss.Caption := '';
     lblSitPrev.Caption := '';
     lblSitInsc.Caption := '';
//
  end;
end;

procedure TfrmCadDepTitPlanAss.sbtnAssociaClick(Sender: TObject);
var bConfirmaDados: boolean;
    dtCancelamento: TDateTime;
    sObsCancel, DataUlt: string;
    NumContribAtraso: integer;
begin
  inherited;
  dtCancelamento := Date;
  sObsCancel := '';

  if (qrybenef.isempty) or (qryPlanAss.isempty) then
    exit;

  Consulta := false;

  //início - André Tavares  09/10/2003 - pendência 15124 - o iumbecil que programou isso não criou o form antes de usá-lo
  frmCancBenefAss := TfrmCancBenefAss.Create(self);
  //fim - André Tavares  09/10/2003 - pendência 15124

  bConfirmaDados := frmCancBenefAss.PedeDadosCancBenefAss
                   (lblpart.Caption,
                    qryBenef.FieldbyName('NOME').AsString,
                    qryPlanAss.FieldByName('NOME').AsString,
                    sInscricao,
                    sMatricula,
                    qryBenef.FieldbyName('IDDEPENDENCIA').AsString,
                    qryBenef.FieldbyName('DESCRICAO').AsString,
                    qryBenef.FieldbyName('DATAENTRADA').AsString,
                    iIdTitular,
                    qryBenef.FieldbyName('IDPESSOA').AsInteger,
                    dtCancelamento,
                    sObsCancel);

  if bConfirmaDados then
  begin
    ////////////////////////////////////////////REGRA////////////////////////////////
    qryRegraCancBenef.close;
    if (qryBenef.FieldByName('IDREGRADESISTENC').AsInteger <> 0) then
    begin
      DataUlt := DataUltEvento(IntToStr(iIdPessJur), IntToStr(iIdTitular),
                               qryBenef.FieldByName('IDPESSOA').AsString,
                               qryPlanAss.fieldbyname('IDPLANASS').AsString,
                               IntToStr(iIdPlanoPrev));
      NumContribAtraso := MensAtraso(IntToStr(iIdPessJur),IntToStr(iIdTitular),
                                     qryBenef.FieldByName('IDPESSOA').AsString,
                                     qryPlanAss.fieldbyname('IDPLANASS').AsString,
                                     IntToStr(iIdPlanoPrev));

      RegraCancBenef.rulename := qryBenef.FieldByName('IDREGRADESISTENC').AsString;
      if Trim(DataUlt) <> '' then
        qryRegraCancBenef.ParamByName('DATAULTEVENTO').Value := StrToDateTime(DataUlt)
      else
        qryRegraCancBenef.ParamByName('DATAULTEVENTO').Clear;

      qryRegraCancBenef.ParamByName('CONTATRASO').Value := NumContribAtraso;

      qryRegraCancBenef.ParamByName('IDDEPENDENTE').Value := qryDependente.FieldbyName('IDPESSOA').AsInteger;
      qryRegraCancBenef.ParamByName('IDTITULAR').Value := iIdTitular;
      qryRegraCancBenef.ParamByName('IDPLANASS').Value := qryPlanAss.fieldbyname('IDPLANASS').AsInteger;
      qryRegraCancBenef.ParamByName('IDPESSJUR').Value := iIdPessJur;
      qryRegraCancBenef.ParamByName('IDPLANOPREV').Value := iIdPlanoPrev;

      qryRegraCancBenef.open;

      RegraCancBenef.execute;

      qryRegraInscBenef.close;

      if (RegraCancBenef.result = 'False') then
      begin
        MsgDlg('Este Dependente não pode ser cancelado por não satisfazer a Regra de Cancelamento por Desistência do Plano !',
               'Informação', mtInformation, [mbOk], 0);
        TiraSQL(qryAux);
        exit;
      end;
    end;

    if not AtualizaBeneficiario(iIdTitular,
                                qryBenef.FieldbyName('IDPESSOA').AsInteger,
                                qryPlanAss.fieldbyname('IDPLANASS').AsInteger,
                                iIdPlanoPrev,
                                iIdPessJur,
                                1,
                                0,
                                sObsCancel,
                                qryBenef.FieldbyName('DATAENTRADA').AsDateTime,
                                dtCancelamento) then
    begin
      MsgDlg('Erro no Cancelamento do Dependente.', 'Erro', mtError, [mbOk], 0);
      TiraSQL(qryAux);
      exit;
    end;

    if not AtualizaContribuicoes(iIdTitular,qryBenef.FieldbyName('IdPessoa').AsInteger,
                                 qryPlanAss.fieldbyname('IDPLANASS').AsInteger,iIdPlanoPrev,
                                 iIdPessJur, 1, 0) then
    begin
      MsgDlg('Erro no Cancelamento das Contribuições do Dependente.', 'Erro', mtError, [mbOk], 0);
      TiraSQL(qryAux);
      exit;
    end;
  end;
  // atualiza listas de beneficiário e de dependentes
  qrybenef.close;
  qrydependente.close;
  qrybenef.open;
  qrydependente.open;
end;

procedure TfrmCadDepTitPlanAss.sbtnAssociaTodosClick(Sender: TObject);
begin
  inherited;
  if (qryBenef.isempty) or (qryPlanAss.isempty) then
    exit;

  qryBenef.first;
  while not qryBenef.eof do
  begin
    sbtnAssociaClick(Sender);
    qryBenef.Next;
  end;

  // atualiza listas de beneficiário e de dependentes
  qrybenef.close;
  qrydependente.close;
  qrybenef.open;
  qrydependente.open;
  if not qrybenef.IsEmpty then
    MsgDlg('Não foi possível desassociar alguns dos Beneficiários/Dependentes.',
           'Aviso', mtError, [mbOk], 0);
end;

procedure TfrmCadDepTitPlanAss.sbtnDesassociaClick(Sender: TObject);
var
  bConfirmaDados: boolean;
  dtEntrada, dtCancelamento, dtInscricao: TDateTime;
  iFlgAtivo: Integer;
  sSql : String;
begin
  inherited;
  dtInscricao := Date;
  iFlgAtivo := 1;
  if (qryDependente.isEmpty) or (qryPlanAss.isEmpty) then
    exit;

  Consulta := false;

  //início - André Tavares  09/10/2003 - pendência 15124 - o iumbecil que programou isso não criou o form antes de usá-lo
  frmInscBenefAss := TfrmInscBenefAss.Create(self);
  //fim - André Tavares  09/10/2003 - pendência 15124
  bConfirmaDados := frmInscBenefAss.PedeDadosInscBenefAss
                                   (lblpart.Caption,
                                    qryDependente.FieldbyName('Nome').AsString,
                                    qryPlanAss.FieldByName('Nome').AsString,
                                    sInscricao,
                                    sMatricula,
                                    qryDependente.FieldbyName('IdDependencia').AsString,
                                    qryDependente.FieldbyName('Descricao').AsString,
                                    iIdTitular,
                                    qryDependente.FieldbyName('IdPessoa').AsInteger,
                                    dtInscricao,
                                    iFlgAtivo);
  if bConfirmaDados then
  begin
    // Executa a Regra de Admisão do Beneficiário
    qryRegraInscBenef.close;
    if (qryPlanAss.FieldByName('IDREGRABENEFICIA').AsInteger <> 0) then
    begin
      RegraInscBenef.rulename := qryPlanAss.FieldByName('IDREGRABENEFICIA').AsString;
      //PARAM
      qryRegraInscBenef.ParamByName('IDDEPENDENTE').Value := qryDependente.FieldbyName('IDPESSOA').AsInteger;
      qryRegraInscBenef.ParamByName('IDTITULAR').Value := iIdTitular;
      qryRegraInscBenef.ParamByName('IDPLANASS').Value := qryPlanAss.FieldByName('IDPLANASS').AsInteger;
      qryRegraInscBenef.ParamByName('IDPESSJUR').Value := iIdPessJur;
      qryRegraInscBenef.ParamByName('IDPLANOPREV').Value := iIdPlanoPrev;
      qryRegraInscBenef.ParamByName('DTINSCRICAO').Value := DateToStr(dtInscricao);
      //
      qryRegraInscBenef.open;
      try
        RegraInscBenef.execute;
      except

      end;

      qryRegraInscBenef.close;

      if (RegraInscBenef.result = 'False') then
      begin
        MsgDlg('Este Dependente não satisfaz a Regra de Admissão do Beneficiário do Plano !',
               'Informação', mtInformation, [mbOk], 0);
        TiraSQL(qryAux);
        exit;
      end;
    end;

    if VerificaReInscricao(iIdTitular,qryDependente.FieldByName('IDPESSOA').AsInteger,
                           qryPlanAss.FieldByName('IDPLANASS').AsInteger,
                           iIdPlanoPrev,iIdPessJur,
                           1,dtEntrada,dtCancelamento) then
    begin
      if MsgDlg('Este Beneficiário já esteve neste Plano no período de '+
                DateTimeToStr(dtEntrada)+' a '+DateTimeToStr(dtCancelamento)+'.'+#13+#10+
                'Deseja Reinscrivê-lo ?','Confirmação',mtConfirmation,[mbyes,mbno],0) = mryes then
      begin
        // Registrar em algum lugar que houve uma reinscrição de beneficiário.
        if not AtualizaBeneficiario(iIdTitular,qryDependente.FieldByName('IDPESSOA').AsInteger,
                                    qryPlanAss.FieldByName('IDPLANASS').AsInteger,
                                    iIdPlanoPrev,iIdPessJur,1,1,'',dtInscricao,0) then
        begin
          MsgDlg('Ocorreu um erro na atualização nos dados do beneficiário.',
                 'Erro', mtError, [mbOk], 0);
          TiraSQL(qryAux);
          exit;
        end;
        if not AtualizaContribuicoes(iIdTitular,qryDependente.FieldByName('IDPESSOA').AsInteger,
                                     qryPlanAss.FieldByName('IDPLANASS').AsInteger,
                                     iIdPlanoPrev, iIdPessJur, 1, 1) then
        begin
          MsgDlg('Erro na Reativação das Contribuições do Dependente.', 'Erro', mtError, [mbOk], 0);
          TiraSQL(qryAux);
          exit;
        end;
      end;
    end
    else
    begin
      // Insere o Beneficiário
      qryInscBenefAss.Close;
      qryInscBenefAss.ParamByName('IDTITULAR').Value := iIdTitular;
      qryInscBenefAss.ParamByName('IDDEPENDENTE').Value := qryDependente.FieldbyName('IDPESSOA').AsInteger;
      qryInscBenefAss.ParamByName('IDPLANASS').Value := qryPlanAss.FieldByName('IDPLANASS').AsInteger;
      qryInscBenefAss.ParamByName('IDPLANOPREV').Value := iIdPlanoPrev;
      qryInscBenefAss.ParamByName('IDPESSJUR').Value := iIdPessJur;
      qryInscBenefAss.ParamByName('SEQPROPOSTA').Value := 1;
      qryInscBenefAss.ParamByName('DATAENTRADA').Value := dtInscricao;
      qryInscBenefAss.ParamByName('FLGATIVO').Value := iFlgAtivo;

      try
        qryInscBenefAss.ExecSQL;
      except
        MsgDlg('Erro na inclusão do Dependente.','Erro',mtError,[mbOk],0);
        TiraSQL(qryAux);
        exit;
      end;

      qryContribAss.Close;
      qryContribAss.ParamByName('IDPLANASS').Value := qryPlanAss.FieldByName('IDPLANASS').AsInteger;
      qryContribAss.Open;

      sSql := ' SELECT DISTINCT N.IDRESPONSAVEL, C.CODPORTFORMA' +
              ' FROM NUCLEOFAMASS N, CONTASS C' +
              ' WHERE  C.IDTITULAR = ' + IntToStr(iIdTitular) +
              '    AND C.IDPLANASS = ' + qryPlanAss.FieldByName('IDPLANASS').AsString +
              ' AND N.IDTITULAR(+) = C.IDTITULAR';
      qryNucleo.Close;
      qryNucleo.SQL.Clear;
      qryNucleo.SQL.Add(sSql);
      try
        qryNucleo.Open;
      except
        MsgDlg('Ocorreu um erro na busca do responsável do Grupo familiar!',
               'Informação', mtInformation, [mbOk], 0);
        Exit;
      end;
      if qryNucleo.IsEmpty then begin
         iIdResponsavel := 0;
         iCodPortForma  := 0;
      end
      else begin
        if qryNucleo.fieldbyName('IDRESPONSAVEL').AsString = '' then
          iIdResponsavel := 0
        else iIdResponsavel := qryNucleo.fieldbyName('IDRESPONSAVEL').AsInteger;
        if qryNucleo.fieldbyName('CODPORTFORMA').AsString = '' then
          iCodPortForma  := 0
        else iCodPortForma  := qryNucleo.fieldbyName('CODPORTFORMA').AsInteger;
      end;


      // Insere as contribuições do Beneficiário
      while not qryContribAss.eof do
      begin
        qryInsContAss.Close;
        qryInsContAss.ParamByName('IDPLANASS').Value := qryPlanAss.FieldByName('IDPLANASS').AsInteger;
        qryInsContAss.ParamByName('IDTITULAR').Value := iIdTitular;
        qryInsContAss.ParamByName('IDDEPENDENTE').Value := qryDependente.FieldbyName('IDPESSOA').AsInteger;
        qryInsContAss.ParamByName('IDPLANOPREV').Value := iIdPlanoPrev;
        qryInsContAss.ParamByName('IDPESSJUR').Value := iIdPessJur;
        qryInsContAss.ParamByName('IDCONTASS').Value := qryContribAss.FieldByName('IDCONTASS').AsInteger;
        qryInsContAss.ParamByName('FLGATIVO').Value := iFlgAtivo;
        qryInsContAss.ParamByName('RECPAG').Value := 'R';
        qryInsContAss.ParamByName('FLGCOBCARNE').Clear;
        if iCodPortForma = 0 then
          qryInsContAss.ParamByName('CODPORTFORMA').Clear
        else qryInsContAss.ParamByName('CODPORTFORMA').Value := iCodPortForma;

        if qryContribAss.FieldByName('PAGADOR').AsString = 'C' then begin
          if iIdResponsavel = 0 then
            qryInsContAss.ParamByName('IDPAGADOR').Value := iIdTitular
          else qryInsContAss.ParamByName('IDPAGADOR').Value := iIdResponsavel;
        end
        else  qryInsContAss.ParamByName('IDPAGADOR').Value := iIdPessJur;

        qryInsContAss.ParamByName('SEQPROPOSTA').Value := 1;
        try
          qryInsContAss.ExecSQL;
        except
          MsgDlg('Erro na Inclusão das Contribuições do Dependente.','Erro',mtError,[mbOk],0);
          TiraSQL(qryAux);
          exit;
        end;
        qryContribAss.Next;
      end; // while
      qryContribAss.Close;
    end;
  end;
  // atualiza listas de beneficiário e de dependentes
  qryBenef.close;
  qryBenef.open;
  qryDependente.close;
  qryDependente.open;
end;

procedure TfrmCadDepTitPlanAss.sbtnDesassociaTodosClick(Sender: TObject);
begin
  inherited;
  if (qryDependente.isEmpty) or (qryPlanAss.isEmpty) then
    exit;

  if qryPessoa.fieldbyname('FLGINSCRICAOCANC').asInteger = 1 then
  begin
    MsgDlg('A inscrição do titular está cancelada !', 'Erro', mtInformation, [mbOk], 0);
    exit;
  end;

  qryDependente.first;
  while not qryDependente.eof do
  begin
    sbtnDesassociaClick(Sender);
    qryDependente.Next;
  end;
  // atualiza listas de beneficiário e de dependentes
  qryBenef.close;
  qryDependente.close;
  qryBenef.open;
  qryDependente.open;
end;

procedure TfrmCadDepTitPlanAss.btndependClick(Sender: TObject);
begin
(*  inherited;
  try
     bAbriuOutroForm := true;  {V} {ESSA TELA DEVE SAIR DAQUI}
     frmCadDependenteAss := TfrmCadDependenteASS.Create(Application);
     frmCadDependenteAss.CadDepenTit(lblPart.Caption,
                                     lblPatro.Caption,
                                     lblPlano.Caption,
                                     sMatricula,
                                     iIdPlanoPrev,
                                     iIdPessJur,
                                     iIdTitular);
  except
     frmCadDependenteAss.close;
  end; *)
end;

procedure TfrmCadDepTitPlanAss.qryBenefBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryBenef.parambyname('IDPESSOA').Value := iIdTitular;
  qryBenef.parambyname('IDPESSJUR').Value := iIdPessJur;
  qryBenef.parambyname('IDPLANOPREV').Value := iIdPlanoPrev;
  qryBenef.parambyname('IDPLANASS').Value := qryPlanAss.fieldbyname('IDPLANASS').AsInteger;
end;

procedure TfrmCadDepTitPlanAss.qryDependenteBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryDependente.parambyname('IDPESSOA').Value := iIdTitular;
  qryDependente.parambyname('IDPESSJUR').Value := iIdPessJur;
  qryDependente.parambyname('IDPLANOPREV').Value := iIdPlanoPrev;
  qryDependente.parambyname('IDPLANASS').Value := qryPlanAss.fieldbyname('IDPLANASS').AsInteger;
end;

procedure TfrmCadDepTitPlanAss.lokuplstdependMouseDown(Sender: TObject;
          Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  inherited;
  if button = mbLeft then
    TDBLookUplistBox(Sender).BeginDrag(True)
  else
    telaconsulta := false;
end;

procedure TfrmCadDepTitPlanAss.lokuplstbenefrelMouseDown(Sender: TObject;
          Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  inherited;
  if button = mbLeft then
  begin
    TDBLookUplistBox(Sender).BeginDrag(True);
    telaconsulta := false;
  end
  else
    telaconsulta := true;
end;

procedure TfrmCadDepTitPlanAss.lokuplstdependDragOver(Sender, Source: TObject;
          X, Y: integer; State: TDragState; var Accept: boolean);
begin
  inherited;
  Accept := true;
end;

procedure TfrmCadDepTitPlanAss.lokuplstbenefrelDragOver(Sender, Source: TObject;
          X, Y: integer; State: TDragState; var Accept: boolean);
begin
  inherited;
  Accept := true;
end;

procedure TfrmCadDepTitPlanAss.lokuplstdependDragDrop(Sender, Source: TObject;
          X, Y: integer);
begin
  inherited;
  if (Sender is TDBLookUpListBox) and
     (Source is TDBLookUpListBox) and
     (not telaConsulta) then
  begin
    TDBLookUpListBox(Source).EndDrag(True);

    if not (TDBLookUpListBox(Source).Name = ('lokuplstbenefrel')) then
      exit;

    if qrybenef.isempty then
      exit;

    // atualiza listas de beneficiário e de dependentes
    qryBenef.close;
    qryDependente.close;
    qryBenef.open;
    qryDependente.open;
  end;
end;

procedure TfrmCadDepTitPlanAss.lokuplstbenefrelDragDrop(Sender, Source: TObject;
          X, Y: integer);
begin
  inherited;
  if (Sender is TDBLookUpListBox) and
     (Source is TDBLookUpListBox) and
     (not telaconsulta) then
  begin
    TDBLookUpListBox(Source).EndDrag(True);

    if not (TDBLookUpListBox(Source).Name = ('lokuplstdepend')) then
      exit;

    //sbtnAssociaClick(self);
    if (qrydependente.isempty) or (qryPlanAss.isempty) then
      exit;

    // atualiza listas de beneficiário e de dependentes
    qrybenef.close;
    qrydependente.close;
    qrybenef.open;
    qrydependente.open;
  end;
end;

procedure TfrmCadDepTitPlanAss.qryPlanAssAfterScroll(DataSet: TDataSet);
begin
  inherited;
  // atualiza listas de beneficiário e de dependentes
  qryBenef.close;
  qryBenef.open;
  qryDependente.close;
  qryDependente.open;
  qryPessoa.close;
  try
     qryPessoa.parambyname('IDPESSOA').Value := iIdTitular;
     qryPessoa.parambyname('IDPLANOPREV').Value := iIdPlanoPrev;
     qryPessoa.parambyname('IDPESSJUR').Value := iIdPessJur;
     qryPessoa.ParamByName('IDPLANASS').Value := qryPlanAss.fieldbyname('IDPLANASS').AsInteger;
     qryPessoa.open;

     lblPart.Caption := qryPessoa.fieldbyname('NOME').AsString;
     lblPatro.Caption := qryPessoa.fieldbyname('PATRO').AsString;
     lblPlano.Caption := qryPessoa.fieldbyname('PLANO').AsString;
     lblDtInclusao.Caption := qryPessoa.fieldbyname('DATAENTRADA').AsString;
     lblBenef.Caption := qryPessoa.fieldbyname('BENEF').AsString;
     lblMatricula.Caption := sMatricula;
     lblInscricao.Caption := sInscricao;
     lblSituacao.Caption := qryPessoa.fieldbyname('SITUACAO').AsString;
     lblSitPlanAss.Caption := qryPessoa.fieldbyname('SITPLANASS').asString;
     lblSitPrev.Caption := qryPessoa.fieldbyname('SITPLANOPREV').asString;
     case qryPessoa.fieldbyname('FLGINSCRICAOCANC').asInteger of
       0: begin
            lblSitInsc.Caption := 'Inscrição normal';
            lblSitInsc.Font.Color := clWindowText;
          end;
       1: begin
            lblSitInsc.Caption := 'INSCRIÇÃO CANCELADA';
            lblSitInsc.Font.Color := clRed;
          end;
     end;
  except
    lblPart.caption := '';
    lblPatro.caption := '';
    lblPlano.caption := '';
    lblSitPlanAss.caption := '';
    lblSitPrev.Caption := '';
  end;
end;

procedure TfrmCadDepTitPlanAss.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if iIdTitular = 0 then
    exit;
  InfPartAss;
//==========  
end;

procedure TfrmCadDepTitPlanAss.lokuplstdependoutroDragOver(Sender, Source: TObject;
          X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := true;
end;

procedure TfrmCadDepTitPlanAss.btnDepClick(Sender: TObject);
var
   sIdDependencia: string;
   iNumSequencia, iIdDependente, iFlgContaIR, iFlgContaSalF: longint;
   bConfirmaDados: boolean;
begin
   bConfirmaDados:=True;
   inherited;
   if iIdTitular = 0 then
     exit;

   montaSelDepend.Filtro.Add('PESSOA.IDPESSOA'+
                             '  NOT IN (SELECT IDPESSOA FROM DEPENTIT'+
                                       ' WHERE (IDTITULAR = '+inttostr(iIdTitular)+'))');
   montaSelDepend.Executar;
   if montaSelDepend.RetornouValor then
   begin
     Consulta := false;

     iIdDependente := StrToIntDef(montaSelDepend.ValoresChave[0],0);
     iNumSequencia := ProximaSequenciaDependente(iIdTitular, qryAux);
     sIdDependencia := '';
     iFlgContaIR := 0;
     iFlgContaSalF := 0;


{     frmPedeDadosDependencia := TfrmPedeDadosDependencia.Create(Application);
     bConfirmaDados := frmPedeDadosDependencia.PedeDadosDependencia
                                              (lblpart.Caption,
                                               montaSelDepend.ValoresChave[1],
                                               sMatricula,
                                               sIdDependencia,
                                               iNumSequencia,
                                               iFlgContaIR,
                                               iFlgContaSalF);
 }    if bConfirmaDados then
     begin
       qryInsDepenTit.Close;
       qryInsDepenTit.ParamByName('IDPESSOA').Value := iIdDependente;
       qryInsDepenTit.ParamByName('IDTITULAR').Value := iIdTitular;
       qryInsDepenTit.ParamByName('NUMSEQUENCIA').Value := iNumSequencia;
       qryInsDepenTit.ParamByName('FLGCONTAIMPOSTOR').Value := iFlgContaIR;
       qryInsDepenTit.ParamByName('FLGCONTASALARIOF').Value := iFlgContaSalF;
       qryInsDepenTit.ParamByName('IDDEPENDENCIA').Value := sIdDependencia;
       try
          qryInsDepenTit.ExecSQL;
       except
          MsgDlg('Ocorreu um erro na associação do dependente ao titular. '+
                 'Os dados do dependente já foram gravados. O dependente apenas '+
                 ' não foi associado ao participante. Verifique. ','Aviso',mtError,[mbOk],0);
          TiraSQL(qryAux);
          exit;
       end;
     end;
     // atualiza listas de beneficiário e de dependentes
     qryBenef.Close;
     qryDependente.Close;
     qryBenef.Open;
     qryDependente.Open;
   end;
end;

procedure TfrmCadDepTitPlanAss.lokuplstdependDblClick(Sender: TObject);
begin
  inherited;
  sbtnAssociaClick(Sender);
end;

procedure TfrmCadDepTitPlanAss.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if qryDependente.IsEmpty then
    exit;

  if  MsgDlg('Deseja realmente apagar o relacionamento do dependente com o titular.',
             'Confirmação',mtConfirmation,[mbyes,mbno],0) = mryes then
  begin
    qryDelDepenTit.Close;
    qryDelDepenTit.ParamByName('IDPESSOA').Value := qryDependente.FieldByName('IDPESSOA').AsInteger;
    qryDelDepenTit.ParamByName('IDTITULAR').Value := iIdTitular;
    try
      qryDelDepenTit.ExecSQL;
    except
      MsgDlg('Não foi possível apagar o relacionamento Dependente/Titular.',
             'Aviso', mtError, [mbOk], 0);
      TiraSQL(qryAux);
      Exit;
    end;
    // atualiza listas de beneficiário e de dependentes
    qrybenef.close;
    qrydependente.close;
    qrybenef.open;
    qrydependente.open;
  end;
end;

procedure TfrmCadDepTitPlanAss.lokuplstbenefrelDblClick(Sender: TObject);
begin
  inherited;
  sbtnDesassociaClick(Sender);
end;

procedure TfrmCadDepTitPlanAss.FormCreate(Sender: TObject);
begin
  inherited;
  bAbriuOutroForm := false;
  WindowState := wsMaximized;
  sbtnProcurar.Click;
end;

procedure TfrmCadDepTitPlanAss.FormActivate(Sender: TObject);
begin
  if not bAbriuOutroForm then
    inherited
  else
  begin
    WindowState := wsMaximized;
    qryDependente.Close;
    qryDependente.Open;
  end;
end;

procedure TfrmCadDepTitPlanAss.FormShow(Sender: TObject);
begin
  if bAbriuOutroForm then
    Abort;
  inherited;
end;

procedure TfrmCadDepTitPlanAss.InfPartAss;
begin
  qryPessoa.close;
  qryDependente.close;
  qryPlanAss.close;
  qryBenef.close;

  try
     qrypessoa.parambyname('IDPESSOA').Value := iIdTitular;
     qrypessoa.parambyname('IDPLANOPREV').Value := iIdPlanoPrev;
     qrypessoa.parambyname('IDPESSJUR').Value := iIdPessJur;
     qrypessoa.ParamByName('IDPLANASS').Value := iIdPlanAss;
     qrypessoa.open;

     qryPlanAss.parambyname('IDPLANOPREV').Value := iIdPlanoPrev;
     qryPlanAss.parambyname('IDPESSJUR').Value := iIdPessJur;
     qryPlanAss.parambyname('IDPESSOA').Value := iIdTitular;
     qryPlanAss.open;

     qryPlanAss.Locate('IDPLANASS',iIdPlanAss,[loCaseInsensitive,loPartialKey]);

     lblPart.caption := qryPessoa.fieldbyname('NOME').AsString;
     lblPatro.caption := qryPessoa.fieldbyname('PATRO').AsString;
     lblPlano.caption := qryPessoa.fieldbyname('PLANO').AsString;
     lblDtInclusao.Caption := qryPessoa.fieldbyname('DATAENTRADA').AsString;
     lblBenef.Caption := qryPessoa.fieldbyname('BENEF').AsString;
     lblMatricula.Caption := sMatricula;
     lblInscricao.Caption := sInscricao;
     lblSitPlanAss.Caption := qryPessoa.fieldbyname('SITPLANASS').asString;
     lblSitPrev.Caption := qryPessoa.fieldbyname('SITPLANOPREV').asString;
  except
    lblpart.caption := '';
    lblpatro.caption := '';
    lblplano.caption := '';
    lblSitPlanAss.caption := '';
    lblSitPrev.Caption := '';
  end;
end;

function TfrmCadDepTitPlanAss.AtualizaContribuicoes(piIdTitular, piIdDependente,
         piIdPlanAss, piIdPlanoPrev, piIdPessJur, piSeqProposta, piFlgAtivo: integer): boolean;
begin
  result := true;
  qryUpdContAss.Close;
  try
    qryUpdContAss.ParamByName('IDTITULAR').Value := piIdTitular;
    qryUpdContAss.ParamByName('IDDEPENDENTE').Value := piIdDependente;
    qryUpdContAss.ParamByName('IDPLANASS').Value := piIdPlanAss;
    qryUpdContAss.ParamByName('IDPLANOPREV').Value := piIdPlanoPrev;
    qryUpdContAss.ParamByName('IDPESSJUR').Value := piIdPessJur;
    qryUpdContAss.ParamByName('SEQPROPOSTA').Value := piSeqProposta;
    qryUpdContAss.ParamByName('FLGATIVO').Value := piFlgAtivo;
    qryUpdContAss.ExecSQL;
  except
    result := false;
  end;
end;

function TfrmCadDepTitPlanAss.VerificaReInscricao(piIdTitular, piIdDependente, piIdPlanAss,
         piIdPlanoPrev, piIdPessJur, piSeqProposta: integer;
         var pdtEntrada, pdtCancelamento: TDateTime): boolean;
begin
  qryBenefAss.Close;
  qryBenefAss.ParamByName('IDTITULAR').Value := piIdTitular;
  qryBenefAss.ParamByName('IDPESSJUR').Value := piIdPessJur;
  qryBenefAss.ParamByName('IDPLANOPREV').Value := piIdPlanoPrev;
  qryBenefAss.ParamByName('IDPLANASS').Value := piIdPlanAss;
  qryBenefAss.ParamByName('IDDEPENDENTE').Value := piIdDependente;
  qryBenefAss.ParamByName('SEQPROPOSTA').Value := piSeqProposta;
  qryBenefAss.Open;

  if not qryBenefAss.IsEmpty then
  begin
    pdtEntrada := qryBenefAss.FieldByName('DATAENTRADA').AsDateTime;
    pdtCancelamento := qryBenefAss.FieldByName('DTCANCELAMENTO').AsDateTime;
    result := true;
  end
  else
  begin
    pdtEntrada := 0;
    pdtCancelamento := 0;
    result := false;
  end;
end;

function TfrmCadDepTitPlanAss.AtualizaBeneficiario(piIdTitular, piIdDependente,
         piIdPlanAss, piIdPlanoPrev,piIdPessJur, piSeqProposta, piFlgAtivo: integer;
         psObsCancel: string; pdtEntrada, pdtCancelamento: TDateTime): boolean;
begin
  result := true;
  qryUpdBenefAss.Close;
  try
    qryUpdBenefAss.ParamByName('IDTITULAR').Value := piIdTitular;
    qryUpdBenefAss.ParamByName('IDDEPENDENTE').Value := piIdDependente;
    qryUpdBenefAss.ParamByName('IDPLANASS').Value := piIdPlanAss;
    qryUpdBenefAss.ParamByName('IDPLANOPREV').Value := piIdPlanoPrev;
    qryUpdBenefAss.ParamByName('IDPESSJUR').Value := piIdPessJur;
    qryUpdBenefAss.ParamByName('SEQPROPOSTA').Value := piSeqProposta;
    qryUpdBenefAss.ParamByName('FLGATIVO').Value := piFlgAtivo;

    if pdtCancelamento <> 0 then
      qryUpdBenefAss.ParamByName('DTCANCELAMENTO').Value := pdtCancelamento
    else
      qryUpdBenefAss.ParamByName('DTCANCELAMENTO').Clear;

    if pdtEntrada <> 0 then
      qryUpdBenefAss.ParamByName('DATAENTRADA').Value := pdtEntrada
    else
      qryUpdBenefAss.ParamByName('DATAENTRADA').Clear;

    if Trim(psObsCancel) <> '' then
      qryUpdBenefAss.ParamByName('OBSCANCEL').Value := psObsCancel
    else
      qryUpdBenefAss.ParamByName('OBSCANCEL').Clear;

    qryUpdBenefAss.ExecSQL;
  except
    result := false;
  end;
end;

procedure TfrmCadDepTitPlanAss.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmCadGeralPart.WindowState:=wsMaximized;
end;

end.
