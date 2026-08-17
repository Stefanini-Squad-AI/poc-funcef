unit FCadPartAssist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDet, StdCtrls, DBCtrls, cmseldlg, wwidlg, Db, Wwdatsrc, TB97,
  MAHlpBtn, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, ExtCtrls, Mask,
  wwdbedit, Wwdbspin, wwdblook, DBTables, Wwtable, Menus, URegra, Wwquery,
  Spin, MontaSelect, TB97Ctls, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, CmEventosCadastro, wwDialog, ImgList, wwdbdatetimepicker;

type
  TfrmCadPartAssist = class(TfrmCadMestreDetalhe)
    tbshtcont: TTabSheet;
    Label45: TLabel;
    Label49: TLabel;
    sbtnAssocia: TSpeedButton;
    sbtnAssociaTodos: TSpeedButton;
    sbtnDesassocia: TSpeedButton;
    sbtnDesassociaTodos: TSpeedButton;
    Label50: TLabel;
    spbVerde: TSpeedButton;
    spbVermelho: TSpeedButton;
    DBLookupListrel: TDBLookupListBox;
    dblkplistPlanoAss: TDBLookupListBox;
    Edit1: TEdit;
    Label52: TLabel;
    wwDBLookupCombo3: TwwDBLookupCombo;
    qryAux: TwwQuery;
    qryRegraBenef: TwwQuery;
    RegraBenef: TRegra;
    qryPrinc: TwwQuery;
    cmSelectDlg1: TcmSelectDlg;
    wwSearchDialog1: TwwSearchDialog;
    qryProcura: TwwQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblPrev: TLabel;
    lblPlanAss: TLabel;
    dsDepenTit: TwwDataSource;
    qryDepenTit: TwwQuery;
    dsServCmb: TwwDataSource;
    qryServCmb: TwwQuery;
    dsContribass: TwwDataSource;
    qryContribAss: TwwQuery;
    qryBenefAss: TwwQuery;
    updBenefAss: TUpdateSQL;
    edit2: TEdit;
    dbcbativo: TCheckBox;
    qryAux2: TwwQuery;
    qrySit: TwwQuery;
    MontaSel: TMontaSelect;
    lbldata: TLabel;
    lblBenef: TLabel;
    Label7: TLabel;
    TabSheet1: TTabSheet;
    dbGrdDet2: TwwDBGrid;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    sbtnAltDet2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    pnlControlesDet2: TPanel;
    Panel3: TPanel;
    bbtnOkDet2: TBitBtn;
    bbtnCancelarDet2: TBitBtn;
    dsDet2: TwwDataSource;
    qryContAss: TwwQuery;
    Label14: TLabel;
    qryDepenTit2: TwwQuery;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    DBText1: TDBText;
    Label8: TLabel;
    DBText2: TDBText;
    Label9: TLabel;
    DBText3: TDBText;
    wwDBLookupCombo1: TwwDBLookupCombo;
    rgFlgCobCarne: TRadioGroup;
    cmbFormaPag: TwwDBLookupCombo;
    qryPortForm: TwwQuery;
    lblNome: TLabel;
    Label10: TLabel;
    lblSitPlanAss: TLabel;
    Label5: TLabel;
    lblMatricula: TLabel;
    lblPatro: TLabel;
    Label11: TLabel;
    lblInscPrev: TLabel;
    Label12: TLabel;
    lblInscAss: TLabel;
    Label13: TLabel;
    lblSitPrev: TLabel;
    dbDataEntrada: TwwDBDateTimePicker;
    procedure InsereContAss;
    procedure PreparaListaPagador;
    procedure InsereContr(IdBenef: Integer; idContAss, idPagador: String);

    procedure spbVerdeClick(Sender: TObject);
    procedure spbVermelhoClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnApagDetClick(Sender: TObject);
    //procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure pgctrlDetalheEnter(Sender: TObject);
    procedure sbtnAssociaClick(Sender: TObject);
    procedure sbtnAssociaTodosClick(Sender: TObject);
    //procedure sbtnDesassociaClick(Sender: TObject);
    //procedure sbtnDesassociaTodosClick(Sender: TObject);
    //procedure dblkplistPlanoAssDragDrop(Sender, Source: TObject; X, Y: integer);
    //procedure dblkplistPlanoAssDragOver(Sender, Source: TObject; X, Y: integer;
    //          State: TDragState; var Accept: Boolean);
    procedure qryBenefAssAfterOpen(DataSet: TDataSet);
    procedure pgctrlDetalheChange(Sender: TObject);
    procedure qryContribAssBeforeOpen(DataSet: TDataSet);
    procedure qryServCmbBeforeOpen(DataSet: TDataSet);
    procedure qryDepenTitBeforeOpen(DataSet: TDataSet);
    procedure qryServCmbAfterScroll(DataSet: TDataSet);
    procedure qryPrincAfterOpen(DataSet: TDataSet);
    procedure qryBenefAssAfterScroll(DataSet: TDataSet);
    procedure qryBenefAssBeforeOpen(DataSet: TDataSet);
    //procedure InsereContAssBenef;
    procedure FormShow(Sender: TObject);
    procedure qryContAssBeforeOpen(DataSet: TDataSet);
    procedure sbtnAltDet2Click(Sender: TObject);
    procedure bbtnCancelarDet2Click(Sender: TObject);
    procedure bbtnOkDet2Click(Sender: TObject);
    procedure rgFlgCobCarneClick(Sender: TObject);
  private
    { Private declarations }
  public
    idPlanAss: integer;
    { Public declarations }
  end;

var
  frmCadPartAssist: TfrmCadPartAssist;
  insere, altera: boolean;
  idBenef, iIdParticipante, iIdPatrocin, iIdPlanAss, iIdPlanoPrev: integer;
  idPagador, idPagadorNovo: integer;

implementation

uses
  UAutorizacao, FTelaAut, UMensErro, DBaseDados, UAdmAss, UDataBase;

{$R *.DFM}

