unit FGeraProc2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, Db, DBTables,
  Wwquery, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, TREdit, CMProcura,
  MontaSelect,uComum;

type
  TFrmGeraProc2 = class(TfrmSairAjuda)
    btnExecutar: TBitBtn;
    dblcProc: TCMDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    qryProc: TwwQuery;
    MemObs: TMemo;
    qryUnNegoc: TwwQuery;
    qryCentCust: TwwQuery;
    qryCentResp: TwwQuery;
    qryGrpProd: TwwQuery;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dblcGrpProd: TCMDBLookupCombo;
    dblcCentResp: TCMDBLookupCombo;
    dblcCentCust: TCMDBLookupCombo;
    dblcUnNegoc: TCMDBLookupCombo;
    Label8: TLabel;
    Label5: TLabel;
    edValor: TRealEdit;
    ToolbarSep971: TToolbarSep97;
    qryProcIDTIPOPROCESSO: TFloatField;
    qryProcNOME: TStringField;
    qryProcOBSPROC: TStringField;
    cmPessoa: TCMProcura;
    Label3: TLabel;
    msPessoa: TMontaSelect;
    qryGrpProc: TwwQuery;
    qryGrpProcDESCGRUPOPROCESSO: TStringField;
    qryGrpProcIDGRUPOPROCESSO: TFloatField;
    Label9: TLabel;
    dblcGrpProc: TCMDBLookupCombo;
    qryProcFLGCENTCUST: TStringField;
    qryProcFLGCENTRESPON: TStringField;
    qryProcFLGGRUPPROD: TStringField;
    qryProcFLGUNIDNEGOC: TStringField;
    qryProcFLGVALOR: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure dblcProcCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcGrpProcCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    Procedure Limpa;
    Procedure SelProc ( n: LongInt );
  public
    { Public declarations }
  end;

var
  FrmGeraProc2: TFrmGeraProc2;

implementation

{$R *.DFM}

Uses uRad, uSistema, uDataBase, uMensErro;

Procedure TFrmGeraProc2.SelProc ( n: LongInt );
BEgin
  qryProc.Close;
  qryProc.ParamByName('pIDUSUARIO').AsInteger      := Sistema.IdUsuario;
  qryProc.ParamByName('IDGRUPOPROCESSO').AsInteger := n;
  qryProc.Open;
  
  If (qryProcFLGCENTCUST.AsString = 'S') Then
     dblcCentCust.Enabled := True
  Else
     dblcCentCust.Enabled := False;

  If (qryProcFLGCENTRESPON.AsString = 'S') Then
     dblcCentResp.Enabled := True
  Else
     dblcCentResp.Enabled := False;

  If (qryProcFLGGRUPPROD.AsString = 'S') Then
     dblcGrpProd.Enabled := True
  Else
     dblcGrpProd.Enabled := False;

  If (qryProcFLGUNIDNEGOC.AsString = 'S') Then
     dblcUnNegoc.Enabled := True
  Else
     dblcUnNegoc.Enabled := False;

  If (qryProcFLGVALOR.AsString = 'S') Then
     edValor.Enabled := True
  Else
     edValor.Enabled := False;

End;

procedure TFrmGeraProc2.FormCreate(Sender: TObject);
begin
  inherited;
  Rad := TRad.Create;
  
  qryCentCust.Close;
  qryCentCust.ParamByName('pIDPESS').AsInteger   := Sistema.IdEmpresa;
  qryCentCust.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
  qryCentCust.Open;
  
  qryCentResp.Close;
  qryCentResp.ParamByName('pIDPESS').AsInteger   := Sistema.IdEmpresa;
  qryCentResp.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
  qryCentResp.Open;
  
  qryUnNegoc.Close;
  qryUnNegoc.Params[0].AsInteger := Sistema.IdEmpresa;
  qryUnNegoc.Open;
  
  qryGrpProd.Open;
  qryGrpProc.Open;
  
  SelProc(-1);
end;

Procedure TFrmGeraProc2.Limpa;
Begin
    dblcProc.Text     := '';
    dblcCentCust.Text := '';
    dblcCentResp.Text := '';
    dblcCentResp.Text := '';
    dblcGrpProd.Text  := '';
    dblcUnNegoc.Text  := '';
    cmPessoa.Text     := '';
    edValor.Value     := 0;
    MemObs.Lines.Clear;
