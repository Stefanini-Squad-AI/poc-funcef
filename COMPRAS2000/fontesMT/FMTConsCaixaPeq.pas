unit FMTConsCaixaPeq;

{
-----------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: - Integração com o Planejamento Orçamentário
-----------------------------------------------------------------------------
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, DBCtrls, Grids,
  Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBTables, Mask, TREdit,
  DBClient, uCMClientDataSet,uCtrlCaixaPequeno, Wwquery;

type
  TFrmMTConsCaixaPeq = class(TfrmSairAjuda)
    dsLanc: TwwDataSource;
    dsTot: TwwDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    Grdlanc: TwwDBGrid;
    Panel4: TPanel;
    Panel3: TPanel;
    memHist: TDBMemo;
    Label1: TLabel;
    dblcCaixaPeq: TCMDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edDataEfet: TDBEdit;
    BtnSel: TBitBtn;
    edNumBord: TRealEdit;
    dsCP: TwwDataSource;
    dsBord: TwwDataSource;
    edSaldo: TRealEdit;
    btnLimpar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    edForn: TEdit;
    cdsLanc: TCMClientDataSet;
    cdsTot: TCMClientDataSet;
    cdsCP: TCMClientDataSet;
    cdsBord: TCMClientDataSet;
    edValTot: TDBRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure BtnSelClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure dblcCaixaPeqCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CaixaPequeno : TCtrlCaixaPequeno;
    Procedure Sel;
  public
    { Public declarations }
  end;

var
  FrmMTConsCaixaPeq : TFrmMTConsCaixaPeq;
  iIdCaixaPeq     : LongInt;
implementation

{$R *.DFM}
Uses uSistema, uMensErro,dBaseDados;

Procedure TFrmMTConsCaixaPeq.Sel;
Begin
  If edNumBord.Value > 0 Then
     Begin
        cdsBord.Data := CaixaPequeno.ListaCaixaData(Sistema.IdEmpresa,Sistema.IdUsuario,edNumBord.Value);
        If Not cdsBord.IsEmpty Then
           Begin
               iIdCaixaPeq := cdsBord.FieldByName('IDCAIXAPEQUENO').AsInteger;
               dblcCaixaPeq.LookupValue := IntToStr(iIdCaixaPeq);
           End
        Else
           Begin
              iIdCaixaPeq := -1;
              MsgDlg('Nº de Borderô não existe ou pertence a um caixa pequeno que você não esta habilitado','Erro',mtError,[mbOk],0);
           End;
         cdsLanc.Data := CaixaPequeno.ListaLancCxPeq(iIdCaixaPeq,edNumBord.Value);
         TFloatField(cdsLanc.FieldByName('VLRLANC')).DisplayFormat := '#,##0.00';
         //
         cdsTot.Data := CaixaPequeno.ListaTotalLancCxPeq(iIdCaixaPeq,edNumBord.Value);
     End
  Else
     Begin
         cdsBord.Data := CaixaPequeno.ListaCaixaData(Sistema.IdEmpresa,Sistema.IdUsuario,0);
         iIdCaixaPeq  := StrToInt(dblcCaixaPeq.LookupValue);
         cdsLanc.Data := CaixaPequeno.ListaLancCxPeq(iIdCaixaPeq,0);
         TFloatField(cdsLanc.FieldByName('VLRLANC')).DisplayFormat := '#,##0.00';
         cdsTot.Data := CaixaPequeno.ListaTotalLancCxPeq(iIdCaixaPeq,0);
     End;
  edForn.Text   := cdsCP.FieldByName('RAZAOSOCIAL').asString;
  edSaldo.Value := (cdsCP.FieldByName('VLRTOTCAIXAPEQ').asFloat - cdsTot.FieldByName('TOTAL').asFloat);
End;
procedure TFrmMTConsCaixaPeq.FormCreate(Sender: TObject);
begin
  inherited;
  CaixaPequeno := TCtrlCaixaPequeno.Create;
  CaixaPequeno.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);

  cdsCP.Data := CaixaPequeno.ListaCaixaPequeno(Sistema.IdEmpresa,Sistema.IdUsuario,0,False);
  //
  cdsLanc.Data := CaixaPequeno.ListaLancCxPeq(-1,-1);
  TFloatField(cdsLanc.FieldByName('VLRLANC')).DisplayFormat := '#,##0.00';
  //
  cdsTot.Data := CaixaPequeno.ListaTotalLancCxPeq(-1,-1);
end;

procedure TFrmMTConsCaixaPeq.BtnSelClick(Sender: TObject);
begin
  inherited;
  if (Trim(dblcCaixaPeq.Text) ='')  And (edNumBord.Value <= 0 ) Then
    Begin
        MsgDlg('Selecione o caixa pequeno ou o Nº do borderô','Erro',mtError,[mbOk],0);
    End
  Else
      Sel;
end;

procedure TFrmMTConsCaixaPeq.btnLimparClick(Sender: TObject);
begin
  inherited;
   edForn.Clear;
   edNumBord.Value := 0;
   dblcCaixaPeq.Text := '';
   //
   cdsBord.Data := CaixaPequeno.ListaCaixaData(-1,-1,-1);
   //
   cdsLanc.Data := CaixaPequeno.ListaLancCxPeq(-1,-1);
   TFloatField(cdsLanc.FieldByName('VLRLANC')).DisplayFormat := '#,##0.00';
   //
   cdsTot.Data := CaixaPequeno.ListaTotalLancCxPeq(-1,-1);
   edSaldo.Value := 0;
end;

procedure TFrmMTConsCaixaPeq.dblcCaixaPeqCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If ( modified ) And ( Trim(dblcCaixaPeq.Text) <> '' ) Then
      Begin
          edForn.Text := cdsCP.FieldByName('RAZAOSOCIAL').asString;
          edNumBord.Value := 0;
          cdsBord.Data := CaixaPequeno.ListaCaixaData(-1,-1,-1);
      End
  Else
      edForn.Clear;
end;

procedure TFrmMTConsCaixaPeq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CaixaPequeno.Free;
end;

end.
