unit FMTImpNFDevol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, uCmSqlParams, DBClient,
  uCMClientDataSet, Grids, Wwdbigrd, Wwdbgrid, CMProcuraSubTipo, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, CMDBLookupCombo,
  uMTConfigNfDevol, uCtrlConfigNFDevol, Mask, wwclient;

type
  TFrmMTImpNFDevol = class(TfrmSairAjuda)
    ToolbarSep971: TToolbarSep97;
    btnImprimir: TmaHelpBitBtn;
    spCds: TCMSqlParams;
    ds: TwwDataSource;
    plnSel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edDataI: TCMDateTimePicker;
    edDataF: TCMDateTimePicker;
    edNumNota: TRealEdit;
    dblcFornCli: TCMProcuraForCli;
    btnProc: TBitBtn;
    btnLimpar: TBitBtn;
    rgTipoNF: TRadioGroup;
    Panel2: TPanel;
    grdNota: TwwDBGrid;
    cdsModelo: TCMClientDataSet;
    spModelo: TCMSqlParams;
    CdsDet: TCMClientDataSet;
    CdsAgregItem: TCMClientDataSet;
    CdsAgregNota: TCMClientDataSet;
    spDet: TCMSqlParams;
    spAgregItem: TCMSqlParams;
    spAgregNota: TCMSqlParams;
    Label4: TLabel;
    dblcModelo: TCMDBLookupCombo;
    Cds: TwwClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLimparClick(Sender: TObject);
    procedure btnProcClick(Sender: TObject);
    procedure grdNotaDblClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    ConfigNota    : TMTConfigNfDevol;
    ConfigNFDevol : TCtrlConfigNFDevol;
    //
    Procedure SelNota( N : Int64);
    Procedure Procurar( n : Int64 = 0);
    procedure SetItensNota(var CodProduto, DescProduto, UnidMedida :String; var Quantidade, ValorUnit, ValorTotal, ICMS, IPI, ValorIPI : Double; var CanPrint: Boolean; iItemDet: Integer);
    Procedure Imprimir;
    Procedure PegaAgreNota(N :Int64; Var rBase,rValor : Double);
    Procedure PegaAgreItem(N :Int64; Var rBase,rValor : Double);
    Function  PegaInscricao(IdPessoa,IdDocumento : LongInt) : String;

  public
    { Public declarations }
  end;

var
  FrmMTImpNFDevol: TFrmMTImpNFDevol;

implementation

{$R *.DFM}

Uses uModulo, DBaseDados, fAguarde, uSistema, uMensErro;

procedure TFrmMTImpNFDevol.FormCreate(Sender: TObject);
begin
  inherited;
  ConfigNota := TMTConfigNfDevol.Create(Self);
  ConfigNota.BeforePrintLinhas := SetItensNota;

  ConfigNFDevol := TCtrlConfigNFDevol.Create;
  ConfigNFDevol.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  ConfigNFDevol.Cds    := Cds;

  spModelo.Open;
  
  Procurar(-1);
end;

procedure TFrmMTImpNFDevol.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ConfigNota.Free;
  ConfigNFDevol.Free;
end;

procedure TFrmMTImpNFDevol.Imprimir;
Var
   rBase    : Double;
   rValor   : Double;
   iNumNota : LongInt;
