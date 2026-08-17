unit FProdCasa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Tabs, TREdit, wwdblook, Db, DBTables,
  Wwquery, DBCtrls, Wwdatsrc, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmProdCasa = class(TfrmSairAjuda)
    TabTipo: TTabSet;
    qryArtigo: TwwQuery;
    qryFichaTec: TwwQuery;
    qryFichaTecCODARTIGOSEC: TStringField;
    qryFichaTecQTDE: TFloatField;
    qryFichaTecCODMEDIDA: TStringField;
    qryFichaTecCUSTOMEDIO: TFloatField;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    dblcItem: TwwDBLookupCombo;
    dblcDesc: TwwDBLookupCombo;
    dblcUN: TwwDBLookupCombo;
    edQtde: TRealEdit;
    RgArtEleb: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    dblcItemEleb: TwwDBLookupCombo;
    dblcDescEleb: TwwDBLookupCombo;
    dblcUNEleb: TwwDBLookupCombo;
    edQtdeEleb: TRealEdit;
    Panel1: TPanel;
    Img: TImage;
    qryCCust: TwwQuery;
    qryAlmox: TwwQuery;
    Label9: TLabel;
    dblcAlmox: TwwDBLookupCombo;
    edData: TCMDateTimePicker;
    Label13: TLabel;
    Label14: TLabel;
    edNumReq: TRealEdit;
    Label10: TLabel;
    edAlmox: TEdit;
    Bevel1: TBevel;
    edSaldo: TRealEdit;
    Label11: TLabel;
    DBText1: TDBText;
    qryAlmoxCODALMOXARIFADO: TFloatField;
    qryAlmoxDESCALMOX: TStringField;
    qryAlmoxPRINCIPSECUND: TStringField;
    qryAlmoxCODCENTROCUSTO: TStringField;
    qryArtigoCODARTIGO: TStringField;
    qryArtigoCODMEDCUSTO: TStringField;
    qryArtigoDESCRICAO: TStringField;
    dsArtigo: TwwDataSource;
    qryUnidMed: TwwQuery;
    qryUnidMedCODMEDIDA: TStringField;
    qryUnidMedDESCMEDIDA: TStringField;
    qryArtEleb: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    qryUnidMedEleb: TwwQuery;
    StringField4: TStringField;
    StringField5: TStringField;
    qryArtigoCUSTOMEDIO: TFloatField;
    btnBaixar: TBitBtn;
    BtnLimpar: TBitBtn;
    qryUnidNegoc: TwwQuery;
    dblcAtiv: TwwDBLookupCombo;
    Label12: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcItemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcDescCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcItemElebCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcDescElebCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnBaixarClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure edQtdeExit(Sender: TObject);
    procedure TabTipoClick(Sender: TObject);
  private
    { Private declarations }
    Procedure SetTipo( n : Integer );
    Procedure SetArtigo( n : Integer );
    Procedure SelUnid( S : String );
    Procedure SelUnidEleb( S : String );
    Procedure FazBaixa( n : Integer );
  public
    { Public declarations }
  end;

var
  FrmProdCasa: TFrmProdCasa;

implementation

{$R *.DFM}

Uses uModulo,uSistema,UConversaoMed, uMensErro,uDataBase,
     uMovNew, DbaseDados;

Procedure TFrmProdCasa.SetTipo( n : Integer );
Begin
    Img.Visible       := (n = 1);
    RgArtEleb.Visible := (n = 1);
    If n < 0 Then
       SetArtigo( 0 )
    Else
       SetArtigo( n );
End;

