unit FMTConsolidaReq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBClient, uCMClientDataSet,
  Grids, Wwdbigrd, Wwdbgrid, wwdbdatetimepicker, CMDateTimePicker,uCmTypes,
  uCmSqlParams, Wwdatsrc, uCtrlGrupoProd, uCtrlUnMedida, ComCtrls, ppDB,
  ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppPrnabl,
  ppCtrls, ppBands, ppCache;

type
  TFrmMTConsolidaReq = class(TfrmSairAjuda)
    cdsGrupoProd: TCMClientDataSet;
    Panel2: TPanel;
    Label7: TLabel;
    dblcGrupoProd: TwwDBLookupCombo;
    Label1: TLabel;
    edDataI: TCMDateTimePicker;
    Label2: TLabel;
    EdDataF: TCMDateTimePicker;
    grdinvent: TwwDBGrid;
    spReq: TCMSqlParams;
    CdsReq: TCMClientDataSet;
    dsResumo: TwwDataSource;
    btnSelecionar: TBitBtn;
    btnImprimir: TBitBtn;
    pgBar: TProgressBar;
    lbStatus: TLabel;
    CdsResumo: TCMClientDataSet;
    ppResumo: TppReport;
    bdeResumo: TppBDEPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLine1: TppLine;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelecionarClick(Sender: TObject);
    procedure grdinventTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    GrupoProd  : TCtrlGrupoProd;
    UnMedida   : TCtrlUnMedida;
    Procedure Processar;
    Procedure Sel(n : Integer; Var Cds : TCMClientDataSet);
  public
    { Public declarations }
  end;

var
  FrmMTConsolidaReq: TFrmMTConsolidaReq;

implementation

{$R *.DFM}

{ TFrmMTConsolidaReq }

uses uSistema, DBaseDados, uModulo, uMensErro, uDataBase, fpreview;

procedure TFrmMTConsolidaReq.Sel(n : Integer; Var Cds : TCMClientDataSet);