begin
  iNumNota := Modulo.LeUltNumNotaDevol(Sistema.idEmpresa);
  With ConfigNota Do
     if (not Cds.IsEmpty) and Inicializar then
     Begin
         Cds.DisableControls;
         try
            FrmAguarde.Min := 0;
            FrmAguarde.Max := Cds.RecordCount;
            FrmAguarde.Pos := 0;
            FrmAguarde.Mostra('Imprimindo...');
            Cds.First;
            While Not Cds.Eof Do
            Begin
               If Cds.FieldByName('FLGIMPRESSO').AsString = 'S' Then
               Begin
                  Inc( iNumNota );
                  SelNota(Cds.FieldByName('IDNFRECEBDEVOL').AsInteger);
                  ModeloNota       := StrToInt(dblcModelo.LookupValue);
                  IndEntSai        := 'X';
                  NumNota          := IntToStr(iNumNota);
                  NaturezaOp       := CdsDet.FieldByName('DESCCLASSIFISCAL').AsString;
                  CFOP             := CdsDet.FieldByName('CODFISCAL').AsString;
                  RazaoSocial      := Cds.FieldByName('RAZAOSOCIAL').AsString;
                  CGC_Cpf          := FormatMaskText('00.000.000/0000.000;0;',Cds.FieldByName('NUMDOCUMENTO').AsString);
                  Endereco         := Cds.FieldByName('ENDERECO').AsString +' '+ Cds.FieldByName('COMPLEMENTO').AsString;
                  Bairro           := Cds.FieldByName('BAIRRO').AsString;
                  CEP              := FormatMaskText('00000-999;0;',Cds.FieldByName('CEP').AsString);
                  Municipio        := Cds.FieldByName('CIDADE').AsString;
                  Fone_Fax         := Cds.FieldByName('TELEFONE').AsString;
                  UF               := Cds.FieldByName('CODESTADO').AsString;
               //--- Busca Inscrição Estadual --------------------------------------------------------------------------------------------------------
                  InscEstadual     := PegaInscricao(Cds.FieldByName('IDPESSOA').AsInteger,CdsModelo.FieldByName('IDDOCUMENTO').AsInteger);

                  DataEmissao      := Cds.FieldByName('DATAEMISNF').AsString;
                  DataEntSai       := Cds.FieldByName('DATAENTDEVOL').AsString;
               //-- Busca os dados do ICMS da Nota   --------------------------------------------------------------------------------------------------
                  PegaAgreNota(CdsModelo.FieldByName('ICMSNOTA').AsInteger,rBase,rValor);
                  BaseICMS         := FormatFloat('#,##0.00',rBase);
                  ValorICMS        := FormatFloat('#,##0.00',rValor);
               //-- Busca os dados do ICMS Substituíção da Nota   -------------------------------------------------------------------------------------
                  PegaAgreNota(CdsModelo.FieldByName('ICMSSUBSTITUICAO').AsInteger,rBase,rValor);
                  BaseICMSSubst    := FormatFloat('#,##0.00',rBase);
                  ValorICMSSubst   := FormatFloat('#,##0.00',rValor);
               //-- Busca os dados do Frete da Nota   -------------------------------------------------------------------------------------
                  PegaAgreNota(CdsModelo.FieldByName('FRETE').AsInteger,rBase,rValor);
                  ValorFrete       := FormatFloat('#,##0.00',rValor);
               //-- Busca os dados do Seguro da Nota   -------------------------------------------------------------------------------------
                  PegaAgreNota(CdsModelo.FieldByName('SEGURO').AsInteger,rBase,rValor);
                  ValorSeguro      := FormatFloat('#,##0.00',rValor);
               //-- Busca os dados do Outras dispesa da Nota   -------------------------------------------------------------------------------------
                  PegaAgreNota(CdsModelo.FieldByName('OUTRASDESP').AsInteger,rBase,rValor);
                  OutrasDesp       := FormatFloat('#,##0.00',rValor);
               //--------------------------------------------------------------------------------------------------------------------------------------
                  ValorTotIPI      := '';
                  ValorTotProduto  := FormatFloat('#,##0.00',CdsDet.FieldByName('TOTPROD').asFloat);
                  ValorTotNota     := FormatFloat('#,##0.00',Cds.FieldByName('VLRNOTAFISCAL').asFloat);
                  ImprimeNota;
               // Atualiza  o Numero correto da nota e indica que ja foi impressa
                  Cds.Edit;
                  Cds.FieldByName('NUMNF').AsInteger      := iNumNota;
                  Cds.FieldByName('FLGIMPRESSO').AsString := 'S';
                  Cds.Post;
               End;
               Cds.Next;
               FrmAguarde.Pos := FrmAguarde.Pos + 1;
               Application.ProcessMessages;
            End;

            If Not ConfigNFDevol.AtualizaNotasImpressas(Sistema.IdEmpresa,iNumNota) Then
               MsgDlg(ConfigNFDevol.MessageInfo,'Erro',mtError,[mbOK],0);

         Finally
           FrmAguarde.Apaga;
           Cds.EnableControls;
           finalizar;
         end;
         
         Procurar;
     End;