procedure TfrmCadPartAssist.spbVerdeClick(Sender: TObject);
begin
  inherited;
  if (qryContribAss.isEmpty) and (qryServCmb.isEmpty) then
    exit;

  //if qryprinc.State <> dsedit then exit;

  if spbVerde.enabled then
  begin
    qryAux.close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add
      ('UPDATE CONTASS'+
         ' SET FLGATIVO = 0 '+
       ' WHERE (IDTITULAR = '+inttostr(iIdParticipante)+') AND'+
             ' (IDPLANOPREV = '+inttostr(iIdPlanoPrev)+') AND'+
             ' (IDPLANASS = '+inttostr(iIdPlanAss)+') AND'+
             ' (IDPESSJUR = '+inttostr(iIdPatrocin)+') AND'+
             ' (IDCONTASS = '+qryServCmb.fieldbyname('IDCONTASS').AsString+')');
    try
      qryAux.execsql;
      qryServCmb.close;
      qryServCmb.open
    except
    end;
  end;
end;

procedure TfrmCadPartAssist.spbVermelhoClick(Sender: TObject);
var sIdPagador: string;
    iFlgCobCarne: integer;
begin
  inherited;
  if (qryContribAss.isEmpty) and (qryServCmb.isEmpty) then
    exit;

  if spbVermelho.enabled then
  begin
      qryAux.close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add
        ('UPDATE CONTASS '+
           ' SET FLGATIVO = 1'+
         ' WHERE (IDTITULAR = '+inttostr(iIdParticipante)+') AND'+
               ' (IDPLANOPREV = '+inttostr(iIdPlanoPrev)+') AND'+
               ' (IDPLANASS = '+inttostr(iIdPlanAss)+') AND'+
               ' (IDPESSJUR = '+inttostr(iIdPatrocin)+') AND'+
               ' (IDCONTASS = '+qryservcmb.fieldbyname('IDCONTASS').AsString+')');
      try
        qryAux.execsql;
        qryServCmb.close;
        qryServCmb.open;
        //spbverde.Enabled := true;
        //spbvermelho.down := false;
      except
      end;

      //verifica se há a necessidade de incluir novas contribuições!!
      qryAux.close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add
        ('SELECT B.*'+
          ' FROM BENEFASS B'+
         ' WHERE (B.FLGATIVO = 1) AND'+
               ' (B.IDTITULAR = '+inttostr(iIdParticipante)+') AND '+
               ' (B.IDPLANOPREV = '+inttostr(iIdPlanoPrev)+') AND '+
               ' (B.IDPLANASS = '+inttostr(iIdPlanAss)+') AND '+
               ' (B.IDPESSJUR = '+inttostr(iIdPatrocin)+') AND '+
               ' (NOT EXISTS (SELECT C.IDTITULAR '+
                              ' FROM CONTASS C '+
                             ' WHERE (C.IDTITULAR = B.IDTITULAR) AND '+
                                   ' (C.IDDEPENDENTE = B.IDDEPENDENTE) AND '+
                                   ' (C.IDPLANOPREV = B.IDPLANOPREV) AND '+
                                   ' (C.IDPLANASS = B.IDPLANASS) AND '+
                                   ' (C.IDPESSJUR = B.IDPESSJUR) AND'+
                                   ' (C.IDCONTASS ='+qryServCmb.fieldbyname('IDCONTASS').AsString+')))');
      try
         qryAux.open;
      except
         exit
      end;

      if not qryaux.isempty then
      begin
         // Define pagador
         if qryContribAss.FieldByName('PAGADOR').AsString = 'C' then
           sIdPagador := inttostr(iIdParticipante)
         else
           sIdPagador := inttostr(iIdPatrocin);

         //define forma de cobrança
         if VoltaFlgInterno(inttostr(iIdPatrocin), inttostr(iIdPlanoPrev),
                            inttostr(iIdParticipante)) = 'MA' then
            iFlgCobCarne := 1
         else
            iFlgCobCarne := qryServCmb.fieldbyname('FLGCOBCARNE').asInteger;

         while not qryaux.eof do
         begin
           qryAux2.Close;
           qryAux2.SQL.Clear;
           qryAux2.SQL.Add
             ('INSERT INTO CONTASS(IDPLANASS,IDTITULAR,IDDEPENDENTE,'+
                    ' IDPLANOPREV,IDPESSJUR,IDCONTASS,SEQPROPOSTA,FLGATIVO,'+
                    ' RECPAG,CODPORTFORMA,FLGCOBCARNE,IDPAGADOR)'+
             ' VALUES ('+qryContribAss.FieldByName('IDPLANASS').AsString+','+
                      inttostr(iIdParticipante)+','+
                      qryaux.fieldbyname('IDDEPENDENTE').AsString+','+
                      inttostr(iIdPlanoPrev)+','+
                      inttostr(iIdPatrocin)+','+
                      qryservcmb.fieldbyname('IDCONTASS').AsString+',1,1,''R'','+
                      ':CODPORTFORMA, :FLGCOBCARNE,'+sIdPagador+')');
           qryaux2.parambyname('FLGCOBCARNE').AsInteger := iFlgCobCarne;
           qryaux2.parambyname('CODPORTFORMA').AsString := qryServCmb.fieldbyname('CODPORTFORMA').AsString;
           try
               qryaux2.execsql;
           except
           end;

           qryaux.next;

         end;//while
         qryservcmb.close;
         qryservcmb.open;
      end;//if
  end;//if
end;