Procedure TFrmProdCasa.SetArtigo( n : Integer );
Begin
    Case n Of
      0 : Begin
             qryArtigo.Sql.Clear;
             qryArtigo.Sql.Add(' SELECT                                                                       ');
             qryArtigo.Sql.Add('       A.CODARTIGO,                                                           ');
             qryArtigo.Sql.Add('       P.CODMEDCUSTO,                                                         ');
             qryArtigo.Sql.Add('      (P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR) AS DESCRICAO,');
             qryArtigo.Sql.Add('       (0) AS CUSTOMEDIO                                                      ');
             qryArtigo.Sql.Add(' FROM                                                                         ');
             qryArtigo.Sql.Add('      ARTIGO A,                                                               ');
             qryArtigo.Sql.Add('      PRODUTO P,                                                              ');
             qryArtigo.Sql.Add('      FICHTECN FT                                                             ');
             qryArtigo.Sql.Add(' WHERE         ');
             qryArtigo.Sql.Add('        (((A.FLGBLOQUEADO <> ''R'') AND (A.FLGBLOQUEADO <> ''A'')) OR (A.FLGBLOQUEADO IS NULL)) ');
             qryArtigo.Sql.Add('    AND (A.FLGATIVO = ''S'') ');
             qryArtigo.Sql.Add('    AND (A.CODPRODUTO = P.CODPRODUTO)                                         ');
             qryArtigo.Sql.Add('    AND (A.CODARTIGO = FT.CODARTIGOPRINC)                                     ');
             qryArtigo.Sql.Add(' GROUP BY                                                                     ');
             qryArtigo.Sql.Add('        A.CODARTIGO,                                                          ');
             qryArtigo.Sql.Add('        P.CODMEDCUSTO,                                                        ');
             qryArtigo.Sql.Add('       (P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR)             ');
             qryArtigo.Sql.Add(' ORDER BY DESCRICAO                                                           ');
             qryArtigo.Open;
         End;
       1 : Begin
              qryArtigo.Close;
              qryArtigo.Sql.Clear;
              qryArtigo.Sql.Add(' SELECT                                                                       ');
              qryArtigo.Sql.Add('       A.CODARTIGO,                                                           ');
              qryArtigo.Sql.Add('       P.CODMEDCUSTO,                                                         ');
              qryArtigo.Sql.Add('      (P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR) AS DESCRICAO,');
              qryArtigo.Sql.Add('       C.CUSTOMEDIO                                                           ');
              qryArtigo.Sql.Add(' FROM                                                                         ');
              qryArtigo.Sql.Add('      ARTIGO A,                                                               ');
              qryArtigo.Sql.Add('      PRODUTO P,                                                              ');
              qryArtigo.Sql.Add('      CUSTOMED C                                                              ');
              qryArtigo.Sql.Add(' WHERE                                                                        ');
              qryArtigo.Sql.Add('     (((A.FLGBLOQUEADO <> ''R'') AND (A.FLGBLOQUEADO <> ''A'')) OR (A.FLGBLOQUEADO IS NULL)) ');
              qryArtigo.Sql.Add('    AND (A.FLGATIVO = ''S'') ');
              qryArtigo.Sql.Add(' AND (C.CODCUSTEIO = '+IntToStr(Modulo.LeUnCusteio(Modulo.iCodAlmoxa))+')     ');
              qryArtigo.Sql.Add(' AND (A.CODPRODUTO = P.CODPRODUTO)                                            ');
              qryArtigo.Sql.Add(' AND (A.CODARTIGO = C.CODARTIGO)                                              ');
              qryArtigo.Sql.Add(' ORDER BY DESCRICAO                                                           ');
              qryArtigo.Open;
           End;
    End;
End;

procedure TFrmProdCasa.FormShow(Sender: TObject);
begin
  inherited;
  SetTipo(-1);
end;

procedure TFrmProdCasa.FormCreate(Sender: TObject);
begin
  inherited;
  edAlmox.Text := Modulo.sAlmoxaUsuario;
  edData.Date  := Date;
  qryAlmox.Close;
  qryAlmox.Params[0].AsInteger := Sistema.IdEmpresa;
  qryAlmox.Open;
  //
  qryArtEleb.Open;
  //
  dblcAlmox.LookUpValue := IntToStr(Modulo.iCodAlmoxa );
  //
  qryUnidNegoc.Close;
  qryUnidNegoc.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryUnidNegoc.Open;
end;

