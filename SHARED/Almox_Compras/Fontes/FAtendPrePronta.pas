unit FAtendPrePronta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask,
  DBCtrls, TREdit, Wwkeycb, Grids, Wwdbigrd, Wwdbgrid, wwdblook, DBTables,
  Db, Wwdatsrc, Wwquery, MontaSelect, IvDictio, IvMulti, 
  ComCtrls, wwdbdatetimepicker, CMDateTimePicker, IvEMulti;

type
  TFrmAtendPrePronta = class(TfrmOkCancelar)
    dsGrid: TwwDataSource;
    grpArtigo: TGroupBox;
    qryDet: TwwQuery;
    qryDetCODARTIGO: TStringField;
    qryDetDESCRICAO: TStringField;
    qryDetCODMEDIDA: TStringField;
    qryDetQTDEPESSOA: TFloatField;
    qryDetNDIAS: TFloatField;
    qryDetIDSCPREPRONTA: TFloatField;
    qry: TwwQuery;
    qryIDSCPREPRONTA: TFloatField;
    qryIDPESSOA: TFloatField;
    qryCODALMOXARIFADO: TFloatField;
    qryDESCSCPREPRONTA: TStringField;
    edReq: TEdit;
    Label2: TLabel;
    MontaSelect: TMontaSelect;
    btnProcurar: TBitBtn;
    Label3: TLabel;
    qryCentRespon: TwwQuery;
    qryAtividade: TwwQuery;
    lblCResp: TLabel;
    dblcCentRespon: TwwDBLookupCombo;
    lblAtiv: TLabel;
    dblcAtividade: TwwDBLookupCombo;
    qrySoli: TwwQuery;
    RgDestino: TRadioGroup;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edUnid: TDBEdit;
    Label8: TLabel;
    edCodArt: TDBEdit;
    Label9: TLabel;
    updDet: TUpdateSQL;
    qryDetNPESSOAS: TFloatField;
    qryDetQTDESUG: TFloatField;
    qryDetQTDESOLI: TFloatField;
    edNPessoa: TDBRealEdit;
    edQtdeSug: TDBRealEdit;
    edQtdeSoli: TDBRealEdit;
    qryItemSoli: TwwQuery;
    updSoli: TUpdateSQL;
    updItemSoli: TUpdateSQL;
    qrySoliNUMSOLCOMPRA: TFloatField;
    qrySoliIDPESSOA: TFloatField;
    qrySoliDATAENTREGA: TDateTimeField;
    qrySoliIDEMPRESA: TFloatField;
    qrySoliCODCENTROCUSTO: TStringField;
    qrySoliALGUMPARAESTOQUE: TStringField;
    qrySoliDATAEMISSAO: TDateTimeField;
    qrySoliSOLICIATENDIDA: TStringField;
    qrySoliSOLICIACEITA: TStringField;
    qrySoliCUSTOESTOQUE: TStringField;
    qrySoliIMPRESSO: TStringField;
    qrySoliCODCENTRORESPON: TStringField;
    qrySoliUNIDNEGOC: TFloatField;
    qrySoliCODALMOXARIFADO: TFloatField;
    qryItemSoliNUMSOLCOMPRA: TFloatField;
    qryItemSoliCODARTIGO: TStringField;
    qryItemSoliCODMEDIDA: TStringField;
    qryItemSoliQTDEPEDIDA: TFloatField;
    qryItemSoliSALDOACOMPRAR: TFloatField;
    qryItemSoliQTDEPENDENTE: TFloatField;
    qryItemSoliSOLICIACEITA: TStringField;
    BtnSCI: TBitBtn;
    qrySoliFLGPREPRONTA: TStringField;
    qryDetSALDOQTDE: TFloatField;
    chkRepete: TCheckBox;
    ToolbarSep972: TToolbarSep97;
    qryItemSoliIDITEMSOLI: TFloatField;
    lblAlmox: TLabel;
    edAlmoxa: TEdit;
    edDataEmis: TCMDateTimePicker;
    edDataNec: TCMDateTimePicker;
    Label1: TLabel;
    Label10: TLabel;
    pgc: TPageControl;
    tabDados: TTabSheet;
    TabOBS: TTabSheet;
    dbgrd: TwwDBGrid;
    memSCI: TMemo;
    qryItemSoliOBSITEMSOLIC: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure edNPessoaExit(Sender: TObject);
    procedure dbgrdExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure edQtdeSoliExit(Sender: TObject);
    procedure RgDestinoClick(Sender: TObject);
    procedure BtnSCIClick(Sender: TObject);
    procedure edNPessoaEnter(Sender: TObject);
  private
    { Private declarations }
    Procedure SelMestreDet( n : LongInt );
    Function  GeraSCI : LongInt;
  public
    { Public declarations }
  end;

var
  FrmAtendPrePronta : TFrmAtendPrePronta;
  iUltPessoa        : Integer;
implementation

{$R *.DFM}

Uses uSistema, uModulo, uMensErro, uDataBase;

