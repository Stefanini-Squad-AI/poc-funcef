unit FMudaUn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  CMDBLookupCombo, ComCtrls, Wwdatsrc, Mask, DBCtrls;

type
  TFrmMudaUn = class(TfrmSairAjuda)
    BtnAtualiza: TBitBtn;
    Panel1: TPanel;
    Memo1: TMemo;
    qryArt: TwwQuery;
    qryArtDESCPROD: TStringField;
    qryArtCODARTIGO: TStringField;
    LbArtigo: TLabel;
    dblcArt: TCMDBLookupCombo;
    LbTabela: TLabel;
    barMov: TProgressBar;
    edUnCusto: TDBEdit;
    ds: TwwDataSource;
    Label1: TLabel;
    dblcUnidMedida: TwwDBLookupCombo;
    Label15: TLabel;
    qryArtCODMEDCUSTO: TStringField;
    qryUnidMed: TwwQuery;
    qryMov: TwwQuery;
    qryMovQTDEMOV: TFloatField;
    qryMovSALDOQTDEMOV: TFloatField;
    qryMovCUSTOMEDIOMOV: TFloatField;
    updMov: TUpdateSQL;
    qryMovIDMOV: TFloatField;
    qryConver: TwwQuery;
    qryConverFATOR: TFloatField;
    LbInicio: TLabel;
    LbProgresso: TLabel;
    LbFinal: TLabel;
    qrySaldo: TwwQuery;
    updSaldo: TUpdateSQL;
    qryCustoMed: TwwQuery;
    udpCustoMed: TUpdateSQL;
    qrySaldoSALDOQTDE: TFloatField;
    qrySaldoCODARTIGO: TStringField;
    qryCustoMedCODARTIGO: TStringField;
    qryCustoMedSALDOQTDEUC: TFloatField;
    qryCustoMedCUSTOMEDIO: TFloatField;
    qryProd: TwwQuery;
    updProd: TUpdateSQL;
    qryProdCODPRODUTO: TStringField;
    qryProdCODMEDCUSTO: TStringField;
    qrySaldoCODALMOXARIFADO: TFloatField;
    qryCustoMedCODCUSTEIO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure dblcArtCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure BtnAtualizaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Procedure Processar;
    Procedure Converte( sUnid : String; Var Fator : Double );
  public
    { Public declarations }
  end;

var
  FrmMudaUn: TFrmMudaUn;

implementation

{$R *.DFM}
Uses uMensErro, uDataBase;

procedure TFrmMudaUn.FormCreate(Sender: TObject);
begin
  inherited;
  qryArt.Open;
  LbInicio.Visible    := False;
  LbFinal.Visible     := False;
  LbProgresso.Visible := False;
  BtnAtualiza.Enabled := True;
end;

procedure TFrmMudaUn.dblcArtCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  QryUnidMed.Close;
  QryUnidMed.ParamByName('pCodProd').Value := Trim(Copy(dblcArt.LookUpValue,1,6));
  QryUnidMed.Open;
end;

Procedure TFrmMudaUn.Processar;
Var
    x            : Integer;
    rFator       : Double;
Begin
   LbInicio.Visible    := True;
   LbFinal.Visible     := True;
   LbProgresso.Visible := True;
   BtnAtualiza.Enabled := False;
   Converte(dblcUnidMedida.LookupValue, rFator );
//========================================================================
//Atualizando os Movimentos
//========================================================================
   LbTabela.Caption := 'Atualizando os Movimentos';
   x := 0;
   qryMov.Close;
   qryMov.Params[0].Value := Trim(dblcArt.LookupValue);
   qryMov.Open;
   //
   BarMov.Min      := x;
   BarMov.Max      := qryMov.RecordCount - 1;
   LbFinal.Caption := Format('%d',[BarMov.Max+1]);
   Application.ProcessMessages;
   qryMov.First;
   While Not qryMov.EOF Do
      Begin
          qryMov.Edit;
          qryMov.FieldByName('QTDEMOV').asFloat       := qryMov.FieldByName('QTDEMOV').asFloat * rFator;
          qryMov.FieldByName('SALDOQTDEMOV').asFloat  := qryMov.FieldByName('SALDOQTDEMOV').asFloat * rFator;
          qryMov.FieldByName('CUSTOMEDIOMOV').asFloat := qryMov.FieldByName('CUSTOMEDIOMOV').asFloat / rFator;
          qryMov.Next;
          Inc( x );
          BarMov.Position     := x;
          LbProgresso.Caption := Format('%d',[x]);
          Application.ProcessMessages;
      End;