procedure TFrmProdCasa.dblcItemCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If Trim(dblcItem.Text) <> '' Then
    Begin
       dblcDesc.LookUpValue := dblcItem.LookUpValue;
        edSaldo.Value := MovNew.InfoSaldo(Trim(dblcItem.LookUpValue),Modulo.iCodAlmoxa,edData.Date );
       SelUnid(dblcItem.LookUpValue );
    End;
end;

procedure TFrmProdCasa.dblcDescCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
 If Trim(dblcDesc.Text) <> '' Then
    Begin
       dblcItem.LookUpValue := dblcDesc.LookUpValue;
       edSaldo.Value := MovNew.InfoSaldo(Trim(dblcDesc.LookUpValue),Modulo.iCodAlmoxa,edData.Date );
       SelUnid(dblcDesc.LookUpValue );
    End;
end;

procedure TFrmProdCasa.dblcItemElebCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If Trim(dblcItemEleb.Text) <> '' Then
    Begin
       dblcDescEleb.LookUpValue := dblcItemEleb.LookUpValue;
       SelUnidEleb(dblcItemEleb.LookUpValue );
    End;
end;


procedure TFrmProdCasa.dblcDescElebCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If Trim(dblcDescEleb.Text) <> '' Then
    Begin
       dblcItemEleb.LookUpValue := dblcDescEleb.LookUpValue;
       SelUnidEleb(dblcDescEleb.LookUpValue );
    End;
end;

Procedure TFrmProdCasa.SelUnid( S : String );
Begin
    qryUnidMed.Close;
    qryUnidMed.Params[0].asString := Copy(s,1,6);
    qryUnidMed.Open;
End;

Procedure TFrmProdCasa.SelUnidEleb( S : String );
Begin
    qryUnidMedEleb.Close;
    qryUnidMedEleb.Params[0].asString := Copy(s,1,6);
    qryUnidMedEleb.Open;
End;

Procedure TFrmProdCasa.FazBaixa( n : Integer );
Var
   rValor   : Double;
   rQtde    : Double;
   iMov     : LongInt;
   iMovS    : LongInt;
   sMovList : String;
