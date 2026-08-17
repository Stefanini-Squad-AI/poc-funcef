unit FBaixaPerda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, DBCtrls, wwdblook, TREdit, Db, DBTables,
  Wwquery, Wwdatsrc, CMDBLookupCombo, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmBaixaPerda = class(TfrmSairAjuda)
    BtnBaixa: TBitBtn;
    pnlDet: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edQtde: TRealEdit;
    dblcUN: TwwDBLookupCombo;
    DbUN: TDBEdit;
    dblcDesc: TwwDBLookupCombo;
    dblcItem: TwwDBLookupCombo;
    edValb: TRealEdit;
    qryArtigo: TwwQuery;
    dblcPerda: TCMDBLookupCombo;
    Label1: TLabel;
    qryPerda: TwwQuery;
    qryUnidMed: TwwQuery;
    qryUnidMedCODMEDIDA: TStringField;
    qryUnidMedDESCMEDIDA: TStringField;
    qrySaldo: TwwQuery;
    lbALmox: TLabel;
    edAlmox: TEdit;
    dbSaldo: TDBRealEdit;
    dsArtigo: TwwDataSource;
    dsSaldo: TwwDataSource;
    Label2: TLabel;
    Label13: TLabel;
    edData: TCMDateTimePicker;
    Label14: TLabel;
    edNumReq: TRealEdit;
    qryAux: TwwQuery;
    qryCusto: TwwQuery;
    Label3: TLabel;
    dblcAtiv: TwwDBLookupCombo;
    qryUnidNegoc: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure dblcDescCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcItemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure BtnBaixaClick(Sender: TObject);
    procedure edQtdeExit(Sender: TObject);
  private
    { Private declarations }
      Procedure SelSaldo( S : String );
      Procedure SelUnid( S : String );
      Function  SelCusto( s : String ) : Double;
      Function GerarBaixa : Boolean;
      Procedure Limpa;
  public
    { Public declarations }
    rQtde : Double;
  end;

var
  FrmBaixaPerda: TFrmBaixaPerda;

implementation

{$R *.DFM}
Uses uSistema, uDataBase, uModulo, uMensErro, uString, UConversaoMed,
     uMovNew;

Procedure TFrmBaixaPerda.Limpa;
Begin
    dblcPerda.Text := '';
    edNumReq.Value := 0;
    dblcItem.Text  := '';
    dblcDesc.Text  := '';
    dblcUN.Text    := '';
    dbSaldo.Value  := 0;
    DbUN.Text      := '';
    edValb.Value   := 0;
    edQtde.Value   := 0;
End;

Procedure TFrmBaixaPerda.SelSaldo( S : String );
Begin
    qrySaldo.Close;
    qrySaldo.ParambyName('pCODART').asString    := S;
    qrySaldo.ParambyName('pCODALMOX').asFloat   := Modulo.iCodAlmoxa;
    qrySaldo.ParambyName('pIDPESS').asFloat     := Sistema.IdEmpresa;
    qrySaldo.Open;
End;

Procedure TFrmBaixaPerda.SelUnid( S : String );
Begin
   qryUnidMed.Close;
   qryUnidMed.Params[0].asString := Copy(s,1,6);
   qryUnidMed.Open;
End;

procedure TFrmBaixaPerda.FormCreate(Sender: TObject);
begin
  inherited;
  limpa;
  qryPerda.Open;
  qryArtigo.Open;
  edAlmox.Text := Modulo.sAlmoxaUsuario;
  edData.Date  := Date;
  //
  qryUnidNegoc.Close;
  qryUnidNegoc.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryUnidNegoc.Open;
end;

procedure TFrmBaixaPerda.dblcDescCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If dblcDesc.Modified Then
     Begin
        dblcItem.LookUpValue := dblcDesc.LookUpValue;
        dblcDesc.LookUpValue := dblcItem.LookUpValue;
        SelSaldo( espaco(dblcDesc.LookUpValue,14) );
        SelUnid(dblcDesc.LookUpValue );
     End;
end;

