(*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 15/10/2000
*******************************************************************************)

unit FCadRubNew;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TB97Ctls, Grids, Wwdbigrd, Wwdbgrid, DBTables,
  Db, Wwquery, Wwdatsrc, MontaSelect, ComCtrls, Menus;

type
  TFrmCadRubNew = class(TfrmOkCancelar)
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    BtnServicos: TToolbarButton97;
    BtnBeneficio: TToolbarButton97;
    Btnelegivel: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    DsRubxBenef: TwwDataSource;
    QryRubxBenef: TwwQuery;
    UpdRubxBenef: TUpdateSQL;
    QryRubxBenefIDBENEFICIO: TFloatField;
    QryRubxBenefNOME: TStringField;
    QryRubxBenefIDSITBENEF: TFloatField;
    QryRubxBenefDESCRICAO: TStringField;
    MsBeneficios: TMontaSelect;
    MsServico: TMontaSelect;
    MsSituacaoxBenef: TMontaSelect;
    qryaux: TwwQuery;
    PgSitBenef: TPageControl;
    TbsBenfServ: TTabSheet;
    TbsDocumentos: TTabSheet;
    GrdRubxBenef: TwwDBGrid;
    CkbTipDoc: TCheckBox;
    Label2: TLabel;
    GrdDocAssoc: TwwDBGrid;
    QryDocAssoc: TwwQuery;
    QryDocAssocIDDOCUMENTO: TFloatField;
    QryDocAssocNOMEDOCUMENTO: TStringField;
    DsDocAssoc: TwwDataSource;
    PnlAssunto: TPanel;
    MnuRub: TPopupMenu;
    Exclui1: TMenuItem;
    QryRubxBenefT: TStringField;
    QryRubxBenefOK: TStringField;
    qrypartprevplan: TwwQuery;
    qrypartprevplanIDSITPART: TFloatField;
    qrypartprevplanIDSITPLANOPREV: TFloatField;
    qrypartprevplanIDSITFUNC: TFloatField;
    qrypartprevplanFLGINTERNO: TStringField;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnBeneficioClick(Sender: TObject);
    procedure BtnServicosClick(Sender: TObject);
    procedure BtnelegivelClick(Sender: TObject);
    procedure PgSitBenefChange(Sender: TObject);
    procedure PgSitBenefChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure Label2Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure Exclui1Click(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    bGravandodados :Boolean;
    sidpessjurd : string;
    Procedure LimpaQry;
  public
     sidplanoprev : string;
  end;

var
  FrmCadRubNew: TFrmCadRubNew;
  ssenha, susuario :string;

implementation

{$R *.DFM}

Uses uFuncaoGeral, UDataBase, dAtend, uMensErro,
  uRubs,Fsenha, uString, fTelaAut, uSistema,
     fSelMotivoBaixa, dRubs, FSelCartaEtiq, UBeneficio, FAtend, FPrincipal;
Procedure TFrmCadRubNew.LimpaQry;
Begin
   FuncaoGeral.FechaQry([QryRubxBenef, QryDocAssoc, QryAux],false,True);
   QryRubxBenef.Open;
   BtnBeneficio.Enabled := True;
   BtnServicos.Enabled  := True;
End;

procedure TFrmCadRubNew.FormCreate(Sender: TObject);
begin
  inherited;
  LimpaQry;
  bGravandodados := False;

  If dtmAtend.qryplanprev.Active Then dtmAtend.qryplanprev.close;
  if Not dtmAtend.qryplanprev.Prepared Then dtmAtend.qryplanprev.Close;
  dtmAtend.qryplanprev.ParamByName('IDPESSOA').AsFloat  := Frmatend.qryIDTITULAR.AsInteger;
  dtmAtend.qryplanprev.ParamByName('IDPESSJUR').AsFloat := Frmatend.qryIDPESSJUR.AsInteger;
  dtmAtend.qryplanprev.Open;
end;

procedure TFrmCadRubNew.BtnBeneficioClick(Sender: TObject);

  var bErro, bElegivel : boolean;
      sMsgErro : string;
       idregraelegividade, iIdPessJur, iIdPlanoPrev, iIdTitular,iseqProposta,
       IdBeneficio,rOpcao1, rOpcao2, rOpcao3 : integer ;
       dtDataEvento, dtInicioFund,sDataDemissao,dtDataRequerimento,
       sFlgInternoAntes,sFlgInternoDepois : string;
       sIdSitPartAntes, sIdSitPlanAntes,sIdSitFuncAntes,sIdSitPartDepois,
       sIdSitPlanDepois,sIdSitFuncDepois : string;
       iNumBenef : integer;
begin
  inherited;
  try
    BtnServicos.Enabled := false;
    sidpessjurd := InttoStr(Frmatend.qryIDPESSJUR.AsInteger);
    MsBeneficios.Filtro.Clear;
    MsBeneficios.Filtro.Add('BENEFICIO.IDBENEFICIO = BENEFPLANPREV.IDBENEFICIO');
    MsBeneficios.Filtro.Add('PLANPREV.IDPLANOPREV = BENEFPLANPREV.IDPLANOPREV');
    MsBeneficios.Filtro.Add('PLANPREVPATRO.IDPLANOPREV = BENEFPLANPREV.IDPLANOPREV');
    MsBeneficios.Filtro.Add('PESSOA.IDPESSOA = PLANPREVPATRO.IDPESSJUR');

    // David - 21748
    if Frmatend.qryTitularIDPLANOPREV.AsInteger > 0 then
      MsBeneficios.Filtro.Add('PLANPREVPATRO.IDPLANOPREV =  ' +  Frmatend.qryTitularIDPLANOPREV.asString )
    else
      MsBeneficios.Filtro.Add('PLANPREVPATRO.IDPLANOPREV =  ' +  Frmatend.idplanoprev );

    MsBeneficios.Filtro.Add('PLANPREVPATRO.IDPESSJUR = ' + sidpessjurd);

    MsBeneficios.Executar;

    If MsBeneficios.RetornouValor Then
    Begin
    if (Msbeneficios.ValoresChave[2]= '') or
       (strtointDef(Msbeneficios.ValoresChave[2], 0) <= 0)   OR (strtointDef(Msbeneficios.ValoresChave[6], 0) <> 1)
    then bElegivel  := True
    else begin
        If qrypartprevplan.Active Then qrypartprevplan.Close;

      qrypartprevplan.ParamByName('IDPESSJUR').Asinteger := Frmatend.qryIDPESSJUR.AsInteger;
      qrypartprevplan.ParamByName('IDPESSOA').AsINTEGER  := Frmatend.qryIDTITULAR.AsInteger;
      qrypartprevplan.ParamByName('IDPLANOPREV').AsINTEGER  := StrToIntDef(Msbeneficios.ValoresChave[5], 0);
      qrypartprevplan.Open;
        idregraelegividade := StrToIntDef(Msbeneficios.ValoresChave[2], 0);
        iIdPessJur := StrToIntDef(Msbeneficios.ValoresChave[4], 0);
        iIdPlanoPrev :=  StrToIntDef(Msbeneficios.ValoresChave[5], 0);
        iIdTitular := Frmatend.qryIDTITULAR.AsInteger;
        iSeqProposta := 1;
        ropcao1 := 0;
        ropcao2 := 0;
        ropcao3 := 0;
        if  frmatend.dbdataevento.text <> '' then
              dtDataEvento :=  frmatend.dbdataevento.text
        else
               dtDataEvento := Datetostr(Date);
        if  frmatend.dbdatadib.text <> '' then
               dtInicioFund := frmatend.dbdatadib.text
         else
                dtInicioFund := Datetostr(Date);
        if frmatend.dbdatademissao.text <> '' then
             sDataDemissao := frmatend.dbdatademissao.text
         else
             sDataDemissao := Datetostr(Date);
        if  frmatend.dbdatarequerimento.text <> '' then
              dtDataRequerimento := frmatend.dbdatarequerimento.text
         else
             dtDataRequerimento := Datetostr(Date);
        sFlgInternoAntes := qryPartPrevPlanFlginterno.AsString;
        sFlgInternoDepois := qryPartPrevPlanFlginterno.AsString;
        sIdSitPartAntes := floattostr(QryPartPrevPlanIDSITPART.ASFLOAT);
        sIdSitPlanAntes := floattostr(QryPartPrevPlanIDSITPLANOPREV.ASFLOAT);
        sIdSitFuncAntes := floattostr(QryPartPrevPlanIDSITFUNC.ASFLOAT);
        sIdSitPartDepois :=  floattostr(QryPartPrevPlanIDSITPART.ASFLOAT);
        sIdSitPlanDepois := floattostr(QryPartPrevPlanIDSITPLANOPREV.ASFLOAT);
        sIdSitFuncDepois :=  floattostr(QryPartPrevPlanIDSITFUNC.ASFLOAT);
        try
          if TRIM(frmatend.bbnumerobeneficiario.text) <> '' then
              iNumBenef := strtointDef(frmatend.bbnumerobeneficiario.text, 0)
          else
            iNumBenef := 1;

          bElegivel:= ExecutaRegraElegibilidade(qryAux,
                                          idregraelegividade,
                                          iIdPessJur, iIdPlanoPrev, iIdTitular,
                                          iSeqProposta,
                                          IdBeneficio,
                                          rOpcao1, rOpcao2, rOpcao3,
                                          dtDataEvento,
                                          dtInicioFund,
                                          sDataDemissao,
                                          dtDataRequerimento,
                                          sFlgInternoAntes,
                                          sFlgInternoDepois,
                                          sIdSitPartAntes,
                                          sIdSitPlanAntes,
                                          sIdSitFuncAntes,
                                          sIdSitPartDepois,
                                          sIdSitPlanDepois,
                                          sIdSitFuncDepois,
                                          iNumBenef,
                                          0,
                                          bErro,
                                          sMsgErro );
            except
              showMessage('Erro na execução da REGRA de elegibilidade!')
            end;
          end;

        if not bElegivel then
        begin
        showmessage('Erro na Elegividade na geração da Rubs de Benefício');
       end;

       if  bElegivel =  TRUE then
       BEGIN
         QryRubxBenef.Append;

         QryRubxBenefIDBENEFICIO.AsFloat := StrToFloat(MsBeneficios.ValoresChave[0]);
         QryRubxBenefNOME.AsString       := MsBeneficios.ValoresChave[1];
         QryRubxBenefT.AsString          := 'B';
         QryRubxBenefOK.AsString         := '';

         MsSituacaoxBenef.Filtro.Clear;
         MsSituacaoxBenef.Filtro.Add('SITBENEF.IDSITBENEF = SITUACAOXBENEF.IDSITBENEF');
         MsSituacaoxBenef.Filtro.Add('SITUACAOXBENEF.IDBENEFICIO = '+MsBeneficios.ValoresChave[0]);
         MsSituacaoxBenef.Filtro.Add('SITUACAOXBENEF.IDBENEFICIO NOT IN (SELECT IDSERVICOS FROM SERVICO)');
         MsSituacaoxBenef.Filtro.Add('SITUACAOXBENEF.IDPESSJUR =  ' + Frmatend.qryIDPESSJUR.AsString);
         MsSituacaoxBenef.Filtro.Add('SITUACAOXBENEF.IDPLANOPREV =  ' + IntToStr(dtmAtend.qryplanprev.FieldByName('idplanoprev').AsInteger));
         MsSituacaoxBenef.Executar;

         If MsSituacaoxBenef.RetornouValor Then
         Begin
           QryRubxBenefIDSITBENEF.AsFloat  := StrToFloat(MsSituacaoxBenef.ValoresChave[0]);
           QryRubxBenefDESCRICAO.AsString  := MsSituacaoxBenef.ValoresChave[1];
           QryRubxBenef.Post;
         End
         Else
         Begin
           MsgDlg('Situação do Benefício não foi informada','Atenção',mtError,[mbOk],0);
           QryRubxBenef.Cancel;
         End;
       END;
     END;
  except
    showMessage('Não Foi Possível Selecionar um Bemefício!');
  end;
end;

procedure TFrmCadRubNew.BtnServicosClick(Sender: TObject);
var
  idregraelegividade : integer;
begin
  inherited;
  BtnBeneficio.Enabled := false;

  MsServico.Executar;

  If MsServico.RetornouValor Then
  Begin
     QryRubxBenef.Append;

     QryRubxBenefIDBENEFICIO.AsFloat := StrToFloat(MsServico.ValoresChave[0]);
     QryRubxBenefNOME.AsString       := MsServico.ValoresChave[1];
     if   MsServico.ValoresChave[2] <>   ''  then
           idregraelegividade := StrToIntDef(MsServico.ValoresChave[2], -1);
     QryRubxBenefT.AsString          := 'S';
     QryRubxBenefOK.AsString         := '';

     MsSituacaoxBenef.Filtro.Clear;
     MsSituacaoxBenef.Filtro.Add('SITBENEF.IDSITBENEF = SITUACAOXBENEF.IDSITBENEF');
     MsSituacaoxBenef.Filtro.Add('SITUACAOXBENEF.IDBENEFICIO = '+MsServico.ValoresChave[0]);
     MsSituacaoxBenef.Executar;

     If MsSituacaoxBenef.RetornouValor Then
     Begin
       QryRubxBenefIDSITBENEF.AsFloat  := StrToFloat(MsSituacaoxBenef.ValoresChave[0]);
       QryRubxBenefDESCRICAO.AsString  := MsSituacaoxBenef.ValoresChave[1];
       QryRubxBenef.Post;
     End
     Else
     Begin
       MsgDlg('Situação do Serviço não informada','Atenção',mtError,[mbOk],0);
       QryRubxBenef.Cancel;
     End;
  End;
end;

procedure TFrmCadRubNew.BtnelegivelClick(Sender: TObject);
Var
    sSQL : String;
    sDataInscFund :  String;
    bConcedeBeneficio,berro : boolean;
begin
  inherited;

  QryRubxBenef.First;
  While Not QryRubxBenef.Eof Do
  begin
     sDataInscFund := DateToStr(Date);

     sSQL := 'SELECT  DISTINCT PF.DATANASC,  PF.DATAMORTE, PF.SEXO, '+
             '        EL.TEMPONAOCREDITADO, EL.DATAADMISSAO, EL.IDSITFUNC, '+
             '        EL.TEMPOSERVTOTAL, BP.IDBENEFICIO,BP.IDREGRAELEGIBILI,'+
             '        EL.TEMPOSERVANTERIOR, EL.TEMPOSITESPECIAL, DE.FLGBENEFICIARIO, ' +
             '        PP.FLGDEVEPREVIDENC, PP.FLGDEVEASSISTENC, PP.FLGDEVEEMPRESTIMO, '+
             '        PP.IDSITPART, PP.IDSITPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA, '+
             '        PP.IDPESSJUR,  PP.IDPLANOPREV,  PP.INSCRICAODATA, SP.FLGINTERNO, '+
             '        EL.DATADEMISSAO,BBB.NOME,'+
             '''' + Trim(datetostr(Date))+ ''' AS DATAINICIO,         '+
             '''' + Trim(datetostr(Date))+ ''' AS DTEVENTO,           '+
             '''' + Trim(datetostr(Date)) + ''' AS DATAREF,           '+
             '''' + sDataInscFund + ''' AS INSCRICAODATAFUND,'+
             ' BE.VALORBASE1,   '+
             ' BE.VALORBASE2,   '+
             ' BE.VALORBASE3    '+
             ' FROM  ELEGPATRO EL, DEPENTIT DE, PESSOAFISICA PF, PESSOAXFUND PX,'+
             '       PARTPREVPLAN PP, SITPART SP, BENEFPLANPREV BP, BENEFPLANOPART BE, BENEFICIO BBB '+
             ' WHERE PP.IDPESSOA    = ' + Frmatend.qryIDTITULAR.AsString  + ' AND ' +
             '       PP.SEQPROPOSTA = 1 AND ' +
             '       PP.IDPLANOPREV = ' + IntToStr(dtmAtend.qryplanprev.FieldByName('idplanoprev').AsInteger) + ' AND ' +
             '       PP.IDPESSJUR   = ' + IntToStr(Frmatend.qryIDPESSJUR.AsInteger)   + ' AND ' +
             '       BE.IDPESSOA    = PP.IDPESSOA    AND '+
             '       BE.IDPLANOPREV = PP.IDPLANOPREV AND '+
             '       BE.IDPESSJUR   = PP.IDPESSJUR   AND '+
             '       BE.SEQPROPOSTA = PP.SEQPROPOSTA AND '+
             '       BP.IDPLANOPREV = PP.IDPLANOPREV AND '+
             '       BP.IDBENEFICIO = ' + QryRubxBenefIDBENEFICIO.AsString +' AND '+
             '       BP.IDBENEFICIO = BBB.IDBENEFICIO AND '+
             '       EL.IDPESSOA  = PP.IDPESSOA  AND '+
             '       EL.IDPESSJUR = PP.IDPESSJUR AND '+
             '       SP.IDSITPART = PP.IDSITPART AND '+
             '       DE.IDTITULAR = EL.IDPESSOA  AND '+
             '       DE.IDPESSOA  = EL.IDPESSOA  AND '+
             '       EL.IDPESSOA  = PF.IDPESSOA(+) ';

     qryAux.SQL.clear;
     qryAux.SQL.add(sSql);
     qryAux.Open;

     if not bConcedeBeneficio then
     Begin
        if MsgDlg('Beneficio de '
                  + qryAux.FieldByName('NOME').AsString
                  + ' não cumpre os requisitos de elegibilidade, exclui da Solicitação ?',
                  'Atenção',
                  mtConfirmation,
                  [mbYes, mbNo],
                  0) = mrYes then
           QryRubxBenef.Delete
        else
        begin
           QryRubxBenef.Edit;
           QryRubxBenefOK.AsString := 'Não';
           QryRubxBenef.Post;
           QryRubxBenef.Next;
        end;
     end
     else
     begin
        QryRubxBenef.Edit;
        QryRubxBenefOK.AsString := 'Sim';
        QryRubxBenef.Post;
        QryRubxBenef.Next;
     end;
  end;
end;

procedure TFrmCadRubNew.PgSitBenefChange(Sender: TObject);
Var
 sIdbeneficios, sIdSitBenef :String;
begin
  inherited;
  If (PgSitBenef.ActivePage = TbsDocumentos) Or bGravandodados Then
  Begin
    sIdbeneficios := '';
    sIdSitBenef   := '';

    If CkbTipDoc.Checked Then
    Begin
       QryRubxBenef.First;
       While Not QryRubxBenef.Eof Do
       Begin
          If Not QryRubxBenefIDBENEFICIO.isNull Then
             sIdbeneficios := sIdbeneficios + QryRubxBenefIDBENEFICIO.AsString + ',';

          If Not QryRubxBenefIDSITBENEF.isNull Then
             sIdSitBenef := sIdSitBenef + QryRubxBenefIDSITBENEF.AsString + ',';

          QryRubxBenef.Next;
       End;

       TbsDocumentos.Caption := 'Todos os Documentos';
    End
    Else
    Begin
       If Not QryRubxBenefIDBENEFICIO.isNull Then
          sIdbeneficios := sIdbeneficios + QryRubxBenefIDBENEFICIO.AsString + ',';

       If Not QryRubxBenefIDSITBENEF.isNull Then
          sIdSitBenef := sIdSitBenef + QryRubxBenefIDSITBENEF.AsString + ',';

       TbsDocumentos.Caption := 'Documentos para ' + QryRubxBenefNOME.AsString;
    End;

    if sIdbeneficios <> '' then
       sIdbeneficios := copy(sIdbeneficios,1,Length(sIdbeneficios)-1);

    if sIdSitBenef <> '' then
       sIdSitBenef := copy(sIdSitBenef,1,Length(sIdSitBenef)-1);

    With QryDocAssoc Do
    Begin
       If Active Then Close;
       Sql.Clear;
       SQL.Text :=
       ' SELECT DISTINCT ' +
       '    TP.IDDOCUMENTO , TP.NOMEDOCUMENTO ' +
       ' FROM ' +
       '    TIPODOCXBENEF TB, DOCUMENTOS TP ' +
       ' WHERE ' +
       '    (TB.IDPESSOA = :IDPESSJUR) AND ' +
       '    (TB.IDPLANOPREV = :IDPLANOPREV) AND ' +
       '    (TB.IDDOCUMENTO = TP.IDDOCUMENTO) ' ;

       ParamByName('idpessjur').AsInteger   := Frmatend.qryIDPESSJUR.AsInteger;
       ParamByName('idplanoprev').AsInteger := dtmAtend.qryplanprev.FieldByName('idplanoprev').AsInteger;

       If sidbeneficios <> '' Then
          SQL.Add(' AND (TB.IDBENEFICIO in (' + sidbeneficios + '))');

       If sIdSitBenef <> '' Then
          SQL.Add(' AND (TB.IDSITBENEF  in (' + sIdSitBenef + '))');

       If sIdSitBenef <> '' Then
          SQL.Add(' ORDER BY TP.NOMEDOCUMENTO ');

       Open;
    End;
  End
  Else
    TbsDocumentos.Caption := 'Todos os Documentos';
end;

procedure TFrmCadRubNew.PgSitBenefChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  AllowChange := Not QryRubxBenef.isEmpty;
end;

procedure TFrmCadRubNew.Label2Click(Sender: TObject);
begin
  inherited;
  CkbTipDoc.Checked := Not CkbTipDoc.Checked;
end;

procedure TFrmCadRubNew.bbtnConfirmarClick(Sender: TObject);
begin

  inherited;
  If Not QryRubxBenef.IsEmpty Then
  Begin
     Try
       bGravandodados := True;

       BtnBeneficio.Enabled := true;
       BtnServicos.Enabled := true;

       QryRubxBenef.First;

       CkbTipDoc.Checked := False;

       While Not QryRubxBenef.Eof Do
       Begin
          Rubs.StatusRubs := srGerado;
          Rubs.Insert;

          Rubs.Beneficio.IdPessJur   := Frmatend.qryIDPESSJUR.AsInteger;
          Rubs.Beneficio.IdPessoa    := Frmatend.qryIDBENEFICIARIO.asInteger;
          Rubs.Beneficio.Idtitular   := Frmatend.qryIDTITULAR.asInteger;
          Rubs.Beneficio.IdBeneficio := QryRubxBenefIDBENEFICIO.AsInteger;
          Rubs.Beneficio.Idsitbenef  := QryRubxBenefIDSITBENEF.AsInteger;
          Rubs.Beneficio.Insert;

          PgSitBenefChange(Self);

          QryDocAssoc.First;
          While Not QryDocAssoc.Eof Do
          Begin
             Rubs.Documento.IdRubXBenef := Rubs.Beneficio.IdRubXBenef;
             Rubs.Documento.IdDocumento := QryDocAssocIDDOCUMENTO.AsInteger;
             Rubs.Documento.Recebido := False;
             Rubs.Documento.Insert;

             QryDocAssoc.Next;
          End;

          QryRubxBenef.Next;
       End;

       CkbTipDoc.Checked := True;
       bGravandodados := False;
       ModalResult := MrOk;
       Close;
     except
       CkbTipDoc.Checked := True;
       bGravandodados := False;
       MsgDlg('Erro Ao Cadastrar A Rub','Atenção',mtError,[mbOk],0);
       Raise;
     End;
  End;
end;



procedure TFrmCadRubNew.Exclui1Click(Sender: TObject);
begin
  inherited;
  If Not QryRubxBenef.IsEmpty And
     (MsgDlg('Deseja Excluir o Beneficio\Serviço ' +
             QryRubxBenefNOME.AsString +
             ' ?',
             'Atenção',
             mtConfirmation,
             [mbYes, mbNo],
             0) = mrYes) then QryRubxBenef.Delete;
end;

procedure TFrmCadRubNew.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaQry;
end;

procedure TFrmCadRubNew.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Rubs.EsperaForm := False;
end;

end.