begin
   With spReq Do
      Begin
         Sql.Clear;
         Sql.Add('SELECT ');
         Sql.Add('     IP.CODARTIGO,');
         Sql.Add('     (P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR) AS DESCRICAO, ');
         Sql.Add('     P.CODMEDCUSTO, ');
         Sql.Add('     IP.CODMEDIDA,  ');
         Sql.Add('     IP.QTDEPEDIDA, ');
         Sql.Add('     IP.QTDEPENDENTE,');
         Sql.Add('    (IP.VALORUN ) AS VALORUN, ');
         Sql.Add('    G.CODGRUPOPROD, ');
         Sql.Add('    G.DESCGRUPOPROD ');
         Sql.Add('FROM                ');
         Sql.Add('    ITEMPEDI IP,    ');
         Sql.Add('    REQMAT RQ,      ');
         Sql.Add('    ARTIGO A,       ');
         Sql.Add('    PRODUTO P,      ');
         Sql.Add('    GRUPPROD G      ');
         Sql.Add('WHERE  (RQ.IDPESSOA = '+IntToStr(n)+') ');
         Sql.Add('   AND (IP.QTDEPENDENTE  > 0 )');

         If (Trim(edDataI.Text) <> '' )  Then
            Sql.Add(' AND (RQ.DATAEMISSAO >= TO_DATE('''+DateToStr(edDataI.Date)+''',''DD/MM/YYYY'')) ');

         If (Trim(edDataF.Text) <> '') Then
            Sql.Add(' AND (RQ.DATAEMISSAO <= TO_DATE('''+DateToStr(edDataF.Date)+''',''DD/MM/YYYY'')) ');

         If Trim(dblcGrupoProd.Text) <> ''  Then
            sql.Add(' AND (RTRIM(P.CODGRUPOPROD) = '+QuotedStr(Trim(dblcGrupoProd.LookUpValue))+' ) ');

         Sql.Add('   AND (IP.NUMREQUISICAO  = RQ.NUMREQUISICAO)');
         Sql.Add('   AND (P.CODPRODUTO      = A.CODPRODUTO )   ');
         Sql.Add('   AND (A.CODARTIGO       = IP.CODARTIGO )   ');
         Sql.Add('   AND (P.CODGRUPOPROD = G.CODGRUPOPROD)     ');
         sql.Add('ORDER BY CODARTIGO');

         Cds.Data := Data;
      End;
end;

procedure TFrmMTConsolidaReq.FormCreate(Sender: TObject);
begin
  inherited;
  GrupoProd  := TCtrlGrupoProd.Create;
  GrupoProd.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  UnMedida   := TCtrlUnMedida.Create;
  UnMedida.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  edDataI.Date := Date;
  edDataF.Date := Date;

  cdsGrupoProd.data := GrupoProd.ListGrupoProd( tgAnaliticos );

  Sel(-1,CdsResumo);
  CdsResumo.Data := spReq.Data;
  CdsReq.Data    := spReq.Data;
end;

procedure TFrmMTConsolidaReq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  GrupoProd.Free;
  UnMedida.Free;
end;

procedure TFrmMTConsolidaReq.Processar;
Var
   CodAux  :  String;
   TotQtde :  Double;
begin
   pgBar.Max := CdsReq.RecordCount;
   CdsReq.First;
   CodAux  := CdsReq.FieldByName('CODARTIGO').AsString;
   MoveFields(CdsReq,CdsResumo,opInserir,False);
   TotQtde :=  0;
   While Not CdsReq.Eof Do
      Begin
          If Trim(CodAux) <> Trim(CdsReq.FieldByName('CODARTIGO').AsString) Then
             Begin
                CdsReq.Prior;

                CdsResumo.Edit;
                CdsResumo.FieldByName('QTDEPENDENTE').AsFloat := TotQtde;
                CdsResumo.FieldByName('VALORUN').AsFloat    := CdsReq.FieldByName('VALORUN').AsFloat;
                CdsResumo.Post;

                CdsReq.Next;

                MoveFields(CdsReq,CdsResumo,opInserir,False);
                CodAux := CdsReq.FieldByName('CODARTIGO').AsString;
                TotQtde :=  0;
             End;

          If Trim(CdsReq.FieldByName('CODMEDCUSTO').AsString) <> Trim(CdsReq.FieldByName('CODMEDIDA').AsString) Then
             Begin
                CdsReq.Edit;
                CdsReq.FieldByName('QTDEPENDENTE').AsFloat := UnMedida.QtdeToUnCustoMedio(CdsReq.FieldByName('CODARTIGO').AsString ,
                                                                                        CdsReq.FieldByName('CODMEDIDA').AsString,
                                                                                        CdsReq.FieldByName('QTDEPENDENTE').AsFloat);
                CdsReq.Post;
             End;

          TotQtde := TotQtde + CdsReq.FieldByName('QTDEPENDENTE').AsFloat;

          CdsReq.Next;
          pgBar.StepIt;
          Application.ProcessMessages;
      End;
    If TotQtde > 0 Then
       Begin
          CdsResumo.Edit;
          CdsResumo.FieldByName('QTDEPENDENTE').AsFloat := TotQtde;
          CdsResumo.FieldByName('VALORUN').AsFloat    := CdsReq.FieldByName('VALORUN').AsFloat;          
          CdsResumo.Post;
       End;
end;

procedure TFrmMTConsolidaReq.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  cdsResumo.DisableControls;

  Sel( -1 ,cdsResumo );
  Sel( Sistema.IdEmpresa,cdsReq );

  pgBar.Visible    := True;
  pgBar.Position   := 0;
  lbStatus.Visible := True;
  Try
     If Not cdsReq.IsEmpty Then
        Processar
     Else
        MsgDlg('Não há dados para consolidar','Aviso',mtWarning,[mbOk],0);

     TFloatField(CdsResumo.FieldByName('QTDEPENDENTE')).DisplayFormat := '#,####0.0000';
     TFloatField(CdsResumo.FieldByName('VALORUN')).DisplayFormat    := '#,##0.00';
     cdsResumo.First;
  Finally
     cdsResumo.EnableControls;
     pgBar.Visible    := False;
     pgBar.Position   := 0;
     lbStatus.Visible := False;
  End;
end;

procedure TFrmMTConsolidaReq.grdinventTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  CdsResumo.IndexFieldNames := AFieldName;
end;

procedure TFrmMTConsolidaReq.btnImprimirClick(Sender: TObject);
begin
  inherited;
  If Not cdsResumo.IsEmpty Then
     TFrmPreview.CreateModalPreview(application, ppResumo, 'Requisições Consolidadas')
  Else
     MsgDlg('Não há dados para consolidar','Aviso',mtWarning,[mbOk],0);

end;

end.
