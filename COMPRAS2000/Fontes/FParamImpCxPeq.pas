unit FParamImpCxPeq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdblook, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti, dBaseDados,
  TREdit, CMDBLookupCombo, Wwdatsrc;

type
  TFrmParamImpCxPeq = class(TfrmOkCancelar)
    qryCP: TwwQuery;
    qryCPIDCAIXAPEQUENO: TFloatField;
    qryCPDESCCAIXAPEQ: TStringField;
    qryCPRAZAOSOCIAL: TStringField;
    qryCPVLRTOTCAIXAPEQ: TFloatField;
    qryBord: TwwQuery;
    qryBordIDCAIXAPEQUENO: TFloatField;
    qryBordDATAEFETBORDERO: TDateTimeField;
    dsBord: TwwDataSource;
    dsCP: TwwDataSource;
    Label1: TLabel;
    dblcCaixaPeq: TCMDBLookupCombo;
    Label5: TLabel;
    edNumBord: TRealEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcCaixaPeqCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
  Procedure Sel;
  public
    { Public declarations }
  end;

var
  FrmParamImpCxPeq: TFrmParamImpCxPeq;
  iIdCaixaPeq     : LongInt;

implementation

Uses uSistema, DRelCompras, uMenserro;
{$R *.DFM}

procedure TFrmParamImpCxPeq.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if (Trim(dblcCaixaPeq.Text) ='')  And (edNumBord.Value <= 0 ) Then
    Begin
        MsgDlg('Selecione o caixa pequeno ou o Nº do borderô','Erro',mtError,[mbOk],0);
        ModalResult := mrNone;
    End
  Else
      Sel;
end;

Procedure TFrmParamImpCxPeq.Sel;
Begin
  If edNumBord.Value > 0 Then
     Begin
        qryBord.Close;
        qryBord.ParamByName('pIDBORD').AsFloat      := edNumBord.Value;
        qryBord.ParamByName('pIDPESSOA').AsInteger  := Sistema.IdEmpresa;
        qryBord.ParamByName('pIDUSUARIO').AsInteger := Sistema.IdUsuario;
        qryBord.Open;
        If Not qryBord.IsEmpty Then
           Begin
               iIdCaixaPeq := qryBord.FieldByName('IDCAIXAPEQUENO').AsInteger;
               dblcCaixaPeq.LookupValue := IntToStr(iIdCaixaPeq);
           End
        Else
           Begin
              iIdCaixaPeq := -1;
              MsgDlg('Nº de Borderô não existe ou pertence a um caixa pequeno que você não esta habilitado','Erro',mtError,[mbOk],0);
           End;
        With DtmRelCompras Do
           Begin
               qryCxPeq.Close;
               qryCxPeq.SQL.Delete(31);
               qryCxPeq.SQL.Insert(31,'(LA.IDBORDEROCXPEQ ='+FloatToStr(edNumBord.Value)+')');
               qryCxPeq.ParamByName('pIDCAIXAPEQUENO').AsInteger := iIdCaixaPeq;
               qryCxPeq.ParamByName('pIDPESSOA').AsInteger := Sistema.IdEmpresa;
               qryCxPeq.Open;
           End;
     End
  Else
     Begin
        iIdCaixaPeq := StrToInt(dblcCaixaPeq.LookupValue);
        With DtmRelCompras do
           Begin
               qryCxPeq.Close;
               qryCxPeq.SQL.Delete(31);
               qryCxPeq.SQL.Insert(31,'(LA.IDBORDEROCXPEQ IS NULL)');
               qryCxPeq.ParamByName('pIDCAIXAPEQUENO').AsInteger := iIdCaixaPeq;
               qryCxPeq.ParamByName('pIDPESSOA').AsInteger := Sistema.IdEmpresa;
               qryCxPeq.Open;
           End;
     End;
  If Trim( dblcCaixaPeq.Value ) <> '' Then
     DtmRelCompras.ppLblTituloCxPeq.Caption := 'Caixa Pequeno: ' + dblcCaixaPeq.Value;
  If edNumBord.Value > 0 Then
     DtmRelCompras.ppLblTituloCxPeq.Caption := ' - Borderô Nº: ' + edNumBord.Text + ' - do dia: ' + DtmRelCompras.qryCxPeq.FieldByName( 'DATAEFETBORDERO' ).AsString;
End;

procedure TFrmParamImpCxPeq.FormCreate(Sender: TObject);
begin
  inherited;
  qryCP.Close;
  qryCP.ParamByName('pIDPESSOA').AsInteger  := Sistema.IdEmpresa;
  qryCP.ParamByName('pIDUSUARIO').AsInteger := Sistema.IdUsuario;
  qryCP.Open;
end;

procedure TFrmParamImpCxPeq.dblcCaixaPeqCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If  modified  Then
      edNumBord.Value := 0;
end;

end.