//========================================================================
//Atualizando os Saldo
//========================================================================
   qrySaldo.Close;
   qrySaldo.Params[0].Value := Trim(dblcArt.LookupValue);
   qrySaldo.Open;
   qrySaldo.First;
   While Not qrySaldo.EOF Do
      Begin
          qrySaldo.Edit;
          qrySaldo.FieldByName('SALDOQTDE').asFloat  := qrySaldo.FieldByName('SALDOQTDE').asFloat * rFator;
          qrySaldo.Next;
      End;
//========================================================================
//Atualizando os Custos Medios
//========================================================================
    qryCustoMed.Close;
    qryCustoMed.Params[0].Value := Trim(dblcArt.LookupValue);
    qryCustoMed.Open;
    qryCustoMed.First;
    While Not qryCustoMed.EOF Do
      Begin
          qryCustoMed.Edit;
          qryCustoMed.FieldByName('SALDOQTDEUC').asFloat  := qryCustoMed.FieldByName('SALDOQTDEUC').asFloat * rFator;
          qryCustoMed.FieldByName('CUSTOMEDIO').asFloat   := qryCustoMed.FieldByName('CUSTOMEDIO').asFloat / rFator;
          qryCustoMed.Next;
      End;
//========================================================================
// Atualizando Produto
//========================================================================
     qryProd.Close;
     qryProd.Params[0].Value := Copy(Trim(dblcArt.LookupValue),1,6);
     qryProd.Open;
     //
     qryProd.Edit;
     qryProd.FieldByName('CODMEDCUSTO').asString := dblcUnidMedida.LookupValue;
     qryProd.Post;
End;

Procedure TFrmMudaUn.Converte( sUnid : String; Var Fator : Double );
Begin
//========================================================================
// Converte o Fator da velha unidade de Custo Médio para a nova  unidade de Custo Médio
//========================================================================
    qryConver.Close;
    qryConver.ParamByName('pCODART').asString     := Trim( Copy(dblcArt.LookupValue,1,6) );
    qryConver.ParamByName('pCODUNVELHA').asString := Trim( edUnCusto.Text );
    qryConver.ParamByName('pCODUNNOVA').asString  := Trim( sUnid );
    qryConver.Open;
    Fator := qryConver.fieldByName('FATOR').asFloat;
End;

procedure TFrmMudaUn.BtnAtualizaClick(Sender: TObject);
begin
  inherited;
  If Trim(dblcArt.Text) = '' Then
    Begin
     MsgDlg('Artigo não preenchido','Erro',mtError,[mbOK],0);
     dblcArt.SetFocus;
    End
  Else
  If Trim(dblcUnidMedida.Text) = '' Then
    Begin
     MsgDlg('Artigo não preenchido','Erro',mtError,[mbOK],0);
     dblcUnidMedida.SetFocus;
    End
  Else
  If Trim(dblcUnidMedida.Text) = Trim(edUnCusto.Text) Then
    Begin
     MsgDlg('Não pode alterar para a mesma unidade','Erro',mtError,[mbOK],0);
     dblcUnidMedida.SetFocus;
    End
  Else
      Begin
          Processar;
          Try
              StartTransacao;
              qryMov.ApplyUpdates;
              qrySaldo.ApplyUpdates;
              qryCustoMed.ApplyUpdates;
              qryProd.ApplyUpdates;
              CommitTransacao;
          Except
              RollBackTransacao;
              Raise;
              MsgDlg('Erro de Gravação','Erro',mtError,[mbOK],0);
              Exit;
          End;
          MsgDlg('Gravação efetuado com sucesso ','informação',mtInformation,[mbOK],0);
      End;

end;

procedure TFrmMudaUn.FormShow(Sender: TObject);
begin
  inherited;
  dblcArt.SetFocus;
end;

end.