procedure TFrmBaixaPerda.dblcItemCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If dblcItem.Modified Then
    Begin
       dblcDesc.LookUpValue := dblcItem.LookUpValue;
       dblcItem.LookUpValue := dblcDesc.LookUpValue;
       SelSaldo( espaco(dblcDesc.LookUpValue,14) );
       SelUnid(dblcItem.LookUpValue );
    End;
end;

Function TFrmBaixaPerda.GerarBaixa : Boolean;
Var
   iMov : LongInt;
Begin
    Result := True;
    iMov := MovNew.GeraMov('S',
                            edValb.Value,
                            edQtde.Value,
                            Modulo.iCodCusteio,
                            Modulo.iCodAlmoxa,
                            dblcItem.LookUpValue,
                            '',
                            'I',
                            dblcUN.LookUpValue,
                            '',
                            DateToStr(edData.Date),
                            FloatToStr(EdNumReq.Value),
                            Modulo.sCCustoAlmoxa,
                            Sistema.IdEmpresa,-1,
                            strToInt(dblcAtiv.LookUpValue) );
    If iMov < 0 Then
        Result := False;
    With qryAux Do
      Begin
           Close;
           Sql.Text := ' UPDATE MOVIMENT SET '+
                       ' IDTIPOPERDA = '+dblcPerda.LookupValue +''+
                       ' WHERE ( IDMOV = '+IntToStr( iMov )+')';
           ExecSQl;
      End;
End;

Function TFrmBaixaPerda.SelCusto( s : String ) : Double;
Begin
  qryCusto.Close;
  qryCusto.ParamByName('pCODART').asString   := S;
  qryCusto.ParamByName('pCODCUST').asInteger := Modulo.icodCusteio;
  qryCusto.Open;
  SelCusto := qryCusto.FieldByName('CUSTOMEDIO').AsFloat * rQtde;
End;

procedure TFrmBaixaPerda.edQtdeExit(Sender: TObject);
begin
  inherited;
  rQtde := ConversaoMed.ConverteSaldoQtde(dblcItem.LookUpValue,
                                          dblcUn.LookUpValue,
                                          dbUn.Text,
                                          edQtde.Value);
  If Format('%17.5f',[rQtde]) > Format('%17.5f',[dbSaldo.Value]) Then
     Begin
        MsgDlg('Quantidade solicitado maior que a quantidade disponível','Erro',mtError,[mbOk],0);
        edQtde.Clear;
        edQtde.SetFocus;
     End
  Else
   edValB.Value :=  SelCusto(dblcItem.LookUpValue);
end;

procedure TFrmBaixaPerda.BtnBaixaClick(Sender: TObject);
begin
  inherited;
   If Trim(dblcPerda.Text) = '' Then
      Begin
         MsgDlg('Tipo de perda não foi preenchida','Erro',mtError,[mbOk],0);
         dblcPerda.SetFocus;
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
         MsgDlg('Artigo não foi preenchida','Erro',mtError,[mbOk],0);
         dblcItem.SetFocus;
      End
   Else
   If Trim(dblcUN.Text) = '' Then
     Begin
         MsgDlg('Unidade de medida não foi preenchida','Erro',mtError,[mbOk],0);
         dblcUN.SetFocus;
     End
   Else
   If EdNumReq.Value = 0 Then
      Begin
         MsgDlg('Número da requisição não foi preenchido','Erro',mtError,[mbOk],0);
         EdNumReq.SetFocus;
      End
   Else
   If edQtde.Value = 0 Then
      Begin
         MsgDlg('Quatidade baixada não foi preenchido','Erro',mtError,[mbOk],0);
         edQtde.SetFocus;
      End
   Else
   If Trim(EdData.Text) = '' Then
      Begin
         MsgDlg('Data de requisição não foi preenchida','Erro',mtError,[mbOk],0);
         EdData.SetFocus;
      End
   Else
      Begin
         try
           StartTransacao;
           If Not GerarBaixa Then
             Abort;
           CommitTransacao;
           MsgDlg('Baixa realizado com sucesso','Informação',mtInformation,[mbOk],0);
         except
            RollbackTransacao;
            MsgDlg('Baixa não foi realizado','Erro',mtError,[mbOk],0);
         end;
      End;
      Limpa;
end;

end.