End;

procedure TFrmGeraProc2.btnExecutarClick(Sender: TObject);
Var
   iNumProc : LongInt;
begin
  inherited;
  If Trim(dblcProc.Text) = '' Then
     Begin
        MsgDlg('Tipo de processo não preenchido','Erro',mtError,[mbOK],0);
        dblcProc.setFocus;
     End
  Else
  If Trim(MemObs.Text) = '' Then
     Begin
        MsgDlg('Observação não preenchido','Erro',mtError,[mbOK],0);
        MemObs.setFocus;
     End
  Else
  If (qryProcFLGCENTCUST.AsString = 'S') And (Trim(dblcCentCust.Text) = '') Then
     Begin
        MsgDlg('Centro de Custo não preenchido','Erro',mtError,[mbOK],0);
        dblcCentCust.setFocus;
     End
  Else
  If (qryProcFLGCENTRESPON.AsString = 'S') And (Trim(dblcCentResp.Text) = '') Then
     Begin
        MsgDlg('Centro de Responsabilidade não preenchido','Erro',mtError,[mbOK],0);
        dblcCentResp.setFocus;
     End
  Else
  If (qryProcFLGGRUPPROD.AsString = 'S') And (Trim(dblcGrpProd.Text) = '') Then
     Begin
        MsgDlg('Grupo de Produto não preenchido','Erro',mtError,[mbOK],0);
        dblcGrpProd.setFocus;
     End
  Else
  If (qryProcFLGUNIDNEGOC.AsString = 'S') And (Trim(dblcUnNegoc.Text) = '') Then
     Begin
        MsgDlg('Atividade/Projeto não preenchido','Erro',mtError,[mbOK],0);
        dblcUnNegoc.setFocus;
     End
  Else
  If (qryProcFLGVALOR.AsString = 'S') And (edValor.Value <= 0 ) Then
     Begin
        MsgDlg('Valor não preenchido','Erro',mtError,[mbOK],0);
        edValor.setFocus;
     End
  Else
  If ( Trim(cmPessoa.Text) <> '') And (cmPessoa.Valida <> vcOK  ) Then
     Begin
       cmPessoa.setFocus;
     End
  Else
     Begin
        Rad.TipoProcesso   := StrToInt(dblcProc.LookupValue);
        Rad.IdPessoa       := Sistema.IdEmpresa;
        Rad.OBS            := MemOBS.Text;

        If Trim(cmPessoa.Text) <> '' Then
           Rad.IdPessResp     := StrToInt(cmPessoa.MontaSelect.ValoresChave[0]);

        If Trim(dblcCentCust.Text) <> '' Then
           Begin
               Rad.CodCentroCusto  := dblcCentCust.LookupValue;
               Rad.IdEmpresa       := Sistema.IdEmpresa;
           End;
        If Trim(dblcCentResp.Text) <> '' Then
           Rad.CodCentroRespon := dblcCentResp.LookupValue;

        If Trim(dblcGrpProd.Text) <> '' Then
           Rad.CodGrupoProd := dblcGrpProd.LookupValue;

        If Trim(dblcUnNegoc.Text) <> '' Then
           Rad.UnidNegoc := StrToInt(dblcUnNegoc.LookupValue);

        If edValor.Value > 0 Then
           Rad.Valor := edValor.Value;

        Try
           StartTransacao;
           iNumProc := Rad.IniciarProcesso;
           CommitTransacao;
           MsgDlg('Gerado o processo Nº : '+IntToStr(iNumProc),'Information',mtInformation,[mbOK],0);
        Except
           RollBackTransacao;
           Raise;
        End;
        Limpa;
        dblcProc.setFocus;
     End;
end;

procedure TFrmGeraProc2.dblcProcCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If ( modified ) Then
    Begin
     If Trim(dblcProc.Text) <> '' Then
         MemObs.Text := qryProc.FieldByName('OBSPROC').asString
     Else
         MemObs.Lines.Clear;
    End;
end;

procedure TFrmGeraProc2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Rad.Free;
end;

procedure TFrmGeraProc2.dblcGrpProcCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if ( modified ) And ( Trim(dblcGrpProc.Text) <> '' ) Then
     SelProc (qryGrpProcIDGRUPOPROCESSO.AsInteger);
end;

end.