Begin
    Try
       StartTransacao;
       Case n Of
           0 : Begin // Baixa de Ficha técnica
                  //--------------------------------------------------------------------------------
                  // Saida dos Artigos que compoem o Item da Ficha Técnica
                  //--------------------------------------------------------------------------------
                  qryFichaTec.Close;
                  qryFichaTec.ParamByName('pCODARTIGO').asString   := Trim(dblcItem.LookupValue);
                  qryFichaTec.ParamByName('pCODCUSTEIO').AsInteger := Modulo.LeUnCusteio(Modulo.iCodAlmoxa);
                  qryFichaTec.Open;
                  qryFichaTec.First;
                  rValor   := 0;
                  sMovList := '(';
                  While Not qryFichaTec.EOF Do
                     Begin
                        rQtde := ConversaoMed.ConverteQtdeUnCM(qryFichaTecCODARTIGOSEC.AsString,
                                                               qryFichaTecCODMEDIDA.AsString,
                                                               qryFichaTecQTDE.AsFloat * edQtde.Value);
                        rValor := rValor + (rQtde * qryFichaTecCUSTOMEDIO.AsFloat);
                        iMov := MovNew.GeraMov('S',
                                               rQtde * qryFichaTecCUSTOMEDIO.AsFloat,
                                               (qryFichaTecQTDE.AsFloat * edQtde.Value),
                                               Modulo.iCodCusteio,
                                               Modulo.iCodAlmoxa,
                                               qryFichaTecCODARTIGOSEC.AsString,
                                               '',
                                               'O',
                                               qryFichaTecCODMEDIDA.AsString,
                                               '',
                                               edData.Text,
                                               FloatToStr(EdNumReq.Value),
                                               qryAlmoxCODCENTROCUSTO.AsString,
                                               Sistema.IdEmpresa,
                                               strToInt(dblcAlmox.LookUpValue),
                                               strToInt(dblcAtiv.LookUpValue) );
                        if iMov = -1 then
                           Abort;
                        sMovList := sMovList + IntToStr(iMov)+',';
                        qryFichaTec.Next;
                     End;
                     sMovList := Copy(sMovList,1,length(sMovList)-1) +')';
                  //--------------------------------------------------------------------------------
                  // Entrada do Artigo Principal da Ficha Técnica
                  //--------------------------------------------------------------------------------
                     iMov := MovNew.GeraMov('E',
                                             rValor,
                                             edQtde.Value,
                                             Modulo.LeUnCusteio(strToInt(dblcAlmox.LookUpValue)),
                                             strToInt(dblcAlmox.LookUpValue),
                                             dblcItem.LookupValue,
                                             '',
                                             'C',
                                             dblcUN.LookupValue,
                                             '',
                                             edData.Text,
                                             FloatToStr(EdNumReq.Value),
                                             qryAlmoxCODCENTROCUSTO.AsString,
                                             Sistema.IdEmpresa,
                                             Modulo.iCodAlmoxa,
                                             strToInt(dblcAtiv.LookUpValue) );
                     If iMov = -1 then
                        Abort;
                     // Atualiza os Movimentos de Saida dos produtos que o compoem
                     If Not ExecutarQuery(DtmBaseDados.qry,'UPDATE MOVIMENT SET IDMOVENTRADA = '+IntToStr(iMov)+' WHERE ( IDMOV IN'+sMovList+')') Then
                        Abort;
               End;
          1 : Begin // Baixa de Item
                  //--------------------------------------------------------------------------------
                  // Saida do Artigo
                  //--------------------------------------------------------------------------------
                 rQtde := ConversaoMed.ConverteQtdeUnCM(dblcItem.LookupValue, dblcUN.LookupValue, edQtde.Value);
                 iMovS := MovNew.GeraMov('S',
                                        rQtde * qryArtigoCUSTOMEDIO.AsFloat,
                                        edQtde.Value ,
                                        Modulo.iCodCusteio,
                                        Modulo.iCodAlmoxa,
                                        dblcItem.LookupValue,
                                        '',
                                        'O',
                                        dblcUN.LookupValue,
                                        '',
                                        edData.Text,
                                        FloatToStr(EdNumReq.Value),
                                        qryAlmoxCODCENTROCUSTO.AsString,
                                        Sistema.IdEmpresa,
                                        strToInt(dblcAlmox.LookUpValue),
                                        strToInt(dblcAtiv.LookUpValue) );
                 if iMovS = -1 then
                    Abort;
                  //--------------------------------------------------------------------------------
                  // Entrada do Artigo Elaborado
                  //--------------------------------------------------------------------------------
                 iMov := MovNew.GeraMov('E',
                                        rQtde * qryArtigoCUSTOMEDIO.AsFloat,
                                        edQtdeEleb.Value ,
                                        Modulo.LeUnCusteio(strToInt(dblcAlmox.LookUpValue)),
                                        strToInt(dblcAlmox.LookUpValue),
                                        dblcItemEleb.LookupValue,
                                        '',
                                        'C',
                                        dblcUN.LookupValue,
                                        '',
                                        edData.Text,
                                        FloatToStr(EdNumReq.Value),
                                        qryAlmoxCODCENTROCUSTO.AsString,
                                        Sistema.IdEmpresa,
                                        Modulo.iCodAlmoxa,
                                        strToInt(dblcAtiv.LookUpValue) );
                 if iMov = -1 then
                    Abort;
                 MovNew.UpdMov(iMovS, iMov,-1 );
              End;
       End;
       CommitTransacao;
       MsgDlg('Baixa realizada com sucesso','Informação',mtInformation,[mbOK],0);
    Except
       RollBackTransacao;
       Raise;
       MsgDlg('Baixa não realizada','Erro',mtError,[mbOK],0);
    End;

End;

