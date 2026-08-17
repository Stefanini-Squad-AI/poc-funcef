unit FAlteraCustoMed;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MontaSelect, Db, Wwdatsrc, DBTables, Wwquery, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, TREdit, Mask, {DBCtrlt} IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker, DBCtrls, wwdblook;

type
  TFrmAlteraCustoMed = class(TfrmSairAjuda)
    qry: TwwQuery;
    qryCODCUSTEIO: TFloatField;
    qryCODARTIGO: TStringField;
    qryCUSTOMEDIO: TFloatField;
    qrySALDOQTDEUC: TFloatField;
    qryVALOR: TFloatField;
    qryDESCRICAO: TStringField;
    qryCODMEDCUSTO: TStringField;
    ds: TwwDataSource;
    MontaSelect: TMontaSelect;
    Label1: TLabel;
    edUnCusteio: TEdit;
    lbALmox: TLabel;
    edAlmox: TEdit;
    GrpArt: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EdArtigo: TDBEdit;
    edDesc: TDBEdit;
    edUnid: TDBEdit;
    edCustoMed: TDBRealEdit;
    edSaldoUC: TDBRealEdit;
    edValor: TDBRealEdit;
    BtnAltCM: TBitBtn;
    upd: TUpdateSQL;
    btnProcurar: TBitBtn;
    edNumReq: TRealEdit;
    edData: TCMDateTimePicker;
    Label8: TLabel;
    Label9: TLabel;
    qryUnidNegoc: TwwQuery;
    Label10: TLabel;
    dblcAtiv: TwwDBLookupCombo;
    procedure btnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnAltCMClick(Sender: TObject);
    procedure edCustoMedExit(Sender: TObject);
    procedure edCustoMedEnter(Sender: TObject);
  private
    { Private declarations }

   Procedure Sel ( s : String );
   Function ConvertValor( rValor : Double; sCodArt : String ) : Double;
  public
    { Public declarations }
  end;

var
  FrmAlteraCustoMed: TFrmAlteraCustoMed;

implementation

{$R *.DFM}

Uses uMovNew,uMEnsErro, uDataBase, DBaseDados, uModulo, uSistema;

Procedure TFrmAlteraCustoMed.Sel ( s : String );
Begin
   edNumReq.Value := 0;
   qry.Close;
   qry.ParamByName('pCODCUSTEIO').asFloat := Modulo.iCodCusteio;
   qry.ParamByName('pCODART').asString    := S;
   qry.Open;
End;

procedure TFrmAlteraCustoMed.btnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  If MontaSelect.RetornouValor Then
    begin
       Sel(MontaSelect.ValoresChave[0]);
       edCustoMed.SetFocus;
    End;
end;
Function TFrmAlteraCustoMed.ConvertValor( rValor : Double; sCodArt : String ) : Double;
Begin
   If Fazquery(DtmBaseDados.qry,'SELECT (SALDOQTDEUC * CUSTOMEDIO ) AS VLR FROM CUSTOMED WHERE (CODCUSTEIO = '+ IntToStr(Modulo.iCodCusteio)+')'+
                                                                                 ' AND (RTRIM(CODARTIGO) = '''+sCodArt+''')') then
      ConvertValor := rValor - DtmBaseDados.qry.FieldByName('VLR').asFloat
   Else
      ConvertValor := 0;
End;

procedure TFrmAlteraCustoMed.FormCreate(Sender: TObject);
begin
  inherited;
  Fazquery(DtmBaseDados.qry,'SELECT DESCCUSTEIO FROM UNCUSTEI WHERE (CODCUSTEIO = '+ IntToStr(Modulo.iCodCusteio)+') ');
  edUnCusteio.Text := DtmBaseDados.qry.FieldByName('DESCCUSTEIO').asString;
  edAlmox.Text     := Modulo.sAlmoxaUsuario;
  If Modulo.LeDataRepresa > Date Then
     edData.Date := Date
  Else
     edData.Date := Modulo.LeDataRepresa;
  Sel('');
  MontaSelect.Filtro.Add(' CUSTOMED.CODCUSTEIO = ' + IntToStr(Modulo.iCodCusteio));
  //
  qryUnidNegoc.Close;
  qryUnidNegoc.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryUnidNegoc.Open;
end;

procedure TFrmAlteraCustoMed.BtnAltCMClick(Sender: TObject);
Var
   rVal : Double;
begin
  inherited;
  rVal := ConvertValor(edValor.Value,qry.FieldByName('CodArtigo').AsString);
  If rVal = 0 Then
    Begin
       MsgDlg('Artigo não possui saldo','Erro',mtError,[mbOk],0);
    End
  Else
  If EdNumReq.Value = 0 Then
    begin
        MsgDlg('Número da requisição não preenchido','Erro',mtError,[mbOk],0);
        edNumReq.SetFocus;
    End
  Else
  If Trim(edData.Text) = '' Then
    begin
        MsgDlg('Data não preenchido','Erro',mtError,[mbOk],0);
        edData.SetFocus;
    End
  Else
  If edData.Date > Date Then
    begin
        MsgDlg('Data não pode ser maior que a data de hoje','Erro',mtError,[mbOk],0);
        edData.SetFocus;
    End
  Else
  If edData.Date > Modulo.LeDataRepresa Then
    begin
        MsgDlg('Data não pode ser maior que a data de represamento','Erro',mtError,[mbOk],0);
        edData.SetFocus;
    End
  Else  
  If (trim(dblcAtiv.Text) = '') Then
     Begin
        MsgDlg('Atividade/Projeto não foi preenchido','Erro',mtError,[mbOk],0);
        dblcAtiv.SetFocus;
     End
  Else
    Begin
        try
           StartTransacao;
           If MovNew.GeraMov('E',
                             rVal,
                             0,
                             Modulo.iCodCusteio,
                             Modulo.iCodAlmoxa,
                             qry.FieldByName('CodArtigo').AsString,
                             '',
                             'b',
                             qry.FieldByName('CODMEDCUSTO').AsString,
                             '',
                             edData.text,
                             edNumReq.Text,
                             Modulo.sCCustoAlmoxa,
                             Sistema.IdEmpresa,-1,
                              strToInt(dblcAtiv.LookUpValue) ) < 0
           Then
              Abort;
           CommitTransacao;
           MsgDlg('O custo médio foi alterado com sucesso','Informação',mtInformation,[mbOk],0);
           sel('');
           btnProcurar.SetFocus;
        except
              RollBackTransacao;
              MsgDlg('Não foi possível executar a gravação. Verifique','Erro',mtError,[mbOk],0);
              Raise;
        end;
        qry.CancelUpdates;
    End;

end;

procedure TFrmAlteraCustoMed.edCustoMedExit(Sender: TObject);
begin
  inherited;
  edValor.Value := edCustoMed.Value * edSaldoUC.Value;
  qry.Post;
end;

procedure TFrmAlteraCustoMed.edCustoMedEnter(Sender: TObject);
begin
  inherited;
  qry.Edit;
end;

end.
