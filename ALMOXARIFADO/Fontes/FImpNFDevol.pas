unit FImpNFDevol;

interface                              

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Grids, Wwdbigrd,
  Wwdbgrid, Wwdatsrc, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  CMProcuraSubTipo, wwdblook, CMDBLookupCombo,uConfigNfDevol, Mask;

type
  TFrmImpNFDevol = class(TfrmSairAjuda)
    qry: TwwQuery;
    qryDet: TwwQuery;
    qryAgregItem: TwwQuery;
    qryAgregNota: TwwQuery;
    plnSel: TPanel;
    Panel2: TPanel;
    grdNota: TwwDBGrid;
    ds: TwwDataSource;
    qryIDNFRECEBDEVOL: TFloatField;
    qryNUMNF: TFloatField;
    qryCOMPLNF: TStringField;
    qryIDPESSOA: TFloatField;
    qryCODDOCUMENTO: TFloatField;
    qryFLGTIPONOTA: TStringField;
    qryDATAEMISNF: TDateTimeField;
    qryIDFORCLI: TFloatField;
    qryDATAENTDEVOL: TDateTimeField;
    qryVLRNOTAFISCAL: TFloatField;
    qryPLNCODIGO: TFloatField;
    qryIDNFREFERENCIA: TFloatField;
    qryRAZAOSOCIAL: TStringField;
    qryNOME: TStringField;
    qryNUMDOCUMENTO: TStringField;
    qryENDERECO: TStringField;
    qryCOMPLEMENTO: TStringField;
    qryBAIRRO: TStringField;
    qryCEP: TStringField;
    qryCODESTADO: TStringField;
    qryEMAIL: TStringField;
    qryCIDADE: TStringField;
    qryTELEFONE: TStringField;
    qryDDD: TStringField;
    qryFAX: TStringField;
    qryDDDFAX: TStringField;
    edDataI: TCMDateTimePicker;
    edDataF: TCMDateTimePicker;
    edNumNota: TRealEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dblcFornCli: TCMProcuraForCli;
    btnProc: TBitBtn;
    btnLimpar: TBitBtn;
    qryFLGIMPRESSO: TStringField;
    qryModelo: TwwQuery;
    dblcModelo: TCMDBLookupCombo;
    Label4: TLabel;
    btnImprimir: TmaHelpBitBtn;
    ToolbarSep971: TToolbarSep97;
    qryDetIDITENSRECDEV: TFloatField;
    qryDetNUMOC: TFloatField;
    qryDetCODARTIGO: TStringField;
    qryDetCODMEDIDA: TStringField;
    qryDetIDMOV: TFloatField;
    qryDetIDEMPRESA: TFloatField;
    qryDetCODCENTROCUSTO: TStringField;
    qryDetCODALMOXARIFADO: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetIDNFRECEBDEVOL: TFloatField;
    qryDetQTDERECEBDEVOL: TFloatField;
    qryDetVLRUNITARIO: TFloatField;
    qryDetVLRESTOQUE: TFloatField;
    qryDetFLGDESTINO: TStringField;
    qryDetDATAVALIDADE: TDateTimeField;
    qryDetRECPAG: TStringField;
    qryDetCODTIPRECDES: TStringField;
    qryDetUNIDNEGOC: TFloatField;
    qryDetCODCENTRORESPON: TStringField;
    qryDetDESCPROD: TStringField;
    qryDetCONSUMOREVENDA: TStringField;
    qryDetCODCOR: TStringField;
    qryDetCODTAMANHO: TStringField;
    qryDetIDPRODVARI: TFloatField;
    qryDetDESCCLASSIFISCAL: TStringField;
    qryDetCODFISCAL: TStringField;
    qryModeloIDTEMPLNFDEVOL: TFloatField;
    qryModeloDESCTEMPLNFDEVOL: TStringField;
    qryModeloICMSNOTA: TFloatField;
    qryModeloICMSITEM: TFloatField;
    qryModeloICMSSUBSTITUICAO: TFloatField;
    qryModeloIPIITEM: TFloatField;
    qryModeloFRETE: TFloatField;
    qryModeloSEGURO: TFloatField;
    qryModeloOUTRASDESP: TFloatField;
    qryDetTOTPROD: TFloatField;
    upd: TUpdateSQL;
    qryAgregItemCODTIPOCUSTAGREG: TFloatField;
    qryAgregItemIDAGRITENSRECDEV: TFloatField;
    qryAgregItemIDITENSRECDEV: TFloatField;
    qryAgregItemALIQUOTA: TFloatField;
    qryAgregItemBASECALCULO: TFloatField;
    qryAgregItemVLRAGREGADO: TFloatField;
    qryAgregNotaCODTIPOCUSTAGREG: TFloatField;
    qryAgregNotaCODTRATFISCE: TStringField;
    qryAgregNotaDESCCUSTAGREG: TStringField;
    qryAgregNotaPERCVALOR: TStringField;
    qryAgregNotaIDAGRNFRECDEV: TFloatField;
    qryAgregNotaIDNFRECEBDEVOL: TFloatField;
    qryAgregNotaIDNFCOMPLEMENTAR: TFloatField;
    qryAgregNotaALIQUOTA: TFloatField;
    qryAgregNotaBASECALCULO: TFloatField;
    qryAgregNotaVLRAGREGADO: TFloatField;
    qryModeloIDDOCUMENTO: TFloatField;
    rgTipoNF: TRadioGroup;
    procedure btnLimparClick(Sender: TObject);
    procedure btnProcClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdNotaDblClick(Sender: TObject);
  private
    { Private declarations }
    ConfigNota : TConfigNfDevol;
    //
    Procedure SelNota( N : Int64);
    Procedure Procurar;
    procedure SetItensNota(var CodProduto, DescProduto, UnidMedida :String; var Quantidade, ValorUnit, ValorTotal, ICMS, IPI, ValorIPI : Double; var CanPrint: Boolean; iItemDet: Integer);
    Procedure Imprimir;
    Procedure PegaAgreNota(N :Int64; Var rBase,rValor : Double);
    Procedure PegaAgreItem(N :Int64; Var rBase,rValor : Double);
    Function  PegaInscricao(IdPessoa,IdDocumento : LongInt) : String;
  public
    { Public declarations }
  end;