procedure TFrmProdCasa.btnBaixarClick(Sender: TObject);
begin
  inherited;
   If (trim(dblcAlmox.Text) = '')  Then
      Begin
         MsgDlg('Almoxarifado Destino não foi preenchido','Erro',mtError,[mbOk],0);
         dblcAlmox.SetFocus;
      End
   Else
   If EdNumReq.Value = 0 Then
      Begin
         MsgDlg('Número da baixa não foi preenchido','Erro',mtError,[mbOk],0);
         EdNumReq.SetFocus;
      End
   Else
   If Trim(EdData.Text) = '' Then
      Begin
         MsgDlg('Data de baixa não foi preenchida','Erro',mtError,[mbOk],0);
         EdData.SetFocus;
      End
   Else
   If (trim(dblcAtiv.Text) = '') Then
     Begin
        MsgDlg('Atividade/Projeto não foi preenchido','Erro',mtError,[mbOk],0);
        dblcAtiv.SetFocus;
     End
   Else
   If Trim(dblcItem.Text) = '' Then
      Begin
         MsgDlg('Artigo elaborado não foi preenchida','Erro',mtError,[mbOk],0);
         dblcItem.SetFocus;
      End
   Else
   If Trim(dblcUN.Text) = '' Then
      Begin
         MsgDlg('Unidade de medida do artigo  não foi preenchida','Erro',mtError,[mbOk],0);
         dblcUN.SetFocus;
      End
   Else
   If edQtde.Value <= 0 Then
      Begin
         MsgDlg('Quantidade do artigo elaborado baixa não foi preenchida','Erro',mtError,[mbOk],0);
         edQtdeEleb.SetFocus;
      End
   Else
   If (Not RgArtEleb.Visible) And (Format('%17.5',[edSaldo.Value]) < Format('%17.5',[edQtde.Value]) ) Then
      Begin
         MsgDlg('Quantidade do artigo elaborado baixa não foi preenchida','Erro',mtError,[mbOk],0);
         edQtde.SetFocus;
      End
   Else
   If ( RgArtEleb.Visible ) And (Trim(dblcItemEleb.Text) = '') Then
      Begin
         MsgDlg('Artigo elaborado não foi preenchida','Erro',mtError,[mbOk],0);
         dblcItemEleb.SetFocus;
      End
   Else
   If ( RgArtEleb.Visible ) And (Trim(dblcUNEleb.Text) = '') Then
      Begin
         MsgDlg('Unidade de medida do artigo elaborado não foi preenchida','Erro',mtError,[mbOk],0);
         dblcUNEleb.SetFocus;
      End
   Else
   If ( RgArtEleb.Visible ) And (edQtdeEleb.Value <= 0) Then
      Begin
         MsgDlg('Quantidade do artigo elaborado baixa não foi preenchida','Erro',mtError,[mbOk],0);
         edQtdeEleb.SetFocus;
      End
   Else
      Begin
         FazBaixa( tabTipo.TabIndex );
         BtnLimpar.Click;
      End;
end;

procedure TFrmProdCasa.BtnLimparClick(Sender: TObject);
begin
  inherited;
  edData.Date    := Date;
  edNumReq.Value := 0;
  dblcAlmox.Clear;
  dblcItem.Clear;
  dblcDesc.Clear;
  edSaldo.Clear;
  edQtde.Clear;
  dblcUN.Clear;
  If RgArtEleb.Visible Then
     Begin
        dblcItemEleb.Clear;
        dblcDescEleb.Clear;
        edQtdeEleb.Clear;
        dblcUNEleb.Clear;
     End;
end;

procedure TFrmProdCasa.edQtdeExit(Sender: TObject);
Var
   rQtde : Double;
begin
  inherited;
  //
  If RgArtEleb.Visible Then
     Begin
        rQtde := ConversaoMed.ConverteSaldoQtde(dblcItem.LookUpValue,
                                                dblcUn.LookUpValue,
                                                qryArtigoCODMEDCUSTO.AsString,
                                                edQtde.Value);
        If Format('%17.5f',[rQtde]) > Format('%17.5f',[edSaldo.Value]) Then
           Begin
              MsgDlg('Quantidade solicitado maior que a quantidade disponível','Erro',mtError,[mbOk],0);
              edQtde.Clear;
              edQtde.SetFocus;
          End;
     End;
end;

procedure TFrmProdCasa.TabTipoClick(Sender: TObject);
begin
  inherited;
      SetTipo(TabTipo.TabIndex);
end;

end.
