unit FMTGeraProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, DBTables, MontaSelect,
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, TREdit, CMProcura, DBClient, Db,
  CMProcuraSubTipo, uCMClientDataSet, uCmSqlParams, uCtrlRad, uCmTypes;

type
  TFrmMTGeraProc = class(TfrmSairAjuda)
    btnExecutar: TBitBtn;
    dblcProc: TCMDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    MemObs: TMemo;
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
    Label9: TLabel;
    dblcGrpProc: TCMDBLookupCombo;
    cmPessoa: TCMProcuraSubTipo;
    SqlUnNegoc: TCMSqlParams;
    CdsUnNegoc: TCMClientDataSet;
    SqlProc: TCMSqlParams;
    CdsProc: TCMClientDataSet;
    CdsCentRespon: TCMClientDataSet;
    SqlCentRespon: TCMSqlParams;
    SqlGrpProc: TCMSqlParams;
    CdsGrpProc: TCMClientDataSet;
    SqlCentCust: TCMSqlParams;
    CdsCentCust: TCMClientDataSet;
    SqlGrpProd: TCMSqlParams;
    CdsGrpProd: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure dblcProcCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcGrpProcCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    Procedure SelProc( n: LongInt );
  public
    { Public declarations }
    rad: TCtrlRad;
  end;

var
  FrmMTGeraProc: TFrmMTGeraProc;

implementation

{$R *.DFM}

Uses uSistema, uDataBase, DBasedados, uMensErro;

Procedure TFrmMTGeraProc.SelProc( n: LongInt );
Begin
  CdsProc.Close;
  SqlProc.Prepare;
  SqlProc.ParamByName( 'pIDUSUARIO' ).AsInteger      := Sistema.IdUsuario;
  SqlProc.ParamByName( 'IDGRUPOPROCESSO' ).AsInteger := n;
  SqlProc.Open;

  dblcCentCust.Enabled := ( CdsProc.FieldByName( 'FLGCENTCUST' ).AsString = 'S' );
  dblcCentResp.Enabled := ( CdsProc.FieldByName( 'FLGCENTRESPON' ).AsString = 'S' );
  dblcGrpProd.Enabled  := ( CdsProc.FieldByName( 'FLGGRUPPROD' ).AsString = 'S' );
  dblcUnNegoc.Enabled  := ( CdsProc.FieldByNaME( 'FLGUNIDNEGOC' ).AsString = 'S' );
  edValor.Enabled      := ( CdsProc.FieldByName( 'FLGVALOR' ).AsString = 'S' );
End;

procedure TFrmMTGeraProc.FormCreate(Sender: TObject);
begin
  inherited;
  Rad := TCtrlRad.Create;
  Rad.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                  Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  CdsCentCust.Close;
  SqlCentCust.Prepare;
  SqlCentCust.ParamByName( 'pIDPESSOA' ).AsInteger   := Sistema.IdEmpresa;
  SqlCentCust.ParamByName( 'IDUSUARIO' ).AsInteger := Sistema.IdUsuario;
  SqlCentCust.Open;

  CdsCentRespon.Close;
  SqlCentRespon.Prepare;
  SqlCentRespon.ParamByName( 'pIDPESSOA' ).AsInteger   := Sistema.IdEmpresa;
  SqlCentRespon.ParamByName( 'IDUSUARIO' ).AsInteger := Sistema.IdUsuario;
  SqlCentRespon.Open;

  CdsUnNegoc.Close;
  SqlUnNegoc.Prepare;
  SqlUnNegoc.ParamByName( 'pIDPESSOA' ).AsInteger := Sistema.IdEmpresa;
  SqlUnNegoc.Open;

  SqlGrpProd.Open;
  SqlGrpProc.Open;

  SelProc( -1 );
end;

procedure TFrmMTGeraProc.btnExecutarClick(Sender: TObject);
Var
  iNumProc: LongInt;