var
  FrmImpNFDevol: TFrmImpNFDevol;

implementation

{$R *.DFM}

{ TFrmImpNFDevol }

Uses uCMTypes, FAguarde, uMensErro, uModulo,uDataBase,uSistema,
     DBaseDados;

procedure TFrmImpNFDevol.Procurar;
begin
   qry.DisableControls;
   Try
      qry.Close;
      qry.Sql.Clear;
      qry.Sql.Add('SELECT                                       ');
      qry.Sql.Add('      N.FLGIMPRESSO,                         ');
      qry.Sql.Add('      N.IDNFRECEBDEVOL,                      ');
      qry.Sql.Add('      N.NUMNF,                               ');
      qry.Sql.Add('      N.COMPLNF,                             ');
      qry.Sql.Add('      N.IDPESSOA,                            ');
      qry.Sql.Add('      N.CODDOCUMENTO,                        ');
      qry.Sql.Add('      N.FLGTIPONOTA,                         ');
      qry.Sql.Add('      N.DATAEMISNF,                          ');
      qry.Sql.Add('      N.IDFORCLI,                            ');
      qry.Sql.Add('      N.DATAENTDEVOL,                        ');
      qry.Sql.Add('      N.VLRNOTAFISCAL,                       ');
      qry.Sql.Add('      N.PLNCODIGO,                           ');
      qry.Sql.Add('      N.IDNFREFERENCIA,                      ');
      qry.Sql.Add('      P.RAZAOSOCIAL,                         ');
      qry.Sql.Add('      P.NOME,                                ');
      qry.Sql.Add('      P.NUMDOCUMENTO,                        ');
      qry.Sql.Add('     (E.LOGRADOURO ||'' ''|| E.NUMERO) AS ENDERECO, ');
      qry.Sql.Add('      E.COMPLEMENTO,                              ');
      qry.Sql.Add('      E.BAIRRO,                                   ');
      qry.Sql.Add('      E.CEP,                                      ');
      qry.Sql.Add('      ES.CODESTADO,                               ');
      qry.Sql.Add('      P.EMAIL,                                    ');
      qry.Sql.Add('      DECODE(E.IDCIDADES, NULL, E.CIDADE,C.NOME) AS CIDADE,');
      qry.Sql.Add('      TC.TELEFONE,                                ');
      qry.Sql.Add('      TC.DDD,                                     ');
      qry.Sql.Add('      FC.FAX,                                     ');
      qry.Sql.Add('      FC.DDDFAX                                   ');
      qry.Sql.Add('FROM                                              ');
      qry.Sql.Add('     NFRECEBDEVOL N,                              ');
      qry.Sql.Add('     PESSOA P,                                    ');
      qry.Sql.Add('     ENDPESS E,                                   ');
      qry.Sql.Add('     CIDADES C,                                   ');
      qry.Sql.Add('     ESTADO  ES,                                  ');
      qry.Sql.Add('     (                                            ');
      qry.Sql.Add('      SELECT TP.IDENDERECO, TP.NUMERO AS TELEFONE,TP.DDI,TP.DDD ');
      qry.Sql.Add('      FROM  TELENDPESS  TP,                                  ');
      qry.Sql.Add('           (SELECT IDENDERECO, MAX(IDTELEFONE) AS IDTELEFONE ');
      qry.Sql.Add('            FROM TELENDPESS                                  ');
      qry.Sql.Add('            WHERE (TIPO LIKE ''%C%'')                          ');
      qry.Sql.Add('            GROUP BY IDENDERECO) C                           ');
      qry.Sql.Add('      WHERE (TP.IDENDERECO = C.IDENDERECO) AND               ');
      qry.Sql.Add('            (TP.IDTELEFONE = C.IDTELEFONE)                   ');
      qry.Sql.Add('      ) TC,                                                  ');
      qry.Sql.Add('      (SELECT TP.IDENDERECO, TP.NUMERO AS FAX,TP.DDI AS DDIFAX ,TP.DDD AS DDDFAX');
      qry.Sql.Add('      FROM  TELENDPESS  TP,                                  ');
      qry.Sql.Add('           (SELECT IDENDERECO, MAX(IDTELEFONE) AS IDTELEFONE ');
      qry.Sql.Add('            FROM TELENDPESS                                  ');
      qry.Sql.Add('            WHERE (TIPO LIKE ''%F%'')                        ');
      qry.Sql.Add('            GROUP BY IDENDERECO) C                           ');
      qry.Sql.Add('      WHERE (TP.IDENDERECO = C.IDENDERECO) AND               ');
      qry.Sql.Add('            (TP.IDTELEFONE = C.IDTELEFONE)                   ');
      qry.Sql.Add('      ) FC                                                   ');
      qry.Sql.Add('WHERE                                                        ');
      Case rgTipoNF.ItemIndex Of
         0 : qry.Sql.Add('         (N.FLGTIPONOTA   = ''D'') ');
         1 : qry.Sql.Add('         (N.FLGTIPONOTA   = ''E'') ');
         2 : qry.Sql.Add('         (N.FLGTIPONOTA   = ''S'') ');
      End;
      qry.Sql.Add('   AND   ((N.FLGIMPRESSO  = ''N'') OR (N.FLGIMPRESSO IS NULL))');
      If edNumNota.Value > 0 Then
         qry.SQL.Add('AND (N.NUMNF ='+edNumNota.Text+')')
      Else
         Begin
            If Trim(EdDataI.Text) <> '' Then
               qry.SQL.Add('AND (N.DATAENTDEVOL >= TO_DATE('''+edDataI.Text+''',''DD/MM/YYYY''))');
            If Trim(EdDataF.Text) <> '' Then
               qry.SQL.Add('AND (N.DATAENTDEVOL <= TO_DATE('''+edDataF.Text+''',''DD/MM/YYYY''))');
            If Trim(dblcFornCli.Text) <> '' Then
               qry.SQL.Add('AND (N.IDFORCLI = '+IntToStr(dblcFornCli.ForCliReg.id)+')');
         End;
      qry.Sql.Add('     AND (P.IDPESSOA       = N.IDFORCLI )       ');
      qry.Sql.Add('     AND (E.IDPESSOA(+)    = P.IDPESSOA)        ');
      qry.Sql.Add('     AND (E.IDENDERECO(+)  = P.IDENDCOMERCIAL)  ');
      qry.Sql.Add('     AND (E.IDCIDADES      = C.IDCIDADES(+))    ');
      qry.Sql.Add('     AND (ES.IDESTADO(+)   = C.IDESTADO)        ');
      qry.Sql.Add('     AND (TC.IDENDERECO(+) = E.IDENDERECO)      ');
      qry.Sql.Add('     AND (FC.IDENDERECO(+) = E.IDENDERECO)      ');
      qry.Sql.Add('ORDER BY  N.DATAENTDEVOL ');
      qry.Open;
   Finally
      qry.EnableControls;
   End;
end;

procedure TFrmImpNFDevol.SelNota( N : Int64);
begin
  qryDet.Close;
  qryDet.ParamByName('pNUMIDNF').AsInteger := n;
  qryDet.Open;
  qryDet.First;
  //
  qryAgregNota.Close;
  qryAgregNota.ParamByName('IAGREGNOTA').AsInteger := n;
  qryAgregNota.Open;

end;

procedure TFrmImpNFDevol.btnLimparClick(Sender: TObject);
begin
  inherited;
  edNumNota.Clear;
  edDataI.ClearDateTime;
  edDataF.ClearDateTime;
  dblcFornCli.Text := '';  
end;

procedure TFrmImpNFDevol.btnProcClick(Sender: TObject);
begin
  inherited;
  Procurar;
end;

procedure TFrmImpNFDevol.FormCreate(Sender: TObject);
begin
  inherited;
  ConfigNota := TConfigNFDevol.Create(Self);
  ConfigNota.DataBaseName := 'BaseDados';
  ConfigNota.BeforePrintLinhas := SetItensNota;
  //
  qryModelo.Open;

end;

procedure TFrmImpNFDevol.SetItensNota(var CodProduto, DescProduto,
  UnidMedida: String; var Quantidade, ValorUnit, ValorTotal, ICMS, IPI,
  ValorIPI: Double; var CanPrint: Boolean; iItemDet: Integer);
Var
   rBase  : Double;
   rValor : Double;
begin
   CanPrint := Not qryDet.Eof;
   //
   If CanPrint Then
   Begin
      qryAgregItem.Close;
      qryAgregItem.ParamByName('IDITENSRECDEV').AsInteger := qryDetIDITENSRECDEV.AsInteger;
      qryAgregItem.Open;
      //
      CodProduto  := qryDetCODARTIGO.AsString;
      DescProduto := qryDetDESCPROD.AsString;
      UnidMedida  := qryDetCODMEDIDA.AsString;
      Quantidade  := qryDetQTDERECEBDEVOL.AsFloat;
      ValorUnit   := qryDetVLRUNITARIO.AsFloat;
      ValorTotal  := qryDetVLRESTOQUE.AsFloat;
      //-- Busca os dados do ICMS do Item --------------------------------------------------------------------------------------------------
      PegaAgreItem(qryModeloICMSITEM.AsInteger,rBase,rValor);
      ICMS        := rValor;
      //-- Busca os dados do IPI do Item --------------------------------------------------------------------------------------------------
      PegaAgreItem(qryModeloIPIITEM.AsInteger,rBase,rValor);
      IPI         := rBase;
      ValorIPI    := rValor;
      qryDet.Next;
   End;
end;

procedure TFrmImpNFDevol.Imprimir;
Var
   rBase    : Double;
   rValor   : Double;
   iNumNota : LongInt;
begin
  iNumNota := Modulo.LeUltNumNotaDevol(Sistema.idEmpresa);
  With ConfigNota Do
     if (not qry.IsEmpty) and Inicializar then
     Begin
         qry.DisableControls;
         try
            FrmAguarde.Min := 0;
            FrmAguarde.Max := qry.RecordCount;
            FrmAguarde.Pos := 0;
            FrmAguarde.Mostra('Imprimindo...');
            qry.First;
            While Not qry.Eof Do
            Begin
               If qryFLGIMPRESSO.AsString = 'S' Then
               Begin
                  Inc( iNumNota );
                  SelNota(qryIDNFRECEBDEVOL.AsInteger);
                  ModeloNota       := StrToInt(dblcModelo.LookupValue);
                  IndEntSai        := 'X';
                  NumNota          := IntToStr(iNumNota);
                  NaturezaOp       := qryDetDESCCLASSIFISCAL.AsString;
                  CFOP             := qryDetCODFISCAL.AsString;
                  RazaoSocial      := qryRAZAOSOCIAL.AsString;
                  CGC_Cpf          := FormatMaskText('00.000.000/0000.000;0;',qryNUMDOCUMENTO.AsString);
                  Endereco         := qryENDERECO.AsString +' '+ qryCOMPLEMENTO.AsString;
                  Bairro           := qryBAIRRO.AsString;
                  CEP              := FormatMaskText('00000-999;0;',qryCEP.AsString);
                  Municipio        := qryCIDADE.AsString;
                  Fone_Fax         := qryTELEFONE.AsString;
                  UF               := qryCODESTADO.AsString;
               //--- Busca Inscrição Estadual --------------------------------------------------------------------------------------------------------
                  InscEstadual     := PegaInscricao(qryIDPESSOA.AsInteger,qryModeloIDDOCUMENTO.AsInteger);

                  DataEmissao      := qryDATAEMISNF.AsString;
                  DataEntSai       := qryDATAENTDEVOL.AsString;
               //-- Busca os dados do ICMS da Nota   --------------------------------------------------------------------------------------------------
                  PegaAgreNota(qryModeloICMSNOTA.AsInteger,rBase,rValor);
                  BaseICMS         := FormatFloat('#,##0.00',rBase);
                  ValorICMS        := FormatFloat('#,##0.00',rValor);
               //-- Busca os dados do ICMS Substituíção da Nota   -------------------------------------------------------------------------------------
                  PegaAgreNota(qryModeloICMSSUBSTITUICAO.AsInteger,rBase,rValor);
                  BaseICMSSubst    := FormatFloat('#,##0.00',rBase);
                  ValorICMSSubst   := FormatFloat('#,##0.00',rValor);
               //-- Busca os dados do Frete da Nota   -------------------------------------------------------------------------------------
                  PegaAgreNota(qryModeloFRETE.AsInteger,rBase,rValor);
                  ValorFrete       := FormatFloat('#,##0.00',rValor);
               //-- Busca os dados do Seguro da Nota   -------------------------------------------------------------------------------------
                  PegaAgreNota(qryModeloSEGURO.AsInteger,rBase,rValor);
                  ValorSeguro      := FormatFloat('#,##0.00',rValor);
               //-- Busca os dados do Outras dispesa da Nota   -------------------------------------------------------------------------------------
                  PegaAgreNota(qryModeloOUTRASDESP.AsInteger,rBase,rValor);
                  OutrasDesp       := FormatFloat('#,##0.00',rValor);
               //--------------------------------------------------------------------------------------------------------------------------------------
                  ValorTotIPI      := '';
                  ValorTotProduto  := FormatFloat('#,##0.00',qryDetTOTPROD.asFloat);
                  ValorTotNota     := FormatFloat('#,##0.00',qryVLRNOTAFISCAL.asFloat);
                  ImprimeNota;
               // Atualiza  o Numero correto da nota e indica que ja foi impressa
                  qry.Edit;
                  qryNUMNF.AsInteger      := iNumNota;
                  qryFLGIMPRESSO.AsString := 'S';
                  qry.Post;
               End;
               qry.Next;
               FrmAguarde.Pos := FrmAguarde.Pos + 1;
               Application.ProcessMessages;
            End;
            Try
               StartTransacao;
               qry.ApplyUpdates;
               qry.CommitUpdates;
               If Not Modulo.GravaUltNumNotaDevol(Sistema.idEmpresa,iNumNota) Then
                  Exit;
            Except
               RollBackTransacao;
               Raise;
            End;
         Finally
           FrmAguarde.Apaga;
           qry.EnableControls;
           finalizar;
         end;
     End;
end;

procedure TFrmImpNFDevol.PegaAgreNota(N: Int64; var rBase, rValor: Double);
begin
   If (Not qryAgregNota.IsEmpty) And (qryAgregNota.Locate('CODTIPOCUSTAGREG',IntToStr(N),[])) Then
      Begin
         rBase  := qryAgregNotaBASECALCULO.AsFloat;
         rValor := qryAgregNotaVLRAGREGADO.AsFloat;
      End
   Else
      Begin
         rBase  := 0;
         rValor := 0;
      End;
end;

procedure TFrmImpNFDevol.PegaAgreItem(N: Int64; var rBase, rValor: Double);
begin
   If (Not qryAgregItem.IsEmpty) And (qryAgregItem.Locate('CODTIPOCUSTAGREG',IntToStr(N),[])) Then
      Begin
         rBase  := qryAgregItemBASECALCULO.AsFloat;
         rValor := qryAgregItemVLRAGREGADO.AsFloat;
      End
   Else
      Begin
         rBase  := 0;
         rValor := 0;
      End;

end;

procedure TFrmImpNFDevol.btnImprimirClick(Sender: TObject);
begin
  inherited;
  If Trim(dblcModelo.Text) = '' Then
    Begin
       MsgDlg('Preencha o modelo','Erro',mtError,[mbOK],0);
       dblcModelo.SetFocus;
    End
  Else
    Imprimir;

end;

procedure TFrmImpNFDevol.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ConfigNota.Free;
end;

procedure TFrmImpNFDevol.grdNotaDblClick(Sender: TObject);
begin
  inherited;
  If (Not qry.IsEmpty)  Then
  Begin
      qry.Edit;
      If qryFLGIMPRESSO.AsString = 'S' Then
         qryFLGIMPRESSO.AsString := 'N'
      Else
         qryFLGIMPRESSO.AsString := 'S';
      qry.Post;
  End;

end;

function TFrmImpNFDevol.PegaInscricao(IdPessoa,
  IdDocumento: Integer): String;
Var
   SQL : String;  
begin
    Result := '';
    SQL    := ' SELECT NUMDOCUMENTO FROM DOCPESSOA '+
              ' WHERE ( IDDOCUMENTO = '+IntToStr(IdDocumento)+' )'+
              '  AND  ( IDPESSOA = '+IntToStr(IdPessoa)+' )';
    If FazQuery(DtmBaseDados.qry,SQL) Then
       Result := DtmBaseDados.qry.FieldByName('NUMDOCUMENTO').asString;
end;

end.