procedure TfrmCadPartAssist.sbtnProcurarClick(Sender: TObject);
begin
  //  inherited;
  try
     bbtnCancelarClick(self);
  except
  end;
  sbtnProcurar.Down := false;
  try
     MontaSel.Executar;
     if MontaSel.RetornouValor then
     begin
       iIdParticipante := strtoint(Montasel.ValoresChave[0]);
       iIdPlanoPrev := strtoint(Montasel.ValoresChave[2]);
       iIdPlanAss := strtoint(Montasel.ValoresChave[1]);
       iIdPatrocin := strtoint(Montasel.ValoresChave[3]);

       qryBenefAss.close;
       qryServCmb.close;
       qryContribAss.close;
       qryContAss.close;
       qryDepenTit.close;
       qryPrinc.close;

       qryPrinc.parambyname('IDPESSOA').ASINTEGER :=  iIdParticipante;
       qryPrinc.parambyname('IDPLANOPREV').ASINTEGER := iIdPlanoPrev;
       qryPrinc.parambyname('IDPESSJUR').ASINTEGER := iIdPatrocin;
       qryPrinc.parambyname('IDPLANASS').ASINTEGER := iIdPlanAss;
       qryPrinc.open;

       qryBenefAss.open;
       qryServCmb.open;
       qryContribAss.open;
       qryContAss.open;
       qryDepenTit.open;

       pgctrlDetalhe.enabled := true;
       bbtnConfirmar.enabled := false;
       bbtnCancelar.enabled := false;

       lblNome.caption := qryPrinc.fieldbyname('NOME').AsString;
       lblPrev.caption := qryPrinc.fieldbyname('PREV').AsString;
       lblPlanAss.caption := qryPrinc.fieldbyname('PLANASS').AsString;
       if qryPrinc.fieldbyname('FLGPARTBENEF').AsInteger = 1 then
         lblBenef.caption := 'Sim'
       else
         lblBenef.caption := 'Não';
       lblPatro.caption := qryPrinc.fieldbyname('PATRO').AsString;
       lblSitPlanAss.caption := qryPrinc.fieldbyname('SITPLANASS').asString;
       lblMatricula.caption := qryPrinc.fieldbyname('MATRICULA').asString;
       lblInscPrev.caption := qryPrinc.fieldbyname('INSCRICAOPREV').asString;
       lblInscAss.caption := qryPrinc.fieldbyname('INSCRICAOASS').asString;
       lblSitPrev.caption := qryPrinc.fieldbyname('SITPREV').asString;
     end;
  except
     qryBenefAss.close;
     qryServCmb.close;
     qryContribAss.close;
     qryContAss.close;
     qryDepenTit.close;
     qryPrinc.close;

     pgctrlDetalhe.enabled := false;

     lblNome.caption := '';
     lblPrev.caption :=  '';
     lblPlanAss.caption :=  '';
     lblPatro.caption :=  '';
     lblMatricula.caption :=  '';
     lblInscPrev.caption := '';
     lblInscAss.caption := '';
     lblSitPrev.caption := '';

     bbtnConfirmar.enabled := false;
     bbtnCancelar.enabled := false;

     sbtnApagDet.enabled := false;
     sbtnAltDet.enabled := false;
     sbtnInsDet.enabled := false;
     sbtnAltDet2.enabled := false;
  end;
end;

procedure TfrmCadPartAssist.bbtnCancelarClick(Sender: TObject);
begin
   inherited;

   qryBenefAss.cancel;
   qryContAss.cancel;
   qryservcmb.cancel;

   RollBackTransacao;

   qrybenefass.close;
   qryservcmb.close;
   qryContribAss.close;
   qryContAss.close;
   qrydepentit.close;
   qryprinc.close;

   pgctrlDetalhe.enabled := false;

   lblNome.caption := '';
   lblPrev.caption :=  '';
   lblPlanAss.caption :=  '';
   lblPatro.caption :=  '';
   lblMatricula.caption :=  '';
   lblInscPrev.caption := '';
   lblInscAss.caption := '';
   lblSitPrev.caption := '';

   bbtnConfirmar.enabled := false;
   bbtnCancelar.enabled := false;

   sbtnApagDet.enabled := false;
   sbtnAltDet.enabled := false;
   sbtnInsDet.enabled := false;
end;

procedure TfrmCadPartAssist.sbtnApagarClick(Sender: TObject);
begin
   qryAux.close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add
     ('SELECT IDPESSOA'+
       ' FROM PARTASS'+
      ' WHERE (IDPESSOA = '+qryPrinc.fieldbyname('IDPESSOA').AsString+')'+
        ' AND (IDPESSOA IN(SELECT IDTITULAR'+
                           ' FROM BENEFASS'+
                          ' WHERE (IDPLANASS='+qryPrinc.fieldbyname('IDPESSOA').AsString+')))');
   try
        qryAux.open;
   except end;{try}
   if not qryAux.isempty then
   begin
        showmessage('O participante não pode ser apagado, por ter beneficiários  e/ou  eventos e/ou  contribuições ligadas a ele!');
        exit;
   end;
   showmessage('Tratamento para deleção de um participante ainda não implementada !');
   sbtnApagar.down := false;
   inherited;
end;

procedure TfrmCadPartAssist.bbtnConfirmarClick(Sender: TObject);
begin
  //  inherited;
  //ApplyUpdates([qrybenefass]);
  //dtmBaseDados.dbBaseDados.ApplyUpdates([qrybenefass]);

  qryContAss.CommitUpdates;
  qryBenefAss.CommitUpdates;
  qryservcmb.CommitUpdates;
  bbtnConfirmar.enabled := false;
  bbtnCancelar.enabled := false;
end;

procedure TfrmCadPartAssist.bbtnSairClick(Sender: TObject);
begin
  //inherited;
  close;
end;

procedure TfrmCadPartAssist.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //  inherited;
  qryPrinc.close;
  qryBenefAss.close;
  qryServCmb.close;
  qryContribAss.close;
  qryContAss.close;
  qryPrinc.unprepare;
  qryBenefAss.unprepare;
  qryServCmb.unprepare;
  qryContribAss.unprepare;
  qryContAss.unprepare;

  action := cafree;
end;

procedure TfrmCadPartAssist.FormCreate(Sender: TObject);
begin
  tbshDetalhe.TabVisible := false;
  //  inherited;
  qryPrinc.prepare;
  qryBenefAss.prepare;
  qryServCmb.prepare;
  qryContribAss.prepare;
  qryContAss.prepare;
  qryPortForm.open;
  dbGrdDet2.BringToFront;
end;

procedure TfrmCadPartAssist.sbtnInsDetClick(Sender: TObject);
begin
   try
     //qrybenefass.Insert;
     edit2.visible := false;
     wwDBLookupCombo3.visible := true;
     dbGrdDet.SendToBack;
     HabilitaPainel(pnlControlesDet, true);
     dbcbativo.checked := true;
     //qrybenefass.fieldbyname('FLGATIVO').AsInteger := 1;
     insere := true;
     altera := false;
     qrydepentit.close;
     qrydepentit.open;

     sbtnAltDet.Enabled := false;
     sbtnApagDet.enabled := false;
     dbdataentrada.Enabled := true;
     dbdataentrada.enabled := true;
     dbdataentrada.text := '';
   except
     sbtnInsDet.Down := false;
   raise;
   end;