begin
  inherited;
  If Trim( dblcProc.Text ) = '' Then
     Begin
        MsgDlg( 'Tipo de processo não preenchido', 'Erro', mtError, [mbOK], 0 );
        dblcProc.setFocus;
     End
  Else
  If Trim( MemObs.Text ) = '' Then
     Begin
        MsgDlg( 'Observação não preenchido', 'Erro', mtError, [mbOK], 0 );
        MemObs.setFocus;
     End
  Else
  If ( CdsProc.FieldByName( 'FLGCENTCUST' ).AsString = 'S' ) And ( Trim( dblcCentCust.Text ) = '' ) Then
     Begin
        MsgDlg( 'Centro de Custo não preenchido', 'Erro', mtError, [mbOK], 0 );
        dblcCentCust.setFocus;
     End
  Else
  If ( CdsProc.FieldByName( 'FLGCENTRESPON' ).AsString = 'S' ) And ( Trim( dblcCentResp.Text ) = '' ) Then
     Begin
        MsgDlg( 'Centro de Responsabilidade não preenchido', 'Erro', mtError, [mbOK], 0 );
        dblcCentResp.setFocus;
     End
  Else
  If ( CdsProc.FieldByName( 'FLGGRUPPROD' ).AsString = 'S' ) And ( Trim( dblcGrpProd.Text ) = '' ) Then
     Begin
        MsgDlg( 'Grupo de Produto não preenchido', 'Erro', mtError, [mbOK], 0 );
        dblcGrpProd.setFocus;
     End
  Else
  If ( CdsProc.FieldByName( 'FLGUNIDNEGOC' ).AsString = 'S' ) And ( Trim( dblcUnNegoc.Text ) = '' ) Then
     Begin
        MsgDlg( 'Atividade/Projeto não preenchido', 'Erro', mtError, [mbOK], 0 );
        dblcUnNegoc.setFocus;
     End
  Else
  If ( CdsProc.FieldByName( 'FLGVALOR' ).AsString = 'S' ) And ( edValor.Value <= 0 ) Then
     Begin
        MsgDlg( 'Valor não preenchido', 'Erro', mtError, [mbOK], 0 );
        edValor.setFocus;
     End
  Else
  If ( Trim( cmPessoa.Text ) <> '' ) And ( cmPessoa.Valida <> vcOK ) Then
     Begin
        cmPessoa.setFocus;
     End
  Else
     Begin
        Rad.TipoProcesso := StrToInt( dblcProc.LookupValue );
        Rad.IdPessoa     := Sistema.IdEmpresa;
        Rad.IdUsuario    := Sistema.IdUsuario;
        Rad.OBS          := MemOBS.Text;

        If Trim( cmPessoa.Text ) <> '' Then
           Rad.IdPessResp := cmPessoa.SubTipoReg.Id;

        If Trim( dblcCentCust.Text ) <> '' Then Begin
            Rad.CodCentroCusto := dblcCentCust.LookupValue;
            Rad.IdEmpresa      := Sistema.IdEmpresa;
        End;

        If Trim( dblcCentResp.Text ) <> '' Then
           Rad.CodCentroRespon := dblcCentResp.LookupValue;

        If Trim( dblcGrpProd.Text ) <> '' Then
           Rad.CodGrupoProd := dblcGrpProd.LookupValue;

        If Trim( dblcUnNegoc.Text ) <> '' Then
           Rad.UnidNegoc := StrToInt( dblcUnNegoc.LookupValue );

        If edValor.Value > 0 Then
           Rad.Valor := edValor.Value;
   (*
        Try
           StartTransacao;
           iNumProc := Rad.IniciarProcesso;

           If iNumProc < 0 Then
              Abort;

           CommitTransacao;
           MsgDlg( 'Gerado o processo Nº: ' + IntToStr( iNumProc ), 'Information', mtInformation, [mbOK], 0 );
        Except
           RollBackTransacao;
           MsgDlg( 'Processo não gerado', 'Erro', mtError, [mbOK], 0 );
           Raise;
        End;
   *)
        iNumProc := Rad.IniciarProcesso;

        If iNumProc < 0 Then Begin
           MsgDlg( 'Processo não gerado', 'Erro', mtError, [mbOK], 0 );
           Exit;
        End Else
           MsgDlg( 'Gerado o processo Nº: ' + IntToStr( iNumProc ), 'Information', mtInformation, [mbOK], 0 );

        dblcProc.Text     := '';
        dblcCentCust.Text := '';
        dblcCentResp.Text := '';
        dblcCentResp.Text := '';
        dblcGrpProd.Text  := '';
        dblcUnNegoc.Text  := '';
        cmPessoa.Text     := '';
        edValor.Value     := 0;
        MemObs.Lines.Clear;
        dblcProc.setFocus;
     End;
end;

procedure TFrmMTGeraProc.dblcProcCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If modified Then
     If Trim( dblcProc.Text ) <> '' Then
        MemObs.Text := CdsProc.FieldByName( 'OBSPROC' ).asString
     Else
        MemObs.Lines.Clear;
end;

procedure TFrmMTGeraProc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Rad.Free;
end;

procedure TFrmMTGeraProc.dblcGrpProcCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If modified And ( Trim( dblcGrpProc.Text ) <> '' ) Then
     SelProc( CdsGrpProc.FieldByName( 'IDGRUPOPROCESSO' ).AsInteger );
end;

end.

