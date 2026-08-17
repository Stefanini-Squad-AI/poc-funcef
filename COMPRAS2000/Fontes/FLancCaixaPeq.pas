unit FLancCaixaPeq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, wwdblook, CMDBLookupCombo, CMProcuraSubTipo, TREdit, Mask,
  DBCtrls, CMProcuraMask, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList, uCMTypes;

type
  TFrmLancCaixaPeq = class(TfrmCadastroCS)
    qryCP: TwwQuery;
    qryIDFORCLI: TFloatField;
    qryDESCCAIXAPEQ: TStringField;
    qryVLRMAXLANC: TFloatField;
    qryIDCAIXAPEQUENO: TFloatField;
    dblcCaixaPeq: TCMDBLookupCombo;
    Label1: TLabel;
    edDatalanc: TCMDateTimePicker;
    Label2: TLabel;
    edValLanc: TDBRealEdit;
    Label3: TLabel;
    cmpContab: TCMProcuraMaskContabil;
    edId: TDBEdit;
    Label4: TLabel;
    edNumDoc: TDBEdit;
    Label5: TLabel;
    memHist: TDBMemo;
    Label6: TLabel;
    qryCentCust: TwwQuery;
    qryCentResp: TwwQuery;
    qryUnNegoc: TwwQuery;
    dblcCentResp: TCMDBLookupCombo;
    Label7: TLabel;
    Label8: TLabel;
    dblcCentCust: TCMDBLookupCombo;
    dblcUnNegoc: TCMDBLookupCombo;
    Label9: TLabel;
    qryTipoRecDeb: TwwQuery;
    Label10: TLabel;
    dblcTipoRecDeb: TCMDBLookupCombo;
    qrySubConta: TwwQuery;
    lblSubConta: TLabel;
    dblcSubConta: TwwDBLookupCombo;
    memSCI: TMemo;
    btnSCI: TSpeedButton;
    msSCI: TMontaSelect;
    btnApaga: TSpeedButton;
    qryTipoRecDebCODTIPRECDES: TStringField;
    qryTipoRecDebDESCRICAO: TStringField;
    qryTipoRecDebPLACONTA: TStringField;
    qrySCI: TwwQuery;
    updSCI: TUpdateSQL;
    qrySCINUMSOLCOMPRA: TFloatField;
    qrySCICODARTIGO: TStringField;
    qrySCIQTDEPEDIDA: TFloatField;
    qrySCIQTDEPENDENTE: TFloatField;
    qrySCISALDOACOMPRAR: TFloatField;
    updSCIAnt: TUpdateSQL;
    qrySCIAnt: TwwQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    qryUnNegocUNIDNEGOC: TFloatField;
    qryUnNegocNOME: TStringField;
    qryCentCustCODCENTROCUSTO: TStringField;
    qryCentCustNOME: TStringField;
    qryCentRespCODCENTRORESPON: TStringField;
    qryCentRespNOME: TStringField;
    qrySubContaNOMESUBCONTA: TStringField;
    qrySubContaCODSUBCONTA: TFloatField;
    qryIDLANCCXPEQ: TFloatField;
    qryIDEMPRESA: TFloatField;
    qryCODCENTROCUSTO: TStringField;
    qryCODSUBCONTA: TFloatField;
    qryIDPESSOA: TFloatField;
    qryPLANO: TFloatField;
    qryPLACONTA: TStringField;
    qryCODCENTRORESPON: TStringField;
    qryUNIDNEGOC: TFloatField;
    qryRECPAG: TStringField;
    qryCODTIPRECDES: TStringField;
    qryIDITEMSOLI: TFloatField;
    qryIDCAIXAPEQUENO2: TFloatField;
    qryNODOCUMENTO: TStringField;
    qryDATALANC: TDateTimeField;
    qryVLRLANC: TFloatField;
    qryHISTLANCAMENTO: TStringField;
    qryDESCPROD: TStringField;
    qryNUMSOLCOMPRA: TFloatField;
    qryCODARTIGO: TStringField;
    qrySCIAntIDITEMSOLI: TFloatField;
    qrySCIIDITEMSOLI: TFloatField;
    Label11: TLabel;
    dblcPrograma: TCMDBLookupCombo;
    qryPrograma: TwwQuery;
    qryProgramaIDPROGRAMA: TFloatField;
    qryProgramaCODPROGRAMA: TStringField;
    qryProgramaDESCPROGRAMA: TStringField;
    qryCPVLRTOTCAIXAPEQ: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure btnSCIClick(Sender: TObject);
    procedure btnApagaClick(Sender: TObject);
    procedure dblcTipoRecDebCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cmpContabExit(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    procedure Sel( n : LongInt );
    procedure LeContaSCI( sCodArt : String; Var sConta, sSubConta : String );
    Function  LeTipoDesemb ( sCodArt : String ) : String;
    Function  VerifSaldoCP( idCaixaPeq : LongInt; rValor : Double ) : Boolean;
  public
    { Public declarations }
  end;

var
  FrmLancCaixaPeq : TFrmLancCaixaPeq;
  iIdSCI          : LongInt;
  iIdItemSCI      : LongInt;
  sCodArtigo      : String;
  sIdCxPeq        : String;
  sCentResp       : String;
implementation

{$R *.DFM}

uses uSistema, uMensErro, uDataBase, dBaseDados,
     uIntegraBack,uString, uDocumento ;

procedure TFrmLancCaixaPeq.FormCreate(Sender: TObject);
begin
  inherited;
  sIdCxPeq  := '';
  sCentResp := '';
  MontaSelect.Filtro.Add('USUARIOXCAIXAPEQ.IDUSUARIO ='+IntToStr(Sistema.IdUsuario));
  MontaSelect.Filtro.Add('LANCCAIXAPEQ.IDPESSOA  ='+IntToStr(Sistema.IdEmpresa));
  msSCI.Filtro.Add('SOLICOMP.IDPESSOA  ='+IntToStr(Sistema.IdEmpresa));
  if IntegraBack.Contabilidade = 'S' Then
     Begin
        cmpContab.Plano    := IntegraBack.Plano;
        cmpContab.Mascara  := IntegraBack.MascaraPlano;
     end
  else
     cmpContab.Enabled  := False;
  Sel(-1);
  //
  qryCentCust.Close;
  qryCentCust.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryCentCust.Open;
  //

  qryCentResp.Close;
  qryCentResp.ParamByName('pIDPESS').AsInteger := Sistema.IdEmpresa;
  qryCentResp.Open;
  //
  qryUnNegoc.Close;
  qryUnNegoc.ParamByName('pIDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryUnNegoc.Open;
  //
  qryTipoRecDeb.Close;
  qryTipoRecDeb.ParamByName('pIDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryTipoRecDeb.Open;
  //
  qrySubConta.Close;
  qrySubConta.ParamByName('pIDPESS').AsInteger := Sistema.idEmpresa;
  qrySubConta.Open;
  //
  qryCP.Close;
  qryCP.ParamByName('pIDPESSOA').AsInteger  := Sistema.IdEmpresa;
  qryCP.ParamByName('pIDUSUARIO').AsInteger := Sistema.IdUsuario;
  qryCP.Open;
  dblcPrograma.Enabled := Sistema.UsaPlanoPatro;
end;

procedure TFrmLancCaixaPeq.Sel( n : LongInt );
Begin
   qry.Close;
   qry.Params[0].AsInteger := n;
   qry.Open;
   //
   qrySCIAnt.Close;
   qrySCIAnt.ParamByName('pIDITEMSOLI').AsInteger := qry.FieldByName('IDITEMSOLI').AsInteger;
   qrySCIAnt.Open;
   //
   qrySCI.Close;
   qrySCI.ParamByName('pIDITEMSOLI').AsInteger := qry.FieldByName('IDITEMSOLI').AsInteger;
   qrySCI.Open;
   //
   If Not qry.FieldByName('NUMSOLCOMPRA').IsNull Then
      Begin
         iIDSCI     := qry.FieldByName('NUMSOLCOMPRA').AsInteger;
         iIDItemSCI := qry.FieldByName('IDITEMSOLI').AsInteger;
         sCodArtigo := qry.FieldByName('CODARTIGO').AsString;
      End
   Else
      Begin
         iIDSCI     := -1;
         iIDItemSCI := -1;
         sCodArtigo := '';
      End;
End;

procedure TFrmLancCaixaPeq.CmeCadastroInsert(Sender: TObject);
begin
     Inherited;
     btnApaga.click;
     qry.FieldByName('DATALANC').asDateTime := Date;
     edDatalanc.Date := Date;
     If sIdCxPeq <> '' Then
        Begin
           dblcCaixaPeq.LookupValue := sIdCxPeq;
           dblcCaixaPeq.Text        := qryDESCCAIXAPEQ.AsString;

           dblcCentResp.LookupValue := sCentResp;
           dblcCentResp.Text        := qryCentRespNOME.AsString;
        End;
     dblcCaixaPeq.SetFocus;
end;

procedure TFrmLancCaixaPeq.CmeCadastroEdit(Sender: TObject);
begin
     Inherited;
     dblcCaixaPeq.SetFocus;
end;

procedure TFrmLancCaixaPeq.CmeCadastroDelete(Sender: TObject);
begin
     If qry.FieldByName('NUMSOLCOMPRA').IsNull Then
        Begin
            qrySCI.Close;
            qrySCI.ParamByName('pIDITEMSOLI').AsInteger := qry.FieldByName('IDITEMSOLI').AsInteger;
            qrySCI.Open;
            If Not qrySCI.IsEmpty Then
               Begin
                  qrySCI.Edit;
                  qrySCI.FieldByName('QTDEPENDENTE').AsFloat  := qrySCI.FieldByName('QTDEPEDIDA').AsFloat;
                  qrySCI.FieldByName('SALDOACOMPRAR').AsFloat := qrySCI.FieldByName('QTDEPEDIDA').AsFloat;
                  qrySCI.Post;
               End;
        End;
     Inherited;
end;

procedure TFrmLancCaixaPeq.CmeCadastroFind(Sender: TObject);
begin
  Inherited;
  If MontaSelect.RetornouValor Then
    Begin
       Sel(StrToInt(MontaSelect.ValoresChave[0]));
       If Not qry.FieldByName('NUMSOLCOMPRA').IsNull Then
          Begin
             memSCI.Lines.Clear;
             memSCI.Lines.Insert(0,'SCI Nº : '+IntToStr(qry.FieldByName('NUMSOLCOMPRA').asInteger));
             memSCI.Lines.Insert(1,'ARTIGO : '+qry.FieldByName('DESCPROD').asString);
          End;
    End;
end;

Procedure TFrmLancCaixaPeq.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
  Accept := True;
  If Trim(dblcCaixaPeq.Text) = '' then
      Begin
         MsgDlg('Caixa Pequeno não preenchido','Erro',mtError,[mbOK],0);
         dblcCaixaPeq.SetFocus;
         Accept := False;
      End
  Else
  If Trim(edDatalanc.Text) = '' then
      Begin
         MsgDlg('Data do lançamento não preenchido','Erro',mtError,[mbOK],0);
         edDatalanc.SetFocus;
         Accept := False;
      End
  Else
  If edValLanc.Value <= 0 then
      Begin
         MsgDlg('Valor do lançamento não pode ser menor ou igual a zero','Erro',mtError,[mbOK],0);
         edValLanc.SetFocus;
         Accept := False;
      End
  Else
  If (qryCP.FieldByName('VLRMAXLANC').AsFloat > 0) And (edValLanc.Value > qryCP.FieldByName('VLRMAXLANC').AsFloat) then
      Begin
         MsgDlg('Valor do lançamento não pode ser maior que '+Format('%15.2f',[qryCP.FieldByName('VLRMAXLANC').AsFloat]),'Erro',mtError,[mbOK],0);
         edValLanc.SetFocus;
         Accept := False;
      End
  Else
  If Not VerifSaldoCP(qryIDCAIXAPEQUENO.asInteger , edValLanc.Value) then
      Begin
         MsgDlg('Valor do lançamento é maior do que o saldo disponível','Erro',mtError,[mbOK],0);
         edValLanc.SetFocus;
         Accept := False;
      End
  Else
  If trim(memHist.Text) = '' then
      Begin
         MsgDlg('Obrigatório preencher o histórico do lançamento','Erro',mtError,[mbOK],0);
         memHist.SetFocus;
         Accept := False;
      End
  Else
  If trim(dblcTipoRecDeb.Text) = '' then
      Begin
         MsgDlg('Obrigatório preencher o Tipo de Desembolso','Erro',mtError,[mbOK],0);
         dblcTipoRecDeb.Enabled := True;
         dblcTipoRecDeb.SetFocus;
         Accept := False;
      End
  Else
  If trim(dblcCentResp.Text) = '' then
      Begin
         MsgDlg('Obrigatório preencher o Centro de Responsabilidade','Erro',mtError,[mbOK],0);
         dblcCentResp.Enabled := True;
         dblcCentResp.SetFocus;
         Accept := False;
      End
  Else
  If trim(dblcUnNegoc.Text) = '' then
      Begin
         MsgDlg('Obrigatório preencher a Atividade/Projeto','Erro',mtError,[mbOK],0);
         dblcUnNegoc.Enabled := True;
         dblcUnNegoc.SetFocus;
         Accept := False;
      End
  Else
  If IntegraBack.Contabilidade = 'S' Then
     Begin
        If cmpContab.Valida <> vcOK then
            Begin
               cmpContab.Enabled := True;
               cmpContab.SetFocus;
               Accept := False;
            End
        Else
        If (cmpContab.Conta.ObrigaSubConta) And (Trim(dblcSubConta.Text) = '') Then
           Begin
               MsgDlg('Conta obriga Sub-Conta','Erro',mtError,[mbOK],0);
               dblcSubConta.Enabled := True;
               dblcSubConta.SetFocus;
               Accept := False;
           End
        Else
        If (cmpContab.Conta.ObrigaCentrodeCusto) And (Trim(dblcCentCust.Text) = '') Then
           Begin
               MsgDlg('Conta obriga Centro de Custo','Erro',mtError,[mbOK],0);
               dblcCentCust.Enabled := True;
               dblcCentCust.SetFocus;
               Accept := False;
           End;
     End;
End;

procedure TFrmLancCaixaPeq.CmeCadastroConfirma(Sender: TObject);
begin
  If qry.State in [dsEdit,dsInsert] Then
    Begin
       If qry.State = dsInsert Then
          qry.FieldByName('IDLANCCXPEQ').asInteger := LeUltRegistro(nil,'LANCCAIXAPEQ');
       qry.FieldByName('IDPESSOA').asInteger     := Sistema.IdEmpresa;
       qry.FieldByName('IDEMPRESA').asInteger    := Sistema.IdEmpresa;
       qry.FieldByName('PLANO').asInteger        := IntegraBack.Plano;
       qry.FieldByName('RECPAG').asString        := 'P';
       //
       If Not qry.FieldByName('NUMSOLCOMPRA').IsNull Then
          Begin
             qrySCIAnt.Edit;
             qrySCIAnt.FieldByName('QTDEPENDENTE').AsFloat  := qrySCIAnt.FieldByName('QTDEPEDIDA').AsFloat;
             qrySCIAnt.FieldByName('SALDOACOMPRAR').AsFloat := qrySCIAnt.FieldByName('QTDEPEDIDA').AsFloat;
             qrySCIAnt.Post;
          End;
       If iIdItemSCI > 0 Then
          Begin
             qrySCI.Close;
             qrySCI.ParamByName('pIDITEMSOLI').AsInteger := iIdItemSCI;
             qrySCI.Open;
             //
             qry.FieldByName('IDITEMSOLI').AsInteger   := iIdItemSCI;
             qry.FieldByName('NUMSOLCOMPRA').AsInteger := iIdSCI;
             qry.FieldByName('CODARTIGO').AsString     := sCodArtigo;
             //
             qrySCI.Edit;
             qrySCI.FieldByName('QTDEPENDENTE').AsFloat  := 0;
             qrySCI.FieldByName('SALDOACOMPRAR').AsFloat := 0;
             qrySCI.Post;
          End;
       sIdCxPeq  := dblcCaixaPeq.LookupValue;
       sCentResp := dblcCentResp.LookupValue;
       AplicaAlteracoes([qry,qrySCIAnt,qrySCI]);
       Inherited;
    End
  Else
    Begin
       AplicaAlteracoes([qry,qrySCI]);
       Inherited;
    End;
end;

procedure TFrmLancCaixaPeq.CmeCadastroCancel(Sender: TObject);
begin
   Inherited;
   If Not qry.FieldByName('NUMSOLCOMPRA').IsNull Then
      Begin
         iIDSCI     := qry.FieldByName('NUMSOLCOMPRA').AsInteger;
         iIDItemSCI := qry.FieldByName('IDITEMSOLI').AsInteger;
         sCodArtigo := qry.FieldByName('CODARTIGO').AsString;
         memSCI.Lines.Clear;
         memSCI.Lines.Insert(0,'SCI Nº : '+IntToStr(qry.FieldByName('NUMSOLCOMPRA').asInteger));
         memSCI.Lines.Insert(1,'ARTIGO : '+qry.FieldByName('DESCPROD').asString);
      End
   Else
      Begin
         iIDSCI     := -1;
         iIDItemSCI := -1;
         sCodArtigo := '';
         memSCI.Lines.Clear;
         memSCI.Lines.Insert(0,'SCI Nº : '+IntToStr(qry.FieldByName('NUMSOLCOMPRA').asInteger));
         memSCI.Lines.Insert(1,'ARTIGO : '+qry.FieldByName('DESCPROD').asString);
      End;
end;

procedure TFrmLancCaixaPeq.btnSCIClick(Sender: TObject);
Var
   sConta,sSubConta,sTipoDesmb: String;
begin
  inherited;
  msSCI.Executar;
  If msSCI.RetornouValor Then
    Begin
          iIdSCI     := StrToInt( msSCi.ValoresChave[0]);
          iIdItemSCI := StrToInt( msSCi.ValoresChave[6]);
          sCodArtigo := msSCI.ValoresChave[1];
          LeContaSCI(sCodArtigo, sConta, sSubConta);
          //
          If (IntegraBack.Contabilidade = 'S') and (Trim(sConta) <> '') Then
             Begin
                qry.FieldByName('PLACONTA').asString := sConta;
                If cmpContab.Valida = vcOK Then
                   Begin
                      cmpContab.Enabled    := False;
                      dblcCentCust.Enabled := cmpContab.Conta.ObrigaCentrodeCusto;
                      dblcSubConta.Enabled := cmpContab.Conta.ObrigaSubConta;
                   End;
             End
          Else
             Begin
                cmpContab.Enabled := True;
             End;
          If Trim(sSubConta) <> '' Then
             Begin
                qry.FieldByName('CODSUBCONTA').asString := sSubConta;
                dblcSubConta.Enabled := False;
             End
          Else
             Begin
               dblcSubConta.Text    := '';
             End;
          sTipoDesmb := LeTipoDesemb(sCodArtigo);
          If Trim(sTipoDesmb) <> '' Then
             Begin
                qry.FieldByName('CODTIPRECDES').asString := sTipoDesmb;
                dblcTipoRecDeb.Enabled := False;
             End
          Else
             Begin
               dblcTipoRecDeb.Text    := '';
               dblcTipoRecDeb.Enabled := True;
             End;

          //
          memSCI.Lines.Clear;
          memSCI.Lines.Insert(0,'SCI Nº : '+msSCI.ValoresChave[0]);
          memSCI.Lines.Insert(1,'ARTIGO : '+msSCI.ValoresChave[2]);
          //
          dblcCentCust.Text := '';
          dblcCentResp.Text := '';
          dblcUnNegoc.Text  := '';
          //
          If Trim(msSCI.ValoresChave[3]) <> '' Then
             Begin
               qry.FieldByName('CODCENTROCUSTO').AsString  := msSCI.ValoresChave[3];
               dblcCentCust.Enabled := False;
             End;
          //
          If Trim(msSCI.ValoresChave[4]) <> '' Then
             Begin
               qry.FieldByName('CODCENTRORESPON').AsString  := msSCI.ValoresChave[4];
               dblcCentResp.Enabled := False;
             End
          Else
             dblcCentResp.Enabled := True;
          //
          If Trim(msSCI.ValoresChave[5]) <> '' Then
             Begin
               qry.FieldByName('UNIDNEGOC').AsString  := msSCI.ValoresChave[5];
               dblcUnNegoc.Enabled := False;
             End
          Else
             dblcUnNegoc.Enabled := True;
    End;
end;

procedure TFrmLancCaixaPeq.btnApagaClick(Sender: TObject);
begin
  inherited;
  iIdSCI     := -1;
  iIdItemSCI := -1;
  sCodArtigo := '';
  memSCI.Lines.Clear;
  memSCI.Lines.Insert(0,'SCI Nº : ');
  memSCI.Lines.Insert(1,'ARTIGO : ');
  //
  if qry.State in [dsInsert,dsEdit] Then
    Begin
      qry.FieldByName('PLACONTA').Clear;
      qry.FieldByName('CODSUBCONTA').Clear;
    End;
  cmpContab.Enabled    := True;
  dblcSubConta.Text    := '';
  //
  dblcTipoRecDeb.Text  := '';
  dblcCentCust.Text    := '';
  dblcCentResp.Text    := '';
  dblcUnNegoc.Text     := '';
  //
  dblcTipoRecDeb.Enabled := True;
  dblcCentResp.Enabled   := True;
  dblcUnNegoc.Enabled    := True;
  //
  dblcTipoRecDeb.CloseUp( True );
end;

Procedure TFrmLancCaixaPeq.LeContaSCI( sCodArt : String; Var sConta, sSubConta : String );
Var
  sGrupoProd  : String;
Begin
       sCodArt := Trim(sCodArt);
       If FazQuery(dtmBaseDados.qry,' SELECT CONTASAIDA,SUBCONTASAIDA FROM ARTXCONTAXCC WHERE '+
                                    '(CODARTIGO = '''+sCodArt+''') AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')')
       Then
          Begin
              sConta    := dtmBaseDados.qry.FieldByName('CONTASAIDA').asString;
              sSubConta := dtmBaseDados.qry.FieldByName('SUBCONTASAIDA').asString;
          End
       Else
          Begin
                If FazQuery(dtmBaseDados.qry,'SELECT CODGRUPOPROD FROM PRODUTO WHERE '+
                                             '(RTRIM(CODPRODUTO) = '''+copy(sCodArt,1,6)+''')')
                Then
                   sGrupoProd := Trim(dtmBaseDados.qry.FieldByName('CODGRUPOPROD').asString);

                 If FazQuery(dtmBaseDados.qry,'SELECT CONTASAIDA,SUBCONTASAIDA FROM ARTXCONTAXCC WHERE '+
                                              '(CODGRUPOPROD = '''+sGrupoProd+''') AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') ')
                 Then
                    Begin
                        sConta    := dtmBaseDados.qry.FieldByName('CONTASAIDA').asString;
                        sSubConta := dtmBaseDados.qry.FieldByName('SUBCONTASAIDA').asString;
                    End
                 Else
                    Begin
                       sConta    := '';
                       sSubConta := '';
                    End;
          End;
End;

procedure TFrmLancCaixaPeq.dblcTipoRecDebCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If (modified) And (Trim(dblcTipoRecDeb.Text) <> '') Then
    Begin
        If (IntegraBack.Contabilidade = 'S') and (iIdItemSCI <= 0) Then
           Begin
              If dblcPrograma.LookupValue <> '' Then
                 qry.FieldByName('PLACONTA').asString := Documento.BuscaContaContabil(StrToInt(dblcPrograma.LookupValue), dblcTipoRecDeb.LookupValue,dblcCentCust.LookupValue)
              Else
                 qry.FieldByName('PLACONTA').asString := Documento.BuscaContaContabil(-1, dblcTipoRecDeb.LookupValue,dblcCentCust.LookupValue);
              If cmpContab.Valida = vcOK Then
                 Begin
                    cmpContab.Enabled    := False;
                    //dblcCentCust.Enabled := cmpContab.Conta.ObrigaCentrodeCusto;
                    dblcSubConta.Enabled := cmpContab.Conta.ObrigaSubConta;
                 End;
           End;
    End;
end;

Function TFrmLancCaixaPeq.LeTipoDesemb ( sCodArt : String ) : String;
Begin
   If FazQuery(dtmBaseDados.qry,'SELECT G.CODTIPRECDES FROM PRODUTO P, GRUPPROD G '+
                                ' WHERE (RTRIM(P.CODPRODUTO) = '''+copy(sCodArt,1,6)+''')'+
                                '   AND (P.CODGRUPOPROD = G.CODGRUPOPROD)')
   Then
       Result := Trim(dtmBaseDados.qry.FieldByName('CODTIPRECDES').asString)
   Else
       Result := '';
End;

Function TFrmLancCaixaPeq.VerifSaldoCP( idCaixaPeq : LongInt; rValor : Double ) : Boolean;
Begin
   If FazQuery(dtmBaseDados.qry,'SELECT SUM (VLRLANC) AS SALDO FROM LANCCAIXAPEQ '+
                                ' WHERE  ( IDBORDEROCXPEQ IS NULL) '+
                                '    AND (IDCAIXAPEQUENO = '+IntToStr(idCaixaPeq)+')')
   Then
       Result := (  (rValor +dtmBaseDados.qry.FieldByName('SALDO').asFloat) <= qryCPVLRTOTCAIXAPEQ.AsFloat )
   Else
       Result := True;

End;

procedure TFrmLancCaixaPeq.cmpContabExit(Sender: TObject);
begin
  inherited;
{  If ActiveControl.Tag <> 99 Then
     If cmpContab.Valida = vcOK Then
        Begin
           qryCentCust.Close;
           qryCentCust.ParamByName('pIDPESS').AsInteger   := Sistema.IdEmpresa;
           qryCentCust.ParamByName('pPLANO').AsInteger    := IntegraBack.Plano;
           qryCentCust.ParamByName('pPLACONTA').AsString  := Espaco(Trim(cmpContab.Conta.Numero),18);
           qryCentCust.Open;
        End; }
end;

end.

