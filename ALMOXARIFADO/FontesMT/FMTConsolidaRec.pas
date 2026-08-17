unit FMTConsolidaRec;
{ Kintana       : 1141057
  SOL           : 152417
  Desenvolvedor : JRM6 - José Roberto Marque
  Em            : Fevereiro-Abril-Maio/2012.
  Propósito     : Consulta de recebimento de mercadoria consolidado
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBClient, uCMClientDataSet,
  Grids, Wwdbigrd, Wwdbgrid, wwdbdatetimepicker, CMDateTimePicker,uCmTypes,
  uCmSqlParams, Wwdatsrc, uCtrlGrupoProd, uCtrlUnMedida, ComCtrls, ppDB,
  ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppPrnabl,
  ppCtrls, ppBands, ppCache, TREdit, DBTables;

type
  TFrmMTConsolidaRec = class(TfrmSairAjuda)
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
    Panel1: TPanel;
    bdeResumoppField3: TppField;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel8: TppLabel;
    varTotGeral: TRealEdit;
    Label3: TLabel;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppLabel9: TppLabel;
    ppLine2: TppLine;
    Panel3: TPanel;
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
  FrmMTConsolidaRec: TFrmMTConsolidaRec;

implementation

{$R *.DFM}

{ TFrmMTConsolidaRec }

uses uSistema, DBaseDados, uModulo, uMensErro, uDataBase, fpreview, uCtrlPadroes;

procedure TFrmMTConsolidaRec.Sel(n : Integer; Var Cds : TCMClientDataSet);

begin
  With spReq Do
  Begin
    Sql.Clear;
    SQL.Add('SELECT ');
    SQL.Add('       IT.CODARTIGO,');
    SQL.Add('       ( P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR ) AS DESCRICAO,');
    SQL.Add('       SUM( IT.QTDERECEBDEVOL ) AS QUANT,');
    SQL.Add('       P.CODMENORMED, ');
    SQL.Add('       0 AS QTDMENORMED, ');
    SQL.Add('       0.00 AS PU_MENORMED, ');
    SQL.Add('       IT.CODMEDIDA ,');
    SQL.Add('       IT.VLRUNITARIO AS VALOR,');
    SQL.Add('       GP.DESCGRUPOPROD,');
    SQL.Add('       ( IT.VLRUNITARIO * SUM(IT.QTDERECEBDEVOL) ) AS VLRTOTITEM');
    SQL.Add('  FROM NFRECEBDEVOL NF INNER JOIN ITENSRECEBDEVOL IT ON IT.IDNFRECEBDEVOL = NF.IDNFRECEBDEVOL');
    SQL.Add('                       INNER JOIN ARTIGO A           ON A.CODARTIGO       = IT.CODARTIGO ');
    SQL.Add('                       INNER JOIN PRODUTO P          ON P.CODPRODUTO      = A.CODPRODUTO');
    SQL.Add('                       INNER JOIN GRUPPROD GP        ON GP.CODGRUPOPROD   = P.CODGRUPOPROD');
    // Filtra o range de registros desejado
    if n = -1 then
    begin
      SQL.Add(' WHERE 1=2 ');
    end
    else
    begin
      (* Condição POG.
         O Propósito do comando abaixo é simplesmente colocar a clausula WHERE na
         instrução SQL. Dessa forma a montagem da instrução SQL fica mais simples
         pois nenhum dos filtros de seleção é obrigatório.
      *)
      SQL.Add(' WHERE 1=1 ');

      If (Trim(edDataI.Text) <> '' )  Then
        Sql.Add('   AND (NF.DATAENTDEVOL >= TO_DATE('''+DateToStr(edDataI.Date)+''',''DD/MM/YYYY'')) ');

      If (Trim(edDataF.Text) <> '')  Then
        Sql.Add('   AND (NF.DATAENTDEVOL <= TO_DATE('''+DateToStr(edDataF.Date)+''',''DD/MM/YYYY'')) ');

      If Trim(dblcGrupoProd.Text) <> ''  Then
        sql.Add('   AND (RTRIM(P.CODGRUPOPROD) = '+QuotedStr(Trim(dblcGrupoProd.LookUpValue))+' ) ');
    end;
    SQL.Add(' GROUP BY ');
    SQL.Add('          IT.CODARTIGO,');
    SQL.Add('          ( P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR ),');
    SQL.Add('          P.CODMENORMED, ');
    SQL.Add('          IT.CODMEDIDA, ');
    SQL.Add('          IT.VLRUNITARIO,');
    SQL.Add('          GP.DESCGRUPOPROD');
    SQL.Add(' ORDER BY ');
    SQL.Add('          IT.CODARTIGO, ');
    SQL.Add('          IT.VLRUNITARIO ');

    SQL.SaveToFile('c:\planus\temp\querycons.sql');
    Cds.Data := Data;
  End;
end;

procedure TFrmMTConsolidaRec.FormCreate(Sender: TObject);
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
//  CdsResumo2.Data := spReq.Data;
  CdsResumo.Data  := spReq.Data;
  CdsReq.Data     := spReq.Data;

end;

procedure TFrmMTConsolidaRec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  GrupoProd.Free;
  UnMedida.Free;
end;

procedure TFrmMTConsolidaRec.Processar;
Var
  CodAux,
  CodMedAx:  String;
  VlrUnMin,
  VlrTotMin,
  VlrUnMin2,
  VlrTotMin2,
  QtdeConv,
  QtdeConv2,
  TotGeral:  Double; 
  bCriaLinha: Boolean;

begin
  pgBar.Max :=  CdsReq.RecordCount;
  CdsReq.First;
  CodAux    :=  '';
  CodMedAx  :=  '';
  TotGeral  :=  0;
  While Not CdsReq.Eof Do
  Begin
    // Testa quebra de produto
    if trim( CodAux ) <> CdsReq.FieldByName('CODARTIGO').AsString then
    begin
      // Quebrou o produto #OK
      // Neste caso, vai inicializar CDSRESUMO com os dados do CDSREQ corrente (Criando registro em CDSRESUMO).
      MoveFields(CdsReq,CdsResumo,opInserir,False);
      // Atualiza aqui os novos campos de menor medida (Quantidade e preço Unitário)
      QtdeConv := UnMedida.QtdeToUnidade( CdsReq.FieldByName('CODARTIGO').AsString ,
                                          CdsReq.FieldByName('CODMEDIDA').AsString ,
                                          CdsReq.FieldByName('CODMENORMED').AsString ,
                                          CdsReq.FieldByName('QUANT').AsFloat );
      VlrUnMin := CdsResumo.FieldByName('VALOR').AsFloat / QtdeConv;
      CdsResumo.Edit;
      CdsResumo.FieldByName('QTDMENORMED').AsFloat := QtdeConv;
      CdsResumo.FieldByName('PU_MENORMED').AsFloat := VlrUnMin;
      CdsResumo.Post;
      // Atualiza os campos de controle das quebras
      CodAux   := CdsReq.FieldByName('CODARTIGO').AsString;
      CodMedAx := Trim(CdsReq.FieldByName('CODMEDIDA').AsString);
    end
    else
    begin
      // Mesmo produto
      // Testa a unidade de medida
      if trim(CodMedAx) <> Trim(CdsReq.FieldByName('CODMEDIDA').AsString) then
      begin
        If trim(CodMedAx) = Trim(CdsReq.FieldByName('CODMENORMED').AsString) Then
        Begin
          // Armazena as quantidades e valores de menor medida de CDSREQ.
          QtdeConv  := UnMedida.QtdeToUnidade( CdsReq.FieldByName('CODARTIGO').AsString ,
                                              CdsReq.FieldByName('CODMEDIDA').AsString ,
                                              CdsReq.FieldByName('CODMENORMED').AsString ,
                                              CdsReq.FieldByName('QUANT').AsFloat );
          VlrUnMin  := CdsReq.FieldByName('VALOR').AsFloat / QtdeConv;
          VlrTotMin := VlrUnMin * QtdeConv;
        End
        else
        begin
          QtdeConv  := CdsReq.FieldByName('QUANT').AsFloat;
          VlrUnMin  := CdsReq.FieldByName('VALOR').AsFloat;
          VlrTotMin := CdsReq.FieldByName('VLRTOTITEM').AsFloat;
        end;
        // Verifica se já existe CDSRESUMO com o mesmo codigo de produto, mesma unidade de medida e mesmo preço Unitário
        CdsResumo.First;
        while not CdsResumo.Eof do
        begin
          if CdsResumo.FieldByName('CODARTIGO').AsString = CdsReq.FieldByName('CODARTIGO').AsString then
            if CdsResumo.FieldByName('CODMEDIDA').AsString = CdsReq.FieldByName('CODMENORMED').AsString then
              if CdsResumo.FieldByName('PU_MENORMED').AsString = FloatToStr(VlrUnMin) then
                Break;
          CdsResumo.Next;
        end;

        if not CdsResumo.Eof then
        begin
          // Se encontrou registro em CDSRESUMO, faz a consolidação
          CdsResumo.Edit;
          CdsResumo.FieldByName('QUANT').AsFloat := CdsResumo.FieldByName('QTDMENORMED').AsFloat + QtdeConv;
          CdsResumo.FieldByName('VLRTOTITEM').AsFloat := CdsResumo.FieldByName('QUANT').AsFloat * CdsResumo.FieldByName('PU_MENORMED').AsFloat;
          CdsResumo.FieldByName('CODMEDIDA').AsString := CdsResumo.FieldByName('CODMENORMED').AsString;
          //CdsResumo.FieldByName('CODMEDIDA').AsFloat := CdsResumo.FieldByName('PU_MENORMED').AsFloat + VlrUnMin;
          CdsResumo.Post;
        end
        else
        begin
          bCriaLinha := true;
        end;
      end
      else
        bCriaLinha := true;

      if bCriaLinha then
      begin
        // Caso contrário cria CdsResumo
        MoveFields(CdsReq,CdsResumo,opInserir,False);
        // Atualiza aqui os novos campos de menor medida (Quantidade e preço Unitário)
        QtdeConv := UnMedida.QtdeToUnidade( CdsReq.FieldByName('CODARTIGO').AsString ,
                                            CdsReq.FieldByName('CODMEDIDA').AsString ,
                                            CdsReq.FieldByName('CODMENORMED').AsString ,
                                            CdsReq.FieldByName('QUANT').AsFloat );
        VlrUnMin := CdsResumo.FieldByName('VALOR').AsFloat / QtdeConv;
        CdsResumo.Edit;
        CdsResumo.FieldByName('QTDMENORMED').AsFloat := QtdeConv;
        CdsResumo.FieldByName('PU_MENORMED').AsFloat := VlrUnMin;
        CdsResumo.Post;
        bCriaLinha := False;
      end;

    end;
    // Acumula os totalizadores;
    TotGeral := TotGeral + CdsResumo.fieldbyname('VLRTOTITEM').AsFloat;
    // Próximo CDSREQ
    CdsReq.Next;
    pgBar.StepIt;
    Application.ProcessMessages;
  end;
  if TotGeral > 0 then
  begin
    varTotGeral.Value := TotGeral;
  end;
end;

procedure TFrmMTConsolidaRec.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  cdsResumo.DisableControls;
  CdsReq.Close;
  // Prepara o dataset de resumo consolidado
  sel( -1 ,cdsResumo );
  Sel( Sistema.IdEmpresa, cdsReq );

  pgBar.Visible     := True;
  pgBar.Position    := 0;
  lbStatus.Visible  := True;
  varTotGeral.Value := 0.00;
  Try
    If Not cdsReq.IsEmpty Then
      Processar
    Else
      MsgDlg('Não há dados para consolidar','Aviso',mtWarning,[mbOk],0);

    TFloatField(cdsReq.FieldByName('QUANT')).DisplayFormat          := '#,####0.0000';
    TFloatField(cdsReq.FieldByName('VALOR')).DisplayFormat          := '#,##0.00';
    TFloatField(CdsResumo.FieldByName('QUANT')).DisplayFormat       := '#,####0.0000';
    TFloatField(CdsResumo.FieldByName('VALOR')).DisplayFormat       := '#,##0.00';
    TFloatField(CdsResumo.FieldByName('VLRTOTITEM')).DisplayFormat  := '###,##0.00';
    cdsResumo.First;
  Finally
     cdsResumo.EnableControls;
     pgBar.Visible    := False;
     pgBar.Position   := 0;
     lbStatus.Visible := False;
  End;
end;

procedure TFrmMTConsolidaRec.grdinventTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  CdsResumo.IndexFieldNames := AFieldName;
end;

procedure TFrmMTConsolidaRec.btnImprimirClick(Sender: TObject);
begin
  inherited;
  If Not cdsResumo.IsEmpty Then
     TFrmPreview.CreateModalPreview(application, ppResumo, 'Requisições Consolidadas')
  Else
     MsgDlg('Não há dados para consolidar','Aviso',mtWarning,[mbOk],0);
end;

end.