end;

procedure TfrmCadPartAssist.sbtnAltDetClick(Sender: TObject);
begin
   try
     // Altera registro na tabela
     edit2.visible := true;
     wwDBLookupCombo3.visible := false;
     dbdataentrada.Enabled := false;
     edit2.text :=  qrybenefass.fieldbyname('DEPEN').AsString;

     sbtnInsDet.Enabled := false;
     sbtnApagDet.enabled := false;

     if qrybenefass.fieldbyname('flgativo').AsInteger = 1 then
       dbcbativo.Checked := true
     else
       dbcbativo.Checked := false;
     //dsDet.DataSet.Edit;
     dbGrdDet.SendToBack; //Visible := False;
     HabilitaPainel(pnlControlesDet, true);
     altera := true;
     insere := false;
     dbdataentrada.text := qrybenefass.fieldbyname('DATAENTRADA').AsString;
     dbdataentrada.enabled := false;
   except
     sbtnAltDet.Down := false;
     raise;
   end;
   if qrybenefass.State <> dsBrowse then
   begin
     sbtnAltDet.Down := true;
     exit;
   end;
end;

procedure TfrmCadPartAssist.sbtnApagDetClick(Sender: TObject);
begin
   ////FAZER VALIDAÇÃO DA DELEÇÃO ////
   qryaux.Close;
   qryaux.sql.clear;
   qryaux.sql.add('SELECT IDTITULAR '+
                   ' FROM EVENTASS '+
                  ' WHERE (IDTITULAR ='+qrybenefass.fieldbyname('IDTITULAR').AsString+')');
   qryaux.open;
   if qryaux.isempty then
   begin
      qryaux.Close;
      qryaux.sql.clear;
      qryaux.sql.add(' SELECT IDTITULAR '+
                       ' FROM CONTASS '+
                      ' WHERE (IDTITULAR ='+qrybenefass.fieldbyname('IDTITULAR').AsString+')');
      qryaux.open;

      if not qryaux.isempty then
      begin
        showmessage('O beneficiário não pode ser apagado por ser contribuinte !');
        sbtnApagDet.down := false;
        exit;
      end;
   end
   else
   begin
     showmessage('O beneficiário não pode ser apagado por ter feito uso de algum serviço do plano !');
     sbtnApagDet.down := false;
     exit;
   end;
   // Tenta apagar o registro
   try
      // Pergunta se deseja realmente apagar
      if MsgDlg(LerMensagem(11), LerMensagem(4), mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes then
      begin
         //qrybenefass.Delete;
         //qryendereco.delete;
         qryaux.Close;
         qryaux.sql.clear;
         qryaux.sql.add
           ('DELETE BENEFASS '+
            ' WHERE (IDTITULAR ='+inttostr(iIdParticipante)+')'+
              ' AND (IDDEPENDENTE = '+qryBenefAss.fieldbyname('IDDEPENDENTE').AsString+')'+
              ' AND (IDPESSJUR = '+inttostr(iIdPatrocin)+')'+
              ' AND (IDPLANOPREV = '+inttostr(iIdPlanoPrev)+')'+
              ' AND (IDPLANASS = '+inttostr(iIdPlanAss)+')');
         try
           qryaux.execsql;
         except
           sbtnApagDet.down := false;
           //exit;
         end;
         sbtnApagDet.down := false;

         qrybenefass.Close;
         qrybenefass.open;
         // bbtnCancelarClick(self);
      end;
   except
   end;
end;

{procedure TfrmCadPartAssist.bbtnOkDetClick(Sender: TObject);
begin

  if dbdataentrada.text = '' then
  begin
    Showmessage('É preciso selecionar a data de entrada do beneficiário.');
    exit;
  end;

  if insere then
  begin
     if wwDBLookupCombo3.text = '' then
     begin
        showmessage('É preciso selecionar um dependente !');
        exit;
     end;
     /////////////////////////////////REGRA////////////////////////////////
     qryregrabenef.close;
     if not (qryprinc.fieldbyname('IDREGRABENEFICIA').AsString = '') then
     begin
        regrabenef.rulename := qryprinc.fieldbyname('IDREGRABENEFICIA').AsString;
        //PARAM
        qryregrabenef.ParamByName('IDDEPENDENTE').AsInteger := qrydepentit.fieldbyname('idpessoa').AsInteger;
        qryregrabenef.ParamByName('IDTITULAR').AsInteger := iidparticipante;
        qryregrabenef.ParamByName('IDPLANASS').AsInteger :=  iidplanass;
        qryregrabenef.ParamByName('IDPESSJUR').AsInteger :=  iidpatrocin;
        qryregrabenef.ParamByName('IDPLANOPREV').AsInteger := iidplanoprev;
        //
        qryregrabenef.open;

        regrabenef.execute;
        if (regrabenef.result = 'False') or (regraBenef.result = '') then
        begin
           showmessage('A pessoa em questão não pode ser cadastrada como beneficiário, em vista da Regra de Beneficiário do plano !');
           qryregrabenef.close;
           exit;
        end;
        qryregrabenef.close;
     end;
  end;
  ////////////////////////////////////////////CUIDADO//////////////////////////////
  if insere then
  begin
      qryaux.Close;
      qryaux.sql.clear;
      qryaux.sql.add
        ('INSERT INTO BENEFASS(IDTITULAR,IDDEPENDENTE,IDPESSJUR,IDPLANOPREV,IDPLANASS,'+
               ' FLGATIVO,DATAENTRADA)'+
        ' VALUES ('+inttostr(iidparticipante)+','+
                 qrydepentit.fieldbyname('idpessoa').AsString+','+
                 inttostr(iidpatrocin)+','+
                 inttostr(iidplanoprev)+','+
                 inttostr(iidplanass)+','+
                 ':ATIVO,'+
                 'TO_DATE('''+dbdataentrada.text+''',''DD/MM/YYYY''))');
      try
         if dbcbativo.checked then
            qryaux.parambyname('ATIVO').AsInteger := 1
         else
            qryaux.parambyname('ATIVO').AsInteger := 0;

         qryaux.execsql;

         idbenef := qrydepentit.fieldbyname('idpessoa').AsInteger;

         InsereContAssBenef;
       //==================

      except
      end;

      dbcbativo.checked := true;
  end;

  if altera then
  begin
    qryaux.Close;
    qryaux.sql.clear;
    qryaux.sql.add
      ('UPDATE BENEFASS '+
         ' SET FLGATIVO = :ATIVO '+
       ' WHERE (IDTITULAR ='+inttostr(iidparticipante)+')'+
         ' AND (IDDEPENDENTE = '+qrybenefass.fieldbyname('iddependente').AsString+')'+
         ' AND (IDPESSJUR = '+inttostr(iidpatrocin)+')'+
         ' AND (IDPLANOPREV = '+inttostr(iidplanoprev)+')'+
         ' AND (IDPLANASS = '+inttostr(iidplanass)+')');
    try
       idbenef := qrybenefass.fieldbyname('iddependente').AsInteger;

       InsereContAssBenef;
     //==================

       if dbcbativo.checked then
          qryaux.parambyname('ATIVO').AsInteger := 1
       else
          qryaux.parambyname('ATIVO').AsInteger := 0;
       qryaux.execsql;
    except
    end;
  end;

  qrydepentit.close;
  qrydepentit.open;

  qrybenefass.close;
  qrybenefass.open;

  dbgrdDet.BringToFront;
  HabilitaPainel(pnlControlesDet, false);

  bbtnConfirmar.enabled := true;
  bbtnCancelar.enabled := true;

  sbtnInsDet.down := false;
  sbtnAltDet.down := false;
  sbtnApagDet.down := false;
  sbtnInsDet.Enabled := true;
  sbtnApagDet.enabled := true;

  qrybenefass.CommitUpdates;
end;}

{procedure TfrmCadPartAssist.InsereContAssBenef;
var sIdPagador : string;
begin
   if qryservcmb.isempty then
     exit;

   // Define pagador
   if qryContribAss.FieldByName('PAGADOR').AsString = 'C' then
     sIdPagador := inttostr(iidparticipante)
   else
     sIdPagador := inttostr(iidpatrocin);
   while not qryservcmb.eof do
   begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add
        ('INSERT INTO CONTASS(IDPLANASS,IDTITULAR,IDDEPENDENTE,IDPLANOPREV,'+
               ' IDPESSJUR,IDCONTASS,FLGATIVO,RECPAG,CODPORTFORMA,FLGCOBCARNE,IDPAGADOR)'+
        ' VALUES ('+qryprinc.FieldByName('IdPlanass').AsString+','+
                 inttostr(iidparticipante)+','+
                 inttostr(idbenef)+','+
                 inttostr(iidplanoprev)+','+
                 inttostr(iidpatrocin)+','+
                 qryservcmb.fieldbyname('idcontass').AsString+',1,''R'','+
                 ':CODPORTFORMA, :FLGCOBCARNE,'+sIdPagador+')');
      try
         if VoltaFlgInterno(inttostr(iidpatrocin),inttostr(iidplanoprev),
                            inttostr(iidparticipante)) = 'MA' then
            qryaux.parambyname('FLGCOBCARNE').asInteger := 1
         else
            qryaux.parambyname('FLGCOBCARNE').asInteger := qryservcmb.fieldbyname('FLGCOBCARNE').asInteger;
         qryaux.parambyname('CODPORTFORMA').asString := qryservcmb.fieldbyname('CODPORTFORMA').asString;

         qryAux.ExecSQL;
      except
      end;

      qryservcmb.next;
   end;//while
end;}

procedure TFrmCadPartassist.InsereContr(IdBenef: Integer; idContAss, idPagador: String);
begin
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add
     ('INSERT INTO CONTASS(IDPLANASS,IDTITULAR,IDDEPENDENTE,IDPLANOPREV,IDPESSJUR,'+
            ' IDCONTASS,SEQPROPOSTA,FLGATIVO,RECPAG,CODPORTFORMA,FLGFOLHA,IDPAGADOR)'+
     ' VALUES ('+qryprinc.FieldByName('IDPLANASS').AsString+','+
              inttostr(iIdParticipante)+','+
              inttostr(idBenef)+','+
              inttostr(iIdPlanoPrev)+','+
              inttostr(iIdPatrocin)+','+
              idContAss+',1,1,''R'',:PORTADOR,:FOLHA,'+idPagador+')');
   try
      if (VoltaFlgInterno(inttostr(iIdPatrocin), inttostr(iIdPlanoPrev),
                          inttostr(idBenef)) = 'MA') or
         (VoltaFlgInterno(inttostr(iIdPatrocin), inttostr(iIdPlanoPrev),
                          inttostr(idBenef)) = '') then
      begin
         qryaux.parambyname('FOLHA').AsInteger := 0;
         qryaux.parambyname('PORTADOR').AsString := qryContribAss.fieldbyname('CODPORTFORMA').AsString;
      end
      else
      begin
         qryaux.parambyname('FOLHA').AsInteger := 1;
         qryaux.parambyname('PORTADOR').AsString := qryContribAss.fieldbyname('CODPORTFORMA').AsString;
      end;

      qryAux.ExecSQL;
   except
   end;
end;

procedure TfrmCadPartAssist.bbtnCancelarDetClick(Sender: TObject);
begin
  try
    if altera then
    begin
       edit2.visible := false;
       wwDBLookupCombo3.visible := true;
    end;
    insere := false;
    altera := false;

    qryBENEFASS.close;
    qrybenefass.open;

    dbgrdDet.BringToFront;
    HabilitaPainel(pnlControlesDet, false);

    bbtnConfirmar.enabled := true;
    bbtnCancelar.enabled := true;

    sbtnInsDet.down := false;
    sbtnAltDet.down := false;
    sbtnApagDet.down := false;
    sbtnAltDet.Enabled := true;
    sbtnApagDet.enabled := true;
    sbtnInsDet.enabled := true;
  except
  end;
end;

procedure TfrmCadPartAssist.InsereContAss;
var sIdPagador: string;
    iFlgCobCarne: integer;
begin
   // Define pagador
   if qryContribAss.FieldByName('PAGADOR').AsString = 'C' then
     sIdPagador := inttostr(iIdParticipante)
   else
     sIdPagador := inttostr(iIdPatrocin);

   //define forma de cobrança
   if VoltaFlgInterno(inttostr(iIdPatrocin), inttostr(iIdPlanoPrev),
                      inttostr(iIdParticipante)) = 'MA' then
      iFlgCobCarne := 1
   else
      iFlgCobCarne := qryContribAss.fieldbyname('FLGCOBCARNE').asInteger;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add
     ('INSERT INTO CONTASS(IDPLANASS,IDTITULAR,IDDEPENDENTE,IDPLANOPREV,IDPESSJUR,'+
            ' IDCONTASS,SEQPROPOSTA,FLGATIVO,RECPAG,CODPORTFORMA,FLGCOBCARNE,IDPAGADOR)'+
     ' VALUES ('+qryContribAss.FieldByName('IDPLANASS').AsString+','+
              inttostr(iIdParticipante)+','+
              inttostr(iIdParticipante)+','+
              inttostr(iIdPlanoPrev)+','+
              inttostr(iIdPatrocin)+','+
              qryContribAss.fieldbyname('IDCONTASS').asString+
              ',1,1,''R'',:CODPORTFORMA,:FLGCOBCARNE,'+sIdPagador+')');
   qryaux.parambyname('FLGCOBCARNE').asInteger := iFlgCobCarne;
   qryaux.parambyname('CODPORTFORMA').asString := qryContribAss.fieldbyname('CODPORTFORMA').asString;
   try
      qryAux.ExecSQL;
   except
   end;

   qryAux2.Close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.Add
     ('SELECT IDDEPENDENTE '+
       ' FROM BENEFASS '+
      ' WHERE (IDPLANASS = '+qryContribAss.FieldByName('IDPLANASS').AsString+')'+
        ' AND (IDTITULAR = '+inttostr(iIdParticipante)+')'+
        ' AND (IDPLANOPREV = '+inttostr(iIdPlanoPrev)+')'+
        ' AND (IDPESSJUR = '+inttostr(iIdPatrocin)+')');
   try
      qryAux2.Open;
   except
   end;

   if not qryaux2.isempty then
   begin
      qryaux2.first;
      while not qryaux2.eof do
      begin
         IdBenef := qryaux2.fieldbyname('IDDEPENDENTE').AsInteger;

         InsereContr(IdBenef, qryContribAss.fieldbyname('idContAss').AsString, sIdPagador);
       //===========

         qryaux2.next;
      end;
   end;
end;

procedure TfrmCadPartAssist.pgctrlDetalheEnter(Sender: TObject);
begin
  inherited;
  edit1.text := qryprinc.fieldbyname('planass').AsString;
end;

procedure TfrmCadPartAssist.sbtnAssociaClick(Sender: TObject);
begin
  inherited;

  if qryContribAss.isempty then
    exit;

  InsereContAss;
//=============

  qryContribAss.Close;
  qryContribAss.Open;
  qryservcmb.Close;
  qryservcmb.Open;
end;

procedure TfrmCadPartAssist.sbtnAssociaTodosClick(Sender: TObject);
begin
  if qryContribAss.isempty then
    exit;

  qryContribAss.first;

  while not qryContribAss.eof do
  begin
    InsereContAss;
  //=============  
    qryContribAss.Next;
  end;

  qryservcmb.Close;
  qryservcmb.Open;
  qryContribAss.Close;
  qryContribAss.Open;
end;

{procedure TfrmCadPartAssist.sbtnDesassociaClick(Sender: TObject);
begin
  inherited;

  if qryservcmb.isempty then
    exit;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add
    ('SELECT IDCONTASS '+
      ' FROM HSTCONTRIBASS'+
     ' WHERE (IDTITULAR = '+inttostr(iidparticipante)+') AND'+
           ' (IDPLANOPREV = '+inttostr(iidplanoprev)+') AND'+
           ' (IDPLANASS = '+inttostr(iidplanass)+') AND'+
           ' (IDPESSJUR = '+inttostr(iidpatrocin)+') AND'+
           ' (IDCONTASS = '+qryservcmb.FieldByName('idContAss').AsString+')');
  try
     qryAux.open;
  except
     on E: EDBEngineError do
     begin
        MostrarErro(E);
        exit;
     end;
  end;
  if not qryAux.isempty then
  begin
     showmessage('A contribuição não pode ser apagada por ter históricos ligados a ela ! ');
     exit;
  end;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add
    ('DELETE CONTASS  '+
     ' WHERE (IDTITULAR='+inttostr(iidparticipante)+') AND'+
           ' (IDPLANOPREV ='+inttostr(iidplanoprev)+') AND'+
           ' (IDPLANASS ='+inttostr(iidplanass)+') AND'+
           ' (IDPESSJUR ='+inttostr(iidpatrocin)+') AND'+
           ' (IDCONTASS ='+qryservcmb.FieldByName('idContAss').AsString+')');
  try
     qryAux.ExecSQL;
  except
     on E: EDBEngineError do
     begin
        MostrarErro(E);
        exit;
     end;
  end;

  qryservcmb.Close;
  qryservcmb.Open;
  qryContribAss.Close;
  qryContribAss.Open;
end;}

{procedure TfrmCadPartAssist.sbtnDesassociaTodosClick(Sender: TObject);
begin
  inherited;

  if qryservcmb.isempty then
    exit;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add
    ('DELETE CONTASS  '+
     ' WHERE (IDTITULAR='+inttostr(iidparticipante)+') AND'+
           ' (IDPLANOPREV ='+inttostr(iidplanoprev)+') AND'+
           ' (IDPLANASS ='+inttostr(iidplanass)+') AND'+
           ' (IDPESSJUR ='+inttostr(iidpatrocin)+') AND'+
           ' (IDDEPENDENTE = '+inttostr(iidparticipante)+') AND'+
           ' (IDCONTASS NOT IN (SELECT IDCONTASS FROM HSTCONTRIBASS))');
  try
     qryAux.ExecSQL;
  except
     on E: EDBEngineError do
     begin
        MostrarErro(E);
        exit;
     end;
  end;
  qryservcmb.Close;
  qryservcmb.Open;
  qryContribAss.Close;
  qryContribAss.Open;

  if not qryservcmb.isempty then
     showmessage('Algumas Contribuições não podem ser apagadas por terem histórico(s) ligado(s) a elas!');
end;}

procedure TfrmCadPartAssist.qryBenefAssAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if qrybenefass.isempty then
  begin
     sbtnInsDet.enabled := true;
     sbtnAltDet.enabled := false;
     sbtnApagDet.enabled := false;
  end
  else
  begin
     sbtnInsDet.enabled := true;
     sbtnAltDet.enabled := true;
     sbtnApagDet.enabled := true;
  end;
end;

procedure TfrmCadPartAssist.pgctrlDetalheChange(Sender: TObject);
begin
  inherited;
  edit1.text := qryprinc.fieldbyname('planass').AsString;

  if qrybenefass.isempty then
  begin
     sbtnInsDet.enabled := true;
     sbtnAltDet.enabled := false;
     sbtnApagDet.enabled := false;
  end
  else
  begin
     sbtnInsDet.enabled := true;
     sbtnAltDet.enabled := true;
     sbtnApagDet.enabled := true;
  end;
end;

procedure TfrmCadPartAssist.qryContribAssBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryContribAss.parambyname('IDPESSOA').AsString := inttostr(iIdParticipante);
  qryContribAss.parambyname('IDPESSJUR').AsString := inttostr(iIdPatrocin);
  qryContribAss.parambyname('IDPLANASS').AsString := inttostr(iIdPlanAss);
  qryContribAss.parambyname('IDPLANOPREV').AsString := inttostr(iIdPlanoPrev);
end;

procedure TfrmCadPartAssist.qryServCmbBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryServCmb.parambyname('IDPESSOA').AsString := inttostr(iIdParticipante);
  qryServCmb.parambyname('IDPESSJUR').AsString := inttostr(iIdPatrocin);
  qryServCmb.parambyname('IDPLANASS').AsString := inttostr(iIdPlanAss);
  qryServCmb.parambyname('IDPLANOPREV').AsString := inttostr(iIdPlanoPrev);
end;

procedure TfrmCadPartAssist.qryDepenTitBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryDepenTit.parambyname('IDPESSOA').AsString := inttostr(iIdParticipante);
  qryDepenTit.parambyname('IDPESSJUR').AsString := inttostr(iIdPatrocin);
  qryDepenTit.parambyname('IDPLANASS').AsString := inttostr(iIdPlanAss);
  qryDepenTit.parambyname('IDPLANOPREV').AsString := inttostr(iIdPlanoPrev);
end;

procedure TfrmCadPartAssist.qryServCmbAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qryServCmb.IsEmpty then
  begin
    if qryServCmb.fieldbyname('FLGATIVO').AsInteger = 1 then
    begin
       spbVerde.enabled := true;
       spbVermelho.enabled := false;
    end
    else
    begin
       spbVermelho.enabled := true;
       spbVerde.enabled := false;
    end;
  end
  else
    begin
       spbVermelho.enabled := false;
       spbVerde.enabled := false;
    end;
end;

procedure TfrmCadPartAssist.qryPrincAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dbnav.visible := false;
end;

procedure TfrmCadPartAssist.qryBenefAssAfterScroll(DataSet: TDataSet);
begin
  inherited;
  dbNav.visible := false;
end;

procedure TfrmCadPartAssist.qryBenefAssBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryBenefAss.parambyname('IDPESSOA').AsString := inttostr(iIdParticipante);
  qryBenefAss.parambyname('IDPESSJUR').AsString := inttostr(iIdPatrocin);
  qryBenefAss.parambyname('IDPLANASS').AsString := inttostr(iIdPlanAss);
  qryBenefAss.parambyname('IDPLANOPREV').AsString := inttostr(iIdPlanoPrev);
end;

procedure TfrmCadPartAssist.FormShow(Sender: TObject);
begin
  inherited;
  sbtnProcurarClick(self);
end;

procedure TfrmCadPartAssist.qryContAssBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryContAss.parambyname('IDTITULAR').AsString := inttostr(iIdParticipante);
  qryContAss.parambyname('IDPESSJUR').AsString := inttostr(iIdPatrocin);
  qryContAss.parambyname('IDPLANASS').AsString := inttostr(iIdPlanAss);
  qryContAss.parambyname('IDPLANOPREV').AsString := inttostr(iIdPlanoPrev);
end;

procedure TfrmCadPartAssist.sbtnAltDet2Click(Sender: TObject);
begin
   try
     dbGrdDet2.SendToBack;
     HabilitaPainel(pnlControlesDet2, true);
   except
      sbtnAltDet2.Down := false;
      raise;
   end;

   case qryContAss.FieldByName('FLGCOBCARNE').AsInteger of
      0: begin
           if rgFlgCobCarne.itemIndex = 0 then
             PreparaListaPagador;
           rgFlgCobCarne.itemIndex := 0;
           cmbFormaPag.text := '';
         end;
      1: begin
           if rgFlgCobCarne.itemIndex = 1 then
             PreparaListaPagador;
           rgFlgCobCarne.itemIndex := 1;
           qryPortForm.locate('CODPORTFORMA', qryContAss.FieldByName('CODPORTFORMA').asInteger, []);
           cmbFormaPag.text := qryPortForm.fieldbyname('DESCRICAO').asString;
         end;
   end;

   idPagador := qryContAss.FieldByName('IDPAGADOR').asInteger;
   idPagadorNovo := idPagador;
   qryDepenTit2.locate('IDPESSOA', idPagador, []);
   wwDBLookupCombo1.text := qryDepenTit2.fieldbyname('NOME').asString;

   if qryContAss.State <> dsBrowse then
   begin
      sbtnAltDet2.Down := true;
      exit;
   end;
end;

procedure TfrmCadPartAssist.bbtnCancelarDet2Click(Sender: TObject);
begin
  try
    qryContAss.close;
    qryContAss.open;

    dbgrdDet2.BringToFront;
    HabilitaPainel(pnlControlesDet2, false);

    bbtnConfirmar.enabled := true;
    bbtnCancelar.enabled := true;

    sbtnAltDet2.down := false;
    sbtnAltDet2.Enabled := true;
  except
  end;
end;

procedure TfrmCadPartAssist.bbtnOkDet2Click(Sender: TObject);
var sIdDepend, sIdContAss, sFlgCobCarne, sCodPortForma: string;
begin
  if (cmbFormaPag.text = '') and (cmbFormaPag.enabled = true) then
  begin
     showmessage('É preciso selecionar a forma de pagamento da contribuição !');
     cmbFormaPag.setfocus;
     exit;
  end;

  if (VoltaFlgInterno(inttostr(iIdPatrocin), inttostr(iIdPlanoPrev), inttostr(iIdParticipante)) = 'MA')
     and (rgFlgCobCarne.itemindex = 0) then
  begin
     showmessage('O participante mantido não pode ser descontado em folha!');
     rgFlgCobCarne.setfocus;
     exit;
  end;

  dbgrdDet2.BringToFront;
  HabilitaPainel(pnlControlesDet2, false);

  case rgFlgCobcarne.itemindex of
     0: begin
          sFlgCobCarne := '0';
          sCodPortForma := 'NULL';
        end;
     1: begin
          sFlgCobCarne := '1';
          sCodPortForma := qryPortForm.FieldByName('CODPORTFORMA').AsString;
        end;
  end;

  sIdDepend := qryContAss.fieldbyname('IDDEPENDENTE').AsString;
  sIdContAss := qryContAss.fieldbyname('IDCONTASS').AsString;
  qryAux.Close;
  qryAux.sql.clear;
  qryAux.sql.add
    ('UPDATE CONTASS '+
       ' SET FLGCOBCARNE = '+sFlgCobCarne+','+
           ' CODPORTFORMA = '+sCodPortForma+
     ' WHERE (IDTITULAR ='+inttostr(iIdParticipante)+')'+
       ' AND (IDDEPENDENTE = '+sIdDepend+')'+
       ' AND (IDPESSJUR = '+inttostr(iIdPatrocin)+')'+
       ' AND (IDPLANOPREV = '+inttostr(iIdPlanoPrev)+')'+
       ' AND (IDCONTASS = '+sIdContAss+')'+
       ' AND (IDPLANASS = '+inttostr(iIdPlanAss)+')');
  try
     qryAux.execsql;
  except
     raise;
  end;

  idPagadorNovo := qryDepenTit2.fieldbyname('IDPESSOA').AsInteger;
  if idPagadorNovo <> idPagador then
  begin
    qryAux.Close;
    qryAux.sql.clear;
    qryAux.sql.add
      ('UPDATE CONTASS '+
         ' SET IDPAGADOR = '+inttostr(idPagadorNovo)+
       ' WHERE (IDTITULAR ='+inttostr(iIdParticipante)+')'+
         ' AND (IDDEPENDENTE = '+sIdDepend+')'+
         ' AND (IDPESSJUR = '+inttostr(iIdPatrocin)+')'+
         ' AND (IDPLANOPREV = '+inttostr(iIdPlanoPrev)+')'+
         ' AND (IDCONTASS = '+sIdContAss+')'+
         ' AND (IDPLANASS = '+inttostr(iIdPlanAss)+')');
    try
       qryAux.execsql;
    except
       raise;
    end;
  end;

  bbtnConfirmar.enabled := true;
  bbtnCancelar.enabled := true;

  sbtnAltDet2.down := false;

  qryContAss.CommitUpdates;
  qryContAss.close;
  qryContAss.open;
  qryDepenTit2.close;
end;

procedure TfrmCadPartAssist.PreparaListaPagador;
begin
  if rgFlgCobCarne.itemIndex = 0 then
  begin
    cmbFormaPag.enabled := false;
    cmbFormaPag.text := '';
    //prepara lista FOLHA
    qryDepenTit2.close;
    qryDepenTit2.SQL.text :=
      'SELECT DISTINCT P.IDPESSOA, P.NOME'+
       ' FROM PESSOA P'+
      ' WHERE (P.IDPESSOA IN ((SELECT IDPESSOA'+
                               ' FROM BENEFBFCIARIO BF'+
                              ' WHERE (BF.IDTITULAR = '+intToStr(iIdParticipante)+') AND'+
                                    ' (BF.IDSITBENEFICIO = 1))'+
                      ' UNION (SELECT PPP.IDPESSOA'+
                               ' FROM PARTPREVPLAN PPP, SITPLANOPREV SP'+
                              ' WHERE (PPP.IDPESSOA = '+intToStr(iIdParticipante)+') AND'+
                                    ' (PPP.IDSITPART = SP.IDSITPLANOPREV) AND'+
                                    ' (SP.FLGINTERNO <> ''MA''))))';
      //'SELECT P.IDPESSOA, P.NOME'+
      // ' FROM PESSOA P, BENEFBFCIARIO BF'+
      //' WHERE (BF.IDTITULAR = '+intToStr(iIdParticipante)+') AND'+
      //      ' (BF.IDPESSOA = P.IDPESSOA)';
    qryDepenTit2.open;
  end
  else
  begin
    cmbFormaPag.enabled := true;
    //prepara lista OUTROS
    qryDepenTit2.close;
    qryDepenTit2.SQL.text :=
      'SELECT P.IDPESSOA, P.NOME'+
       ' FROM PESSOA P, DEPENTIT DP'+
      ' WHERE (DP.IDTITULAR = '+intToStr(iIdParticipante)+') AND'+
            ' (DP.IDPESSOA = P.IDPESSOA)';
    qryDepenTit2.open;
  end;
end;

procedure TfrmCadPartAssist.rgFlgCobCarneClick(Sender: TObject);
begin
  inherited;
  PreparaListaPagador;
  wwDBLookupCombo1.text := '';
end;

end.