end;

procedure TFrmMTImpNFDevol.PegaAgreItem(N: Int64; var rBase,
  rValor: Double);
begin
   If (Not CdsAgregItem.IsEmpty) And (CdsAgregItem.Locate('CODTIPOCUSTAGREG',IntToStr(N),[])) Then
      Begin
         rBase  := CdsAgregItem.FieldByName('BASECALCULO').AsFloat;
         rValor := CdsAgregItem.FieldByName('VLRAGREGADO').AsFloat;
      End
   Else
      Begin
         rBase  := 0;
         rValor := 0;
      End;
end;

procedure TFrmMTImpNFDevol.PegaAgreNota(N: Int64; var rBase,
  rValor: Double);
begin
   If (Not CdsAgregNota.IsEmpty) And (CdsAgregNota.Locate('CODTIPOCUSTAGREG',IntToStr(N),[])) Then
      Begin
         rBase  := cdsAgregNota.FieldByName('BASECALCULO').AsFloat;
         rValor := cdsAgregNota.FieldByName('VLRAGREGADO').AsFloat;
      End
   Else
      Begin
         rBase  := 0;
         rValor := 0;
      End;
end;

function TFrmMTImpNFDevol.PegaInscricao(IdPessoa,
  IdDocumento: Integer): String;
Var
   CdsAux  : TClientDataSet;
begin
    CdsAux  := TClientDataSet.Create(nil);
    With TCMSqlParams.Create(Self) Do
      Try
        SQL.Text := ' SELECT NUMDOCUMENTO FROM DOCPESSOA '+
                    ' WHERE ( IDDOCUMENTO = '+IntToStr(IdDocumento)+' )'+
                    '  AND  ( IDPESSOA = '+IntToStr(IdPessoa)+' )';

        CdsAux.Data := Data;

        Result := CdsAux.FieldByName('NUMDOCUMENTO').asString;
      Finally
         CdsAux.Free;
         Free;
      End;

end;