Procedure TFrmAtendPrePronta.SelMestreDet( n : LongInt );
Begin
    qry.Close;
    qry.Params[0].Value := n;
    qry.Open;
    //
    qryDet.Close;
    qryDet.Params[0].Value := n;
    qryDet.Params[1].Value := Modulo.iCodAlmoxa;
    qryDet.Open;
    //
    edDataEmis.Date := Date;
    edDataNec.Date  := Date;
    memSCI.Lines.Clear;
End;

procedure TFrmAtendPrePronta.FormCreate(Sender: TObject);
begin
  inherited;
  iUltPessoa := 0;
  edAlmoxa.Text := Modulo.sAlmoxaUsuario;
  //
  SelMestreDet( -1 );
  //
  MontaSelect.Filtro.Add(' IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
  MontaSelect.Filtro.Add(' CODALMOXARIFADO = '+IntToStr(Modulo.iCodAlmoxa));
  //
  QryAtividade.Close;
  QryAtividade.ParamByName('IEMPRESA').Value  := Sistema.IdEmpresa;
  QryAtividade.Open;
  //
  qryCentRespon.Close;
  qryCentRespon.ParamByName('IDPESSOA').asInteger  := Sistema.IdEmpresa;
  qryCentRespon.ParamByName('IDUSUARIO').asInteger := Sistema.IdUsuario;
  qryCentRespon.Open;
  //
  qrySoli.Close;
  qrySoli.Params[0].Value := -1;
  qrySoli.Open;
  //
  qryItemSoli.Close;
  qryItemSoli.Params[0].Value := -1;
  qryItemSoli.Open;
  chkRepete.Checked := False;
end;

procedure TFrmAtendPrePronta.btnProcurarClick(Sender: TObject);
begin
  inherited;
    MontaSelect.Executar;
    If MontaSelect.RetornouValor Then
       Begin
           SelMestreDet( StrToInt(MontaSelect.ValoresChave[0]) );
           edReq.Text := qry.FieldByName('DESCSCPREPRONTA').asString;
           pgc.ActivePage := TabDados;
           dbgrd.SetFocus;
       End;
end;

procedure TFrmAtendPrePronta.edNPessoaExit(Sender: TObject);
begin
  inherited;
   qryDet.FieldByName('QTDESUG').asFloat  := qryDet.FieldByName('QTDEPESSOA').asFloat * edNPessoa.Value;
   qryDet.FieldByName('QTDESOLI').asFloat := qryDet.FieldByName('QTDEPESSOA').asFloat * edNPessoa.Value;
   iUltPessoa := qryDet.FieldByName('NPESSOAS').asInteger;
End;


procedure TFrmAtendPrePronta.dbgrdExit(Sender: TObject);
begin
  inherited;
  If qryDet.Active Then
    Begin
      If qryDet.EOF Then
          BtnSCI.SetFocus
      Else
         edNPessoa.SetFocus;
   End;
end;

procedure TFrmAtendPrePronta.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if qryDet.State in [dsEdit] Then
    Begin
      qryDet.Post;
      If Not qryDet.Eof Then
           qryDet.Next;
      pgc.ActivePage := TabDados;     
      dbgrd.SetFocus;
    End;
end;

Function TFrmAtendPrePronta.GeraSCI : LongInt;
Begin
  // Inclusao da S.C.
  With qrySoli Do
     Begin
          Append;
          FieldByName('NUMSOLCOMPRA').asInteger    := LeUltRegistro(nil,'SOLICOMP');
          Result := FieldByName('NUMSOLCOMPRA').asInteger ;
          FieldByName('IDPESSOA').asInteger        := Sistema.IdEmpresa;
          FieldByName('IDEMPRESA').asInteger       := Sistema.IdEmpresa;
          FieldByName('CODALMOXARIFADO').asInteger := Modulo.iCodAlmoxa;
          FieldByName('UNIDNEGOC').asInteger       := StrToInt(dblcAtividade.LookUpValue);
          FieldByName('CODCENTRORESPON').asString  := dblcCentRespon.LookUpValue;
          FieldByName('DATAENTREGA').asDateTime    := StrToDate(edDataNec.Text);
          FieldByName('DATAEMISSAO').asDateTime    := StrToDate(edDataEmis.Text);
          If RgDestino.ItemIndex = 0 Then
             FieldByName('CUSTOESTOQUE').asString  := 'E'
          Else
             FieldByName('CUSTOESTOQUE').asString   := 'C';


          FieldByName('CODCENTROCUSTO').asString   := Modulo.sCodCCusto;
          FieldByName('DATAENTREGA').asDateTime    := Date;
          FieldByName('DATAEMISSAO').asDateTime    := Date;
          FieldByName('SOLICIATENDIDA').asString   := 'T';
          FieldByName('SOLICIACEITA').asString     := 'T';
          FieldByName('IMPRESSO').asString         := 'F';
          FieldByName('FLGPREPRONTA').asString     := 'S';
          Post;
     End;
    // Inclusao dos Itens da S.C.
    With QryDet Do
        Begin
            First;
            While Not(QryDet.Eof) Do
               Begin
                   If qryDetQTDESOLI.asFloat > 0 Then
                      Begin
                          qryItemSoli.Append;
                          qryItemSoli.FieldByName('IDITEMSOLI').asInteger    := LeUltRegistro(nil,'ITEMSOLI');
                          qryItemSoli.FieldByName('NUMSOLCOMPRA').asInteger  := qrySoli.FieldByName('NUMSOLCOMPRA').asInteger;
                          qryItemSoli.FieldByName('CODARTIGO').asString      := FieldByName('CODARTIGO').asString;
                          qryItemSoli.FieldByName('CODMEDIDA').asString      := FieldByName('CODMEDIDA').asString;
                          qryItemSoli.FieldByName('SALDOACOMPRAR').asFloat   := qryDetQTDESOLI.Value;
                          qryItemSoli.FieldByName('QTDEPEDIDA').asFloat      := qryDetQTDESOLI.Value;
                          qryItemSoli.FieldByName('QTDEPENDENTE').asFloat    := qryDetQTDESOLI.Value;
                          qryItemSoli.FieldByName('SOLICIACEITA').asString   := 'N';
                          qryItemSoli.FieldByName('OBSITEMSOLIC').asString   := memSCI.text;
                          qryItemSoli.Post;
                      End;
                   Next;
               End;
        End;
End;

procedure TFrmAtendPrePronta.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  qryDet.Cancel;
end;

procedure TFrmAtendPrePronta.edQtdeSoliExit(Sender: TObject);
begin
  inherited;
   If chkRepete.Checked Then
     Begin
         While Not qryDet.EOF Do
            Begin
                qryDet.Edit;
                qryDet.FieldByName('QTDESUG').asFloat  := qryDet.FieldByName('QTDEPESSOA').asFloat * iUltPessoa;
                qryDet.FieldByName('QTDESOLI').asFloat := qryDet.FieldByName('QTDEPESSOA').asFloat * iUltPessoa;
                qryDet.FieldByName('NPESSOAS').asFloat := iUltPessoa;
                qryDet.Next;
            End;
     End
   Else
     qryDet.Edit;
end;

procedure TFrmAtendPrePronta.RgDestinoClick(Sender: TObject);
begin
  inherited;
  If RgDestino.ItemIndex = 0 Then
     Begin
         lblAlmox.Caption := 'Almoxarifado';
         edAlmoxa.Text    := Modulo.sAlmoxaUsuario;
     End
  Else
     Begin
         lblAlmox.Caption := 'Centro de Custo';
         edAlmoxa.Text := Modulo.sDescCCusto;
     End
end;

procedure TFrmAtendPrePronta.BtnSCIClick(Sender: TObject);
Var
   nSCI : LongInt;
begin
  inherited;
  If trim(dblcCentRespon.text) = '' Then
     Begin
        MsgDlg('Centro de Responsabilidade não foi preenchida','Erro',mtError,[mbOK],0);
        dblcCentRespon.SetFocus;
        Exit;
     End;
  If trim(edDataEmis.text) = '' Then
     Begin
        MsgDlg('Data de emissão não foi preenchida','Erro',mtError,[mbOK],0);
        edDataEmis.SetFocus;
        Exit;
     End;
  If trim(edDataNec.text) = '' Then
     Begin
        MsgDlg('Data de necessidade não foi preenchida','Erro',mtError,[mbOK],0);
        edDataNec.SetFocus;
        Exit;
     End;
  If edDataNec.Date < edDataEmis.Date Then
     Begin
        MsgDlg('Data de necessidade não pode ser menor que data de emissão','Erro',mtError,[mbOK],0);
        edDataNec.SetFocus;
        Exit;
     End;
  If trim(dblcCentRespon.text) = '' Then
     Begin
        MsgDlg('Centro de Responsabilidade não foi preenchida','Erro',mtError,[mbOK],0);
        dblcCentRespon.SetFocus;
        Exit;
     End;     
  nSCI :=  GeraSCI;
  If qryItemSoli.IsEmpty Then
     Begin
        MsgDlg('Não há itens para serem gravados. Estão com quantidade zero','Erro',mtError,[mbOK],0);
        Exit;
     End;
   try
       AplicaAlteracoes([qrySoli,qryItemSoli]);
       MsgDlg('Nº da SCI '+ IntToStr(nSCI),'Informação',mtInformation,[mbOk],0);
   except
       MsgDlg('Erro na gravação','Erro',mtError,[mbOK],0);
       exit;
   end;
   SelMestreDet( -1 );
   qrySoli.Close;
   qrySoli.Params[0].Value := -1;
   qrySoli.Open;
   //
   qryItemSoli.Close;
   qryItemSoli.Params[0].Value := -1;
   qryItemSoli.Open;
   edReq.Text := '';
end;

procedure TFrmAtendPrePronta.edNPessoaEnter(Sender: TObject);
begin
  inherited;
  qryDet.Edit;
  qryDet.FieldByName('NPessoas').asInteger := iUltPessoa;
  edNPessoa.Value := iUltPessoa;
  edNPessoa.Text  := intToStr(iUltPessoa);
  edNPessoa.SelectAll;
end;

end.