procedure TFrmMTImpNFDevol.Procurar( n : Int64 );
begin
   With spCds Do
   Begin
      Sql.Clear;
      Sql.Add('SELECT                                       ');
      Sql.Add('      N.FLGIMPRESSO,                         ');
      Sql.Add('      N.IDNFRECEBDEVOL,                      ');
      Sql.Add('      N.NUMNF,                               ');
      Sql.Add('      N.COMPLNF,                             ');
      Sql.Add('      N.IDPESSOA,                            ');
      Sql.Add('      N.CODDOCUMENTO,                        ');
      Sql.Add('      N.FLGTIPONOTA,                         ');
      Sql.Add('      N.DATAEMISNF,                          ');
      Sql.Add('      N.IDFORCLI,                            ');
      Sql.Add('      N.DATAENTDEVOL,                        ');
      Sql.Add('      N.VLRNOTAFISCAL,                       ');
      Sql.Add('      N.PLNCODIGO,                           ');
      Sql.Add('      N.IDNFREFERENCIA,                      ');
      Sql.Add('      P.RAZAOSOCIAL,                         ');
      Sql.Add('      P.NOME,                                ');
      Sql.Add('      P.NUMDOCUMENTO,                        ');
      Sql.Add('     (E.LOGRADOURO ||'' ''|| E.NUMERO) AS ENDERECO, ');
      Sql.Add('      E.COMPLEMENTO,                              ');
      Sql.Add('      E.BAIRRO,                                   ');
      Sql.Add('      E.CEP,                                      ');
      Sql.Add('      ES.CODESTADO,                               ');
      Sql.Add('      P.EMAIL,                                    ');
      Sql.Add('      DECODE(E.IDCIDADES, NULL, E.CIDADE,C.NOME) AS CIDADE,');
      Sql.Add('      TC.TELEFONE,                                ');
      Sql.Add('      TC.DDD,                                     ');
      Sql.Add('      FC.FAX,                                     ');
      Sql.Add('      FC.DDDFAX                                   ');
      Sql.Add('FROM                                              ');
      Sql.Add('     NFRECEBDEVOL N,                              ');
      Sql.Add('     PESSOA P,                                    ');
      Sql.Add('     ENDPESS E,                                   ');
      Sql.Add('     CIDADES C,                                   ');
      Sql.Add('     ESTADO  ES,                                  ');
      Sql.Add('     (                                            ');
      Sql.Add('      SELECT TP.IDENDERECO, TP.NUMERO AS TELEFONE,TP.DDI,TP.DDD ');
      Sql.Add('      FROM  TELENDPESS  TP,                                  ');
      Sql.Add('           (SELECT IDENDERECO, MAX(IDTELEFONE) AS IDTELEFONE ');
      Sql.Add('            FROM TELENDPESS                                  ');
      Sql.Add('            WHERE (TIPO LIKE ''%C%'')                          ');
      Sql.Add('            GROUP BY IDENDERECO) C                           ');
      Sql.Add('      WHERE (TP.IDENDERECO = C.IDENDERECO) AND               ');
      Sql.Add('            (TP.IDTELEFONE = C.IDTELEFONE)                   ');
      Sql.Add('      ) TC,                                                  ');
      Sql.Add('      (SELECT TP.IDENDERECO, TP.NUMERO AS FAX,TP.DDI AS DDIFAX ,TP.DDD AS DDDFAX');
      Sql.Add('      FROM  TELENDPESS  TP,                                  ');
      Sql.Add('           (SELECT IDENDERECO, MAX(IDTELEFONE) AS IDTELEFONE ');
      Sql.Add('            FROM TELENDPESS                                  ');
      Sql.Add('            WHERE (TIPO LIKE ''%F%'')                        ');
      Sql.Add('            GROUP BY IDENDERECO) C                           ');
      Sql.Add('      WHERE (TP.IDENDERECO = C.IDENDERECO) AND               ');
      Sql.Add('            (TP.IDTELEFONE = C.IDTELEFONE)                   ');
      Sql.Add('      ) FC                                                   ');
      Sql.Add('WHERE                                                        ');
      Case rgTipoNF.ItemIndex Of
         0 : Sql.Add('         (N.FLGTIPONOTA   = ''D'') ');
         1 : Sql.Add('         (N.FLGTIPONOTA   = ''E'') ');
         2 : Sql.Add('         (N.FLGTIPONOTA   = ''S'') ');
      End;
      Sql.Add('   AND   ((N.FLGIMPRESSO  = ''N'') OR (N.FLGIMPRESSO IS NULL))');
      If n <> 0 Then
         SQL.Add('AND (N.NUMNF ='+IntToStr(n)+')')
      Else
      If edNumNota.Value > 0 Then
         SQL.Add('AND (N.NUMNF ='+edNumNota.Text+')')
      Else
         Begin
            If Trim(EdDataI.Text) <> '' Then
               SQL.Add('AND (N.DATAENTDEVOL >= TO_DATE('''+edDataI.Text+''',''DD/MM/YYYY''))');
            If Trim(EdDataF.Text) <> '' Then
               SQL.Add('AND (N.DATAENTDEVOL <= TO_DATE('''+edDataF.Text+''',''DD/MM/YYYY''))');
            If Trim(dblcFornCli.Text) <> '' Then
               SQL.Add('AND (N.IDFORCLI = '+IntToStr(dblcFornCli.ForCliReg.id)+')');
         End;
      Sql.Add('     AND (P.IDPESSOA       = N.IDFORCLI )       ');
      Sql.Add('     AND (E.IDPESSOA(+)    = P.IDPESSOA)        ');
      Sql.Add('     AND (E.IDENDERECO(+)  = P.IDENDCOMERCIAL)  ');
      Sql.Add('     AND (E.IDCIDADES      = C.IDCIDADES(+))    ');
      Sql.Add('     AND (ES.IDESTADO(+)   = C.IDESTADO)        ');
      Sql.Add('     AND (TC.IDENDERECO(+) = E.IDENDERECO)      ');
      Sql.Add('     AND (FC.IDENDERECO(+) = E.IDENDERECO)      ');
      Sql.Add('ORDER BY  N.DATAENTDEVOL ');
      Open;
      Cds.ControlType.Add('FLGIMPRESSO;CheckBox;S;N');
   End;
end;

procedure TFrmMTImpNFDevol.SelNota(N: Int64);
begin
  spDet.Prepare;
  spDet.ParamByName('IDNFRECEBDEVOL').AsInteger := n;
  spDet.Open;
  CdsDet.First;

  spAgregNota.Prepare;
  spAgregNota.ParamByName('IDNFRECEBDEVOL').AsInteger := n;
  spAgregNota.Open;
  
end;

procedure TFrmMTImpNFDevol.SetItensNota(var CodProduto, DescProduto,
  UnidMedida: String; var Quantidade, ValorUnit, ValorTotal, ICMS, IPI,
  ValorIPI: Double; var CanPrint: Boolean; iItemDet: Integer);
Var
   rBase  : Double;
   rValor : Double;
begin
   CanPrint := Not CdsDet.Eof;
   //
   If CanPrint Then
   Begin
      spAgregItem.Prepare;
      spAgregItem.ParamByName('IDITENSRECDEV').AsInteger := CdsDet.FieldByName('IDITENSRECDEV').AsInteger;
      spAgregItem.Open;
      //
      CodProduto  := CdsDet.FieldByName('CODARTIGO').AsString;
      DescProduto := CdsDet.FieldByName('DESCPROD').AsString;
      UnidMedida  := CdsDet.FieldByName('CODMEDIDA').AsString;
      Quantidade  := CdsDet.FieldByName('QTDERECEBDEVOL').AsFloat;
      ValorUnit   := CdsDet.FieldByName('VLRUNITARIO').AsFloat;
      ValorTotal  := CdsDet.FieldByName('VLRESTOQUE').AsFloat;
      //-- Busca os dados do ICMS do Item --------------------------------------------------------------------------------------------------
      PegaAgreItem(CdsModelo.FieldByName('ICMSITEM').AsInteger,rBase,rValor);
      ICMS        := rValor;
      //-- Busca os dados do IPI do Item --------------------------------------------------------------------------------------------------
      PegaAgreItem(CdsModelo.FieldByName('IPIITEM').AsInteger,rBase,rValor);
      IPI         := rBase;
      ValorIPI    := rValor;
      CdsDet.Next;
   End;
end;

procedure TFrmMTImpNFDevol.btnLimparClick(Sender: TObject);
begin
  inherited;
  edNumNota.Clear;
  edDataI.ClearDateTime;
  edDataF.ClearDateTime;
  dblcFornCli.Text := '';  
end;

procedure TFrmMTImpNFDevol.btnProcClick(Sender: TObject);
begin
  inherited;
  Procurar;
end;

procedure TFrmMTImpNFDevol.grdNotaDblClick(Sender: TObject);
begin
  inherited;
  If (Not Cds.IsEmpty)  Then
     Begin
         Cds.Edit;
         If Cds.FieldByName('FLGIMPRESSO').AsString = 'S' Then
            Cds.FieldByName('FLGIMPRESSO').AsString := 'N'
         Else
            Cds.FieldByName('FLGIMPRESSO').AsString := 'S';
         Cds.Post;
     End;
end;

procedure TFrmMTImpNFDevol.btnImprimirClick(Sender: TObject);
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

end.
