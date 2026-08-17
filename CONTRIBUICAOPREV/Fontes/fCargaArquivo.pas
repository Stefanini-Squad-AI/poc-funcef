//***************************************************************************************
//***********************-----HISTÓRICO DE ALTERAÇÕES-----*******************************
//***************************************************************************************

//***************************************************************************************
//Nº SIG:            34603
//Data da Alteração: 02/12/2016
//Alteração Form:    comentário na linha nro e retirada do campo MESPROCESSAMENTO do field
//                   list da qryBenefSald
//Responsável:       Michelle Mota
//Descrição:         Ajuste para não interromper processamento de arquivos.
//***************************************************************************************
//Nº SIG:            27626.32406
//Data da Alteração: 28/07/2015
//Alteração Form:    mudar chamada de atualização para PCK_BENEFSALDFAB.SP_ATUALIZASALDO
//Responsável:       William Santana/ Andre Imakawa
//Descrição:         Ajustes para chamada package pck.BenefSaldFab
//***************************************************************************************
//Nº SOL:            253577-17564
//Nº PPM             987196
//Data da Alteração: 28/07/2015
//Alteração Form:    (.dfm) btnSaldoFAB
//Responsável:       Edilaine Ferraresi
//Descrição:         Ajustes para Equacionamento do Deficit
//***************************************************************************************
//Nº SOL:            145044
//Nº KINTANA         966308
//Data da Alteração: 12/05/2014
//Alteração Form:    Criação do form
//Responsável:       Tadeu Passos/ Douglas Siqueira / Higor Nayde / William Santana
//Descrição:         Benefício Saldado e FAB
//**************************************************************************************

unit fCargaArquivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, TB97Ctls, UMensErro, ComObj, DBTables,
  Db, Wwquery, dBaseDados, uSistema, FTelaAut, wwdbdatetimepicker,
  CMDateTimePicker, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass,
  ppReport, FPreview, ppCtrls, ppVar, ppPrnabl, ppBands, ppCache;

type
  TfrmCargaArquivo = class(TfrmOkCancelar)
    edtNomeArquivo: TEdit;
    Label1: TLabel;
    Dialog: TOpenDialog;
    SbtnAbrirArquivoRet: TSpeedButton;
    btnAtualizar: TBitBtn;
    Label2: TLabel;
    bbtnProcessar: TBitBtn;
    btnRevisaoIndice: TToolbarButton97;
    bbtnDesfazer: TBitBtn;
    qryCarga: TwwQuery;
    qryBenefSald: TwwQuery;
    updBenefSald: TUpdateSQL;
    updCarga: TUpdateSQL;
    qryAux: TwwQuery;
    qryHistorico: TwwQuery;
    updHistorico: TUpdateSQL;
    lbl1: TLabel;
    qryHistoricoIDHSTALTBENEFSALDFAB: TFloatField;
    qryHistoricoIDPESSOA: TFloatField;
    qryHistoricoIDTITULAR: TFloatField;
    qryHistoricoTIPO: TStringField;
    qryHistoricoCAMPO: TStringField;
    qryHistoricoVALORANTERIOR: TStringField;
    qryHistoricoVALORALTERADO: TStringField;
    qryHistoricoMESREFERENCIA: TStringField;
    tmpSaldamento: TCMDateTimePicker;
    tmpAtuAte: TCMDateTimePicker;
    qryBenefSaldIDBENEFSALDFAB: TFloatField;
    qryBenefSaldIDCARGAARQUIVO: TFloatField;
    qryBenefSaldIDPESSOA: TFloatField;
    qryBenefSaldIDTITULAR: TFloatField;
    qryBenefSaldMESREFERENCIA: TStringField;
    qryBenefSaldVALORINDICE: TFloatField;
    qryBenefSaldINDICE: TStringField;
    qryBenefSaldINDICEACUMULADO: TFloatField;
    qryBenefSaldBENEFSALDADO: TFloatField;
    qryBenefSaldSALDOFAB: TFloatField;
    qryDesfazerCarga: TwwQuery;
    qryDesfazerCargaIDCARGABENEFSALDFAB: TFloatField;
    qryDesfazerCargaIDCARGAARQUIVO: TFloatField;
    qryDesfazerCargaIDPESSOA: TFloatField;
    qryDesfazerCargaIDTITULAR: TFloatField;
    qryDesfazerCargaDATASALDAMENTO: TDateTimeField;
    qryDesfazerCargaDATAIMPORTACAO: TDateTimeField;
    qryDesfazerCargaPCS: TStringField;
    qryDesfazerCargaNOMECARGO: TStringField;
    qryDesfazerCargaVALORCARGO: TFloatField;
    qryDesfazerCargaPERCENTATS: TFloatField;
    qryDesfazerCargaVALORATS: TFloatField;
    qryDesfazerCargaVPGRATSEMADICTEMPSERV: TFloatField;
    qryDesfazerCargaVPGIPTEMPOSERV: TFloatField;
    qryDesfazerCargaVPGIPSEMSALCOMFUNC: TFloatField;
    qryDesfazerCargaVPEXBH: TFloatField;
    qryDesfazerCargaADICCOMP: TFloatField;
    qryDesfazerCargaADICINCORP: TFloatField;
    qryDesfazerCargaADICNOTURNO: TFloatField;
    qryDesfazerCargaADICINSALU: TFloatField;
    qryDesfazerCargaADICPERI: TFloatField;
    qryDesfazerCargaINCORPJUD: TFloatField;
    qryDesfazerCargaCODCARGOCOMIS: TFloatField;
    qryDesfazerCargaNOMECARGOCOMIS: TStringField;
    qryDesfazerCargaVALORCARGOCOMIS: TFloatField;
    qryDesfazerCargaSALPART: TFloatField;
    qryDesfazerCargaBENEFICIOSALDADO: TFloatField;
    qryDesfazerCargaPERCENTPBE: TFloatField;
    qryDesfazerCargaULTIMOMESPROC: TStringField;
    qryDesfazerCargaDATAELEGIBILIDADE: TDateTimeField;
    qryDesfazerBenef: TwwQuery;
    qryDesfazerBenefIDBENEFSALDFAB: TFloatField;
    qryDesfazerBenefIDCARGAARQUIVO: TFloatField;
    qryDesfazerBenefIDPESSOA: TFloatField;
    qryDesfazerBenefIDTITULAR: TFloatField;
    qryDesfazerBenefMESREFERENCIA: TStringField;
    qryDesfazerBenefVALORINDICE: TFloatField;
    qryDesfazerBenefINDICE: TStringField;
    qryDesfazerBenefINDICEACUMULADO: TFloatField;
    qryDesfazerBenefBENEFSALDADO: TFloatField;
    qryDesfazerBenefSALDOFAB: TFloatField;
    qryDesfazer: TwwQuery;
    qryDesfazerIDTITULAR: TFloatField;
    qryDesfazerIDPESSOA: TFloatField;
    qryDesfazerIDCARGAARQUIVO: TFloatField;
    qryCargaIDCARGABENEFSALDFAB: TFloatField;
    qryCargaIDCARGAARQUIVO: TFloatField;
    qryCargaIDPESSOA: TFloatField;
    qryCargaIDTITULAR: TFloatField;
    qryCargaDATASALDAMENTO: TDateTimeField;
    qryCargaDATAIMPORTACAO: TDateTimeField;
    qryCargaPCS: TStringField;
    qryCargaNOMECARGO: TStringField;
    qryCargaVALORCARGO: TFloatField;
    qryCargaPERCENTATS: TFloatField;
    qryCargaVALORATS: TFloatField;
    qryCargaVPGRATSEMADICTEMPSERV: TFloatField;
    qryCargaVPGIPTEMPOSERV: TFloatField;
    qryCargaVPGIPSEMSALCOMFUNC: TFloatField;
    qryCargaVPEXBH: TFloatField;
    qryCargaADICCOMP: TFloatField;
    qryCargaADICINCORP: TFloatField;
    qryCargaADICNOTURNO: TFloatField;
    qryCargaADICINSALU: TFloatField;
    qryCargaADICPERI: TFloatField;
    qryCargaINCORPJUD: TFloatField;
    qryCargaCOMPSALPADRAO: TFloatField;
    qryCargaCODCARGOCOMIS: TFloatField;
    qryCargaNOMECARGOCOMIS: TStringField;
    qryCargaVALORCARGOCOMIS: TFloatField;
    qryCargaSALPART: TFloatField;
    qryCargaBENEFICIOSALDADO: TFloatField;
    qryCargaPERCENTPBE: TFloatField;
    qryCargaBINSS: TFloatField;
    qryCargaULTIMOMESPROC: TStringField;
    qryCargaDATAELEGIBILIDADE: TDateTimeField;
    btnSaldoFAB: TBitBtn;
    rptSaldoFAB: TppReport;
    ppSaldoFAB: TppDBPipeline;
    dsSaldoFAB: TDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage2: TppImage;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel16: TppLabel;
    ppLabel28: TppLabel;
    ppLine9: TppLine;
    ppLabel1: TppLabel;
    ppShape10: TppShape;
    ppLabel15: TppLabel;
    ppShape9: TppShape;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppShape1: TppShape;
    ppShape2: TppShape;
    qryBenefSaldTRIGGERUSERINCLUSAO: TStringField;
    qryBenefSaldTRIGGERDTINCLUSAO: TDateTimeField;
    procedure SbtnAbrirArquivoRetClick(Sender: TObject);
    procedure btnRevisaoIndiceClick(Sender: TObject);
    procedure bbtnProcessarClick(Sender: TObject);
    function Validalayout(Excel : Variant) : Boolean;
    function JaImportado(IdPessoa, IdTitular : Integer ; Matricula : String) : Boolean;
    function SeVazio(Valor : String) : Real;
    procedure bbtnDesfazerClick(Sender: TObject);
    function UltimaLinha(Excel : Variant; linha : Integer) : Boolean;
    procedure MostraProgressoImportacao(msg: string ; Excel : Variant);
    procedure btnAtualizarClick(Sender: TObject);
    function AtualizarDadosDoArquivo : Boolean;
    procedure GravarHistorico(qry : TwwQuery);
    function AtualizarBenefSaldFAB : Boolean;
    function Exec_SP_Atualiza_Benef_Sald_FAB(AtualizarTudo : Integer; AtualizarAte: TDateTime) : Boolean;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaldoFABClick(Sender: TObject);
    procedure rptSaldoFABBeforePrint(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    vMesReferencia, vMesAnterior : String;
  end;

var
  frmCargaArquivo: TfrmCargaArquivo;

implementation

uses FRevisaoIndice, FDesfazerCarga, fprogresso,
     FMesInicioRelSaldoFab;         // edilaine - SOL 253577-17564 / PPM 987196

{$R *.DFM}

procedure TfrmCargaArquivo.SbtnAbrirArquivoRetClick(Sender: TObject);
begin
  // Pegando o arquivo
  dialog.Filter := '*.xlsx|*.xlsx';
  if not dialog.Execute then
    exit
  else
    edtNomeArquivo.Text := ExtractFileName(dialog.FileName);
end;

procedure TfrmCargaArquivo.btnRevisaoIndiceClick(Sender: TObject);
begin
  btnRevisaoIndice.Down := False;
  AbrirForm(frmRevisaoIndice, TfrmRevisaoIndice, false);
  frmCargaArquivo.Enabled := false;
end;

procedure TfrmCargaArquivo.bbtnProcessarClick(Sender: TObject);
var
  Excel, oSheet : Variant;
  linha, Id, IdCargaArquivo, IdPessoa, IdTitular, qtdeLinhas : integer;
  Matricula, jaImportados ,dtEleg: String;
  houveInsert : Boolean;
begin
  if Trim(edtNomeArquivo.Text) = '' then
    MsgDlg('Favor selecionar arquivo de importação!','Atenção',mtInformation,[mbOk,mbHelp],0)      
  else if MsgDlg('Confirma a importação dos dados constantes na planilha?','Atenção',mtInformation,[mbYes,mbNo],0) = mrYes then
    begin

        Screen.Cursor := crHourGlass;

        // Cria o objeto
        Excel := CreateOleObject('Excel.application');
        Excel.Visible := False;
        // Abre o Arquivo
        Excel.WorkBooks.Open(ExpandUNCFileName(dialog.FileName),1);
      Try
        Try
          // Valida o layout do arquivo excel
          if ValidaLayout(Excel) then
            begin
              // Prepara e mostra a barra de progresso
              MostraProgressoImportacao('Importando dados do arquivo...', Excel);

              // Indica a partir de qual linha começar a pegar os registros
              linha := 2;

              //para verificar duplicidade de matriculas no arquivo, usando a tabela BENEFSALD_TEMP
              // Andre Imakawa - SIG 27626.32406 - Inicio
              {
              qryAux.Close;
              qryAux.SQL.Clear;
              qryAux.SQL.Add('DELETE FROM BENEFSALD_TEMP');
              qryAux.ExecSQL;
              }
              // Andre Imakawa - SIG 27626.32406 - Fim

              // Pegando o sequencial por importação de arquivo,
              qryAux.Close;
              qryAux.SQL.Clear;
              qryAux.SQL.Add('SELECT NVL(MAX(IDCARGAARQUIVO),0) IDCARGAARQUIVO FROM CM.CARGABENEFSALDFAB');
              qryAux.Open;
              IdCargaArquivo := qryAux.FieldByName('IDCARGAARQUIVO').AsInteger + 1;

              // Pegando o sequencial para campo chave para usar nas duas tabelas
              qryAux.Close;
              qryAux.SQL.Clear;
              //qryAux.SQL.Add('SELECT NVL(MAX(IDCARGABENEFSALDFAB),0) ID FROM CM.CARGABENEFSALDFAB '); // Andre Imakawa - SIG 27626.32406
              qryAux.SQL.Add('SELECT  CM.SEQ_CARGABENEFSALDFAB.NEXTVAL AS ID FROM DUAL'); // Andre Imakawa - SIG 27626.32406
              qryAux.Open;
              Id := qryAux.FieldByName('ID').AsInteger;

              if not dtmBaseDados.dbBaseDados.InTransaction then
                dtmBaseDados.dbBaseDados.StartTransaction;

              qryCarga.Close;
              qryCarga.Open;

              qryBenefSald.Close;
              qryBenefSald.Open;

              houveInsert  := False;
              jaImportados := '';

              while not ((UltimaLinha(Excel, linha)) or (frmProgresso.Cancelou)) do
                begin
                  Matricula := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 1].Value));
                  // O Excel remove os zeros do lado direito do número, nesse caso abaixo é recolocado esses zeros.
                  // mas é de responsabilidade do usuário que o arquivo esteja com a formatação correta ( tipo texto )
                  //while Length(Matricula) < 7 do
                  // Matricula := '0' + Matricula;

                  // Pegando o IDPESSOA para se usado na gravação das duas tabelas
                  qryAux.Close;
                  qryAux.SQL.Clear;
                  qryAux.SQL.Add('SELECT D.IDPESSOA, D.IDTITULAR, P.DATANASC, P.SEXO ,                                ');
                  qryAux.SQL.Add('       TRUNC((MONTHS_BETWEEN(SYSDATE, P.DATANASC)) / 12 ,2) AS IDADE,               ');
                  qryAux.SQL.Add('       TRUNC((MONTHS_BETWEEN(''01/09/2006'', P.DATANASC)) / 12, 2) AS IDADEEM2006,  ');
                  qryAux.SQL.Add('       NVL((  SELECT DISTINCT B.DATAINICIO                                          ');
                  qryAux.SQL.Add('               FROM BENEFBFCIARIO B                                                 ');
                  qryAux.SQL.Add('              WHERE B.FONTEPAGADORA = 2                                             ');
                  qryAux.SQL.Add('               AND B.IDSITBENEFICIO = 1                                             ');
                  qryAux.SQL.Add('               AND D.IDPESSOA = B.IDPESSOA                                          ');
                  qryAux.SQL.Add('               AND D.IDTITULAR = B.IDTITULAR                                        ');
                  qryAux.SQL.Add('             ),''31/08/2006'') DATAINICIOINSS,                                      ');
                  //qryAux.SQL.Add('             DECODE(P.SEXO, ''F'', ADD_MONTHS(P.DATANASC,48*12),                  ');// Andre Imakawa - SIG 27626.32406
                  //qryAux.SQL.Add('                                 ADD_MONTHS(P.DATANASC,53*12)) DTELEG,            ');// Andre Imakawa - SIG 27626.32406
                  qryAux.SQL.Add('       CM.PCK_BENEFSALDFAB.FN_DATAELEG(D.IDPESSOA) DATAELEGE                        ');// Andre Imakawa - SIG 27626.32406
                  qryAux.SQL.Add('       FROM DEPENTIT D, PESSOAFISICA P                                              ');
                  qryAux.SQL.Add('    WHERE MATRICULA = '+QuotedStr(Matricula)                                         );
                  qryAux.SQL.Add('    AND D.IDPESSOA = P.IDPESSOA                                                     ');

                  try
                   qryAux.Open;
                  except
                   MsgDlg('Inconsistência no benefício INSS para a matrícula '+ Matricula+'. Verifique.','Erro',mtError,[mbOk],0);
                  end;

                  if qryAux.isEmpty then
                  begin
                   inc(linha);
                   continue;
                  end;

                  IdPessoa  := qryAux.FieldByName('IDPESSOA').AsInteger;
                  IdTitular := qryAux.FieldByName('IDTITULAR').AsInteger;
                  dtEleg    := '';
                  // Andre Imakawa - SIG 27626.32406 - Inicio
                  {
                  if ((qryAux.FieldByName('IDADEEM2006').AsFloat >= 48) and (qryAux.FieldByName('SEXO').AsString = 'F'))
                       or
                     ((qryAux.FieldByName('IDADEEM2006').AsFloat >= 53) and (qryAux.FieldByName('SEXO').AsString = 'M')) then
                      dtEleg := '01/09/2006'
                  else
                  if (qryAux.FieldByName('DATAINICIOINSS').AsDateTime >= StrToDate('01/09/2006')) and
                     (qryAux.FieldByName('DATAINICIOINSS').AsDateTime <= qryAux.FieldByName('DTELEG').AsDateTime) then
                    dtEleg :=  qryAux.FieldByName('DATAINICIOINSS').AsString
                  else
                    dtEleg :=  qryAux.FieldByName('DTELEG').AsString;
                  }
                  dtEleg :=  qryAux.FieldByName('DATAELEGE').AsString;
                  // Andre Imakawa - SIG 27626.32406 - Fim

                  // Verificando se já foi feita importação para essa Pessoa
                  if JaImportado(IdPessoa, IdTitular, Matricula) then
                    begin
                      if jaImportados = '' then
                        jaImportados := Matricula
                      else
                        jaImportados := jaImportados + ', ' + Matricula;
                    end
                  else
                    begin
                      // Incrementando o Id que será usado nas duas tabelas
                      Inc(Id);

                      // Inserindo em CARGABENEFSALDFAB
                      qryCarga.Insert;
                      qryCargaIDCARGABENEFSALDFAB.AsInteger := Id;
                      qryCargaIDCARGAARQUIVO.AsInteger      := IdCargaArquivo;
                      qryCargaIDPESSOA.AsInteger            := IdPessoa;
                      qryCargaIDTITULAR.AsInteger           := IdTitular;
                      qryCargaDATASALDAMENTO.AsDateTime     := tmpSaldamento.Date;
                      qryCargaDATAIMPORTACAO.AsString       := FormatDateTime('DD/MM/yyyy', Now);
                      qryCargaNOMECARGO.AsString            := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 2].Value));
                      qryCargaPERCENTATS.AsFloat            := SeVazio(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 3].Value)));
                      qryCargaVALORCARGO.AsFloat            := SeVazio(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 4].Value)));
                      qryCargaVALORATS.AsFloat              := SeVazio(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 5].Value)));
                      qryCargaVPGRATSEMADICTEMPSERV.AsFloat := SeVazio(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 6].Value)));
                      qryCargaVPGIPTEMPOSERV.AsFloat        := SeVazio(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 7].Value)));
                      qryCargaVPGIPSEMSALCOMFUNC.AsFloat    := SeVazio(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 8].Value)));
                      qryCargaVPEXBH.AsFloat                := SeVazio(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 9].Value)));
                      qryCargaADICCOMP.AsFloat              := SeVazio(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 10].Value)));
                      qryCargaADICINCORP.AsFloat            := SeVazio(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 11].Value)));
                      qryCargaADICNOTURNO.AsFloat           := SeVazio(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 12].Value)));
                      qryCargaADICINSALU.AsFloat            := SeVazio(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 13].Value)));
                      qryCargaADICPERI.AsFloat              := SeVazio(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 14].Value)));
                      qryCargaINCORPJUD.AsFloat             := SeVazio(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 15].Value)));
                      qryCargaCODCARGOCOMIS.AsFloat         := SeVazio(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 16].Value)));
                      qryCargaNOMECARGOCOMIS.AsString       :=         Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 17].Value));
                      qryCargaVALORCARGOCOMIS.AsFloat       := SeVazio(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 18].Value)));
                      qryCargaCOMPSALPADRAO.AsFloat         := SeVazio(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 19].Value))); //Xavier - SOL 253577-17564 / PPM 987196
                      qryCargaSALPART.AsFloat               := SeVazio(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 20].Value)));
                      qryCargaBENEFICIOSALDADO.AsFloat      := SeVazio(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 21].Value)));
                      qryCargaPERCENTPBE.AsFloat            := SeVazio(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 22].Value)));
                      qryCargaBINSS.AsFloat                 := SeVazio(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 23].Value)));
                      qryCargaCOMPSALPADRAO.AsFloat         := 0;
                      qryCargaPCS.AsString                  := 'PCS 89';
                      qryCargaULTIMOMESPROC.asString        := '08/2006';
                      if not(dtEleg = EmptyStr) then
                      qryCargaDATAELEGIBILIDADE.AsDateTime  := StrToDate(dtEleg);
                      qryCarga.Post;

                      // Inserindo em BENEFSALDFAB
                      qryBenefSald.Insert;
                      qryBenefSaldIDBENEFSALDFAB.AsInteger      := Id;
                      qryBenefSaldIDCARGAARQUIVO.AsInteger      := IdCargaArquivo;
                      qryBenefSaldIDPESSOA.AsInteger            := IdPessoa;
                      qryBenefSaldIDTITULAR.AsInteger           := IdTitular;
                      qryBenefSaldBENEFSALDADO.AsFloat          := SeVazio(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 21].Value)));
                      //qryBenefSaldMESREFERENCIA.AsString      := Copy(tmpSaldamento.Text,4,7);                                 // edilaine - SOL 253577-17564 / PPM 987196 - comentado
                      qryBenefSaldMESREFERENCIA.AsString        := Copy(tmpSaldamento.Text,7,4)+Copy(tmpSaldamento.Text,3,3);    // edilaine - SOL 253577-17564 / PPM 987196
                      //qryBenefSaldMESPROCESSAMENTO.AsString     := '2006/09';// Andre Imakawa - SIG 27626.32406  //Michelle Mota - SIG34603
                      qryBenefSaldINDICE.AsString               := '';
                      qryBenefSaldINDICEACUMULADO.AsFloat       := 1;
                      qryBenefSaldVALORINDICE.AsFloat           := 1;
                      qryBenefSaldSALDOFAB.AsFloat              := 0;
                      qryBenefSaldTRIGGERUSERINCLUSAO.AsString  := 'CM'+IntToStr(sistema.IdUsuario);// Andre Imakawa - SIG 27626.32406
                      qryBenefSaldTRIGGERDTINCLUSAO.AsDateTime  := now;// Andre Imakawa - SIG 27626.32406

                      qryBenefSald.Post;

                      // Andre Imakawa - SIG 27626.32406 - Inicio
                      {
                      qryAux.Close;
                      qryAux.SQL.Clear;
                      qryAux.SQL.Add('INSERT INTO BENEFSALD_TEMP VALUES (' + quotedStr(Matricula) + ')' );
                      qryAux.ExecSQL;
                      }
                      // Andre Imakawa - SIG 27626.32406 - Fim

                      houveInsert := True;
                      
                    end;

                  Inc(linha);
                  frmProgresso.AndaFormProgresso(linha - 2);
                  frmProgresso.Refresh;
                end;

              if not frmProgresso.Cancelou then
                begin
                  // Apenas dá o Apply se ao menos um resgistro fo inserido.
                  if houveInsert then
                    begin
                      frmProgresso.MostraFormProgresso('Gravando os dados da importação.',
                                                       True,
                                                       False,
                                                       False,
                                                       0,0);
                      frmProgresso.lblContador.Caption := '';
                      frmProgresso.btnCancelar.Visible := False;
                      frmProgresso.Panel1.Visible := False;
                      frmProgresso.Refresh;

                      qryCarga.ApplyUpdates;
                      qryBenefSald.ApplyUpdates;

                      MsgDlg('Importação concluída.','Atenção',mtInformation,[mbOk],0);
                    end;

                  if jaImportados <> EmptyStr then
                    MsgDlg('As matrículas <' + jaImportados + '> já possuem benefício saldado cadastrado. ' +
                           'Importação não realizada para essas matrículas.','Atenção',mtInformation,[mbOk],0);
                   {
                    mmMotivo.Lines.Add('As matrículas <' + jaImportados + '> já possuem benefício saldado cadastrado. ' +
                           'Importação não realizada para essas matrículas.');
                   }

                  if dtmBaseDados.dbBaseDados.InTransaction then
                    dtmBaseDados.dbBaseDados.Commit;
                end
              else
                begin
                  qryCarga.CancelUpdates;
                  qryBenefSald.CancelUpdates;
                  if dtmBaseDados.dbBaseDados.InTransaction then
                    dtmBaseDados.dbBaseDados.Rollback;
                end;
            end
          else
            begin
              MsgDlg('O leiaute do arquivo selecionado não está correto.','Atenção',mtInformation,[mbOk,mbHelp],0);
              Screen.Cursor := crDefault;
            end;
        except
          if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Rollback;
        end;
      finally
        Excel.ActiveWorkBook.Saved:= 1;
        Excel.DisplayAlerts:= 0;
        Excel.ActiveWorkBook.Close(SaveChanges:= 0);
        Excel.Workbooks.Close;
        Excel.Quit;  
        Excel := Unassigned;
        Screen.Cursor := crDefault;
        frmProgresso.EscondeFormProgresso;
      end;
    end;
end;

function TfrmCargaArquivo.UltimaLinha(Excel : Variant; linha : Integer) : Boolean;
begin
  Result := False;

  if (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 1].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 2].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 3].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 4].Value)) = '') and
     (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 5].Value)) = '') then
    Result := True;
end;

function TfrmCargaArquivo.Validalayout(Excel : Variant) : Boolean;
begin
  Result := False;

  // Para validar o Layout é verificado se os campos estão na ordem como foi especificado, e os nomes dos campos também devem estar corretos
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,1].Value)))  = 'MATRÍCULA' then
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,2].Value)))  = 'NOME DO CARGO' then
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,3].Value)))  = 'PERCENTUAL ATS' then
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,4].Value)))  = 'SALÁRIO PADRÃO' then
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,5].Value)))  = 'VALOR ATS' then
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,6].Value)))  = 'VP – GRAT SEM/ADIC TEMPO SERVI' then
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,7].Value)))  = 'VP – GIP – TEMPO  SERVI' then
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,8].Value)))  = 'VP – GIP/SEM SALÁRIO + FUNÇÃO' then
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,9].Value)))  = 'VP – EX-BNH' then
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,10].Value)))  = 'ADIC.COMPENSATÓRIO POR PERDA DE FUNÇÃO' then
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,11].Value)))  = 'ADIC. DE INCORPORAÇÃO' then
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,12].Value)))  = 'ADIC. NOTURNO' then
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,13].Value)))  = 'ADIC. DE INSALUBRIDADE' then
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,14].Value)))  = 'ADIC. DE PERICULOSIDADE' then
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,15].Value)))  = 'INCORPORAÇÃO JUDICIAL' then
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,16].Value)))  = 'COD. CARGO COMICIONADO OU FUNC. DE CONFIANÇA' then
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,17].Value)))  = 'CARGO COMICIONADO OU FUNC. DE CONFIANÇA' then
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,18].Value)))  = 'VALOR CARGO COMICIONADO OU FUNC. DE CONFIANÇA' then
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,19].Value)))  = 'CSP' then //Xavier - SOL 253577-17564 / PPM 987196
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,20].Value)))  = 'SALÁRIO DE PARTICIPAÇÃO EM 31/08/2006' then
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,21].Value)))  = 'BENEFÍCIO SALDADO' then
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,22].Value)))  = 'PERCENTUAL DE PBE' then
      if AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,23].Value)))  = 'BINSS' then

      Result := True;
end;

procedure TfrmCargaArquivo.MostraProgressoImportacao(msg: string ; Excel : Variant);
var
  linha : Integer;
begin
  // Indica a partir de qual linha começar a pegar os registros
  linha := 2;

  frmProgresso.Caption := 'Importação!';
  frmProgresso.MostraFormProgresso('Verificando a quantidade de linhas do arquivo.',
                                   True,
                                   False,
                                   False,
                                   0,0);
  frmProgresso.lblContador.Caption := '';
  frmProgresso.btnCancelar.Visible := False;
  frmProgresso.Panel1.Visible := False;
  frmProgresso.Refresh;

  // Contando o número de linhas para importação
  while not UltimaLinha(Excel, linha) do
    Inc(linha);

  // Mensagem com barra de progresso
  frmProgresso.MostraFormProgresso( msg, 
                                   True,
                                   True,
                                   True,
                                   0,
                                   linha - 2);
  frmProgresso.Panel1.Visible := True;
  frmProgresso.Refresh;
end;

function TfrmCargaArquivo.JaImportado(IdPessoa, IdTitular : Integer; Matricula : String) : Boolean;
begin
  Result := False;

  // Pegando o IDPESSOA para as duas tabelas
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT IDPESSOA, IDTITULAR FROM CARGABENEFSALDFAB' +
                 ' WHERE IDPESSOA = ' + IntToStr(IdPessoa)  +
                 ' AND IDTITULAR =  ' + IntToStr(IdTitular));
  qryAux.Open;

   // Se há registros com select acima é porque já foi importado Benefício Saldado
  if not qryAux.IsEmpty then
  begin
   Result := True;
   exit;
  end;
  
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT * FROM BENEFSALD_TEMP WHERE MATRICULA = ' + QuotedStr(Matricula) );
  qryAux.Open;

   // Se há registros com select acima é porque já foi importado Benefício Saldado
  if not qryAux.IsEmpty then
  begin
   Result := True;
   exit;
  end;
end;

function TfrmCargaArquivo.SeVazio(Valor : String) : Real;
var
  tipoReal : Real;
  retorno : Integer;
  valorParaTestar : String;
begin
  if (Valor = '') or (Valor = '0') then // Se célula estiver vazia retorna zero
    Result := 0
  else
    begin
     // Valor := FloatToStrF(StrToFloat(Valor),ffFixed,18,2);
      valorParaTestar := StringReplace(Valor,',','.',[rfReplaceAll]);

      // Verifica se é número ou string. Se for string retorno vai retornar 0. O tipoReal é o tipo que estou comparando, no caso aqui é Real
      Val(valorParaTestar, tipoReal, retorno);

      if retorno <> 0 then // Se célula com conteúdo diferente de número retorna zero
        Result := 0
      else // Senão, converte e retorna o valor
       begin
        Valor := FloatToStrF(StrToFloat(Valor),ffFixed,18,2);
        Result := StrToFloat(Valor);
       end;
    end;
end;

procedure TfrmCargaArquivo.bbtnDesfazerClick(Sender: TObject);
var
  Excel : Variant;
  linha, i : integer;
  Matricula, IdPessoa, IdTitular : String;
begin
  if Trim(edtNomeArquivo.Text) = '' then
  begin
    AbrirForm(frmDesfazerCarga,TfrmDesfazerCarga,false);
    frmCargaArquivo.Enabled := false;
  end
  else if MsgDlg('Deseja apagar os dados dos registros selecionados?','Atenção',mtInformation,[mbYes,mbNo],0) = mrYes then
    begin
      Try
        Screen.Cursor := crHourGlass;
        // Cria o objeto
        Excel := CreateOleObject('Excel.application');
        Excel.Visible := False;
        // Abre o Arquivo
        Excel.WorkBooks.Open(ExpandUNCFileName(dialog.FileName),1);

        // Valida o layout do arquivo excel
        if ValidaLayout(Excel) then
          begin
            // Prepara e mostra a barra de progresso
            MostraProgressoImportacao('Desfazendo importação de dados do arquivo...', Excel);

            // Usado para pegar todos os IDPESSOA que serão excluídos
            IdPessoa := '';
            // Indica a partir de qual linha começar a pegar os registros
            linha := 2;

            Try
              if not dtmBaseDados.dbBaseDados.InTransaction then
                dtmBaseDados.dbBaseDados.StartTransaction;

              qryHistorico.Open;

              while not(UltimaLinha(Excel, linha)) do
                begin
                  Matricula := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 1].Value));

                  // Pegando todos os IDPESSOA que serão excluídos
                  qryAux.Close;
                  qryAux.SQL.Clear;
                  qryAux.SQL.Add('SELECT IDPESSOA, IDTITULAR FROM DEPENTIT WHERE MATRICULA = ' + QuotedStr(Matricula));
                  qryAux.Open;

                  qryDesfazer.Close;
                  qryDesfazer.ParamByName('IDPESSOA').AsInteger := qryAux.FieldByName('IDPESSOA').AsInteger;
                  qryDesfazer.ParamByName('IDTITULAR').AsInteger := qryAux.FieldByName('IDTITULAR').AsInteger;
                  qryDesfazer.Open;

                  // Apenas excluir se realmente existir registro com esse IDPESSOA e IDTITULAR
                  if not qryDesfazer.IsEmpty then
                   while not qryDesfazer.Eof do
                   begin
                      // Granvando o Histórico
                     begin
                       qryHistorico.Insert;
                       qryHistoricoIDPESSOA.AsInteger  := qryDesfazerIDPESSOA.AsInteger;
                       qryHistoricoIDTITULAR.AsInteger := qryDesfazerIDTITULAR.AsInteger;
                       qryHistoricoTIPO.AsString  := 'E'; // "E" de Exclusão
                       qryHistoricoCAMPO.AsString := '';
                       qryHistoricoVALORANTERIOR.AsString := '';
                       qryHistoricoVALORALTERADO.AsString := '';
                       qryHistoricoMESREFERENCIA.AsString := '';
                       qryHistorico.Post;
                     end;
                     qryDesfazer.next;

                   end;

                  qryDesfazerCarga.Close;
                  qryDesfazerCarga.ParamByName('IDPESSOA').AsInteger       := qryDesfazerIDPESSOA.AsInteger;
                  qryDesfazerCarga.ParamByName('IDTITULAR').AsInteger      := qryDesfazerIDTITULAR.AsInteger;
                  qryDesfazerCarga.ParamByName('IDCARGAARQUIVO').AsInteger := qryDesfazerIDCARGAARQUIVO.AsInteger;
                  qryDesfazerCarga.ExecSQL;

                  qryDesfazerBenef.Close;
                  qryDesfazerBenef.ParamByName('IDPESSOA').AsInteger       := qryDesfazerIDPESSOA.AsInteger;
                  qryDesfazerBenef.ParamByName('IDTITULAR').AsInteger      := qryDesfazerIDTITULAR.AsInteger;
                  qryDesfazerBenef.ParamByName('IDCARGAARQUIVO').AsInteger := qryDesfazerIDCARGAARQUIVO.AsInteger;
                  qryDesfazerBenef.ExecSQL;

                  Inc(linha);
                  frmProgresso.AndaFormProgresso(linha - 2);
                  frmProgresso.Refresh;
                end;



              if not frmProgresso.Cancelou then
                begin
                  frmProgresso.MostraFormProgresso('Excluíndo os dados da importação.',
                                                   True,
                                                   False,
                                                   False,
                                                   0,0);
                  frmProgresso.lblContador.Caption := '';
                  frmProgresso.btnCancelar.Visible := False;
                  frmProgresso.Panel1.Visible := False;
                  frmProgresso.Refresh;

                  qryHistorico.ApplyUpdates;

                  if dtmBaseDados.dbBaseDados.InTransaction then
                    dtmBaseDados.dbBaseDados.Commit;

                  MsgDlg('Todos os registros foram excluídos com sucesso.','Sucesso',mtInformation,[mbOk],0);
                end
              else
                begin
                  qryHistorico.CancelUpdates;

                  if dtmBaseDados.dbBaseDados.InTransaction then
                    dtmBaseDados.dbBaseDados.Rollback;
                end;
            except
              if dtmBaseDados.dbBaseDados.InTransaction then
                dtmBaseDados.dbBaseDados.Rollback;
            end;
          end;
      finally
        qryAux.Close;
        Excel.ActiveWorkBook.Saved:= 1;
        Excel.DisplayAlerts:= 0;
        Excel.ActiveWorkBook.Close(SaveChanges:= 0);
        Excel.Workbooks.Close;
        Excel.Quit;
        Excel := Unassigned;
        Screen.Cursor := crDefault;
        frmProgresso.EscondeFormProgresso;
      end;
    end;
end;

procedure TfrmCargaArquivo.btnAtualizarClick(Sender: TObject);
begin
  if MsgDlg('Confirma atualização de valores?','Atenção',mtInformation,[mbYes,mbNo],0) = mrYes then
    begin
      Screen.Cursor := crHourGlass;
      if AtualizarBenefSaldFAB then
        MsgDlg('Atualização Concluída.','Atenção',mtInformation,[mbOk],0)
      else
        MsgDlg('Ocorreu um erro, a atualização não foi concluída.','Atenção',mtInformation,[mbOk],0);
      Screen.Cursor := crDefault;
    end;
end;

function TfrmCargaArquivo.AtualizarBenefSaldFAB : Boolean;
begin
  // Andre Imakawa - SIG 27626.32406 - Inicio
  {
  // Se não estiver com endereço de arquivo atualiza todos, senão somente os que estão no arquivo
  if Trim(edtNomeArquivo.Text) = '' then
    Result := Exec_SP_Atualiza_Benef_Sald_FAB(1,tmpAtuAte.Date) // Para atualizar todos os Registros
  else if AtualizarDadosDoArquivo then
    Result := Exec_SP_Atualiza_Benef_Sald_FAB(0,tmpAtuAte.Date); // Para atualizar somente os registros que estiverem no arquivo
  }
  Result := Exec_SP_Atualiza_Benef_Sald_FAB(1,tmpAtuAte.Date);
  // Andre Imakawa - SIG 27626.32406 - Fim
end;

function TfrmCargaArquivo.AtualizarDadosDoArquivo : Boolean;
var
  Excel, oSheet : Variant;
  linha : Integer;
  Matricula : String;
  Lista : TStringList;
begin
  Result := True;
  Try
    Try
      // Cria o objeto
      Excel := CreateOleObject('Excel.application');
      Excel.Visible := False;
      Lista := TStringList.Create;
      // Abre o Arquivo
      Excel.WorkBooks.Open(ExpandUNCFileName(dialog.FileName),1);
      // Indica a partir de qual linha começar a pegar os registros
      linha := 2;

      // Valida o layout do arquivo excel
      if ValidaLayout(Excel) then
        begin
          if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add('DELETE FROM BENEFSALD_TEMP');
          qryAux.ExecSQL;

          Lista.Add('INSERT ALL');
          while not (UltimaLinha(Excel, linha)) do
           begin
             Matricula := QuotedStr(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 1].Value)));
             Lista.Add('INTO BENEFSALD_TEMP VALUES (' + Matricula + ') ');
             Inc(linha);
           end;
           Lista.Add('SELECT * FROM DUAL');

          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(Lista.GetText);
          qryAux.ExecSQL;

          if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;
        end;
    except
      begin
        if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Rollback;
        Result := False;
      end;
    end;
  finally
    freeandnil(Lista);
    qryAux.Close;
    Excel.ActiveWorkBook.Saved:= 1;
    Excel.DisplayAlerts:= 0;
    Excel.ActiveWorkBook.Close(SaveChanges:= 0);
    Excel.Workbooks.Close;
    Excel.Quit;
    Excel := Unassigned;
    Screen.Cursor := crDefault;
  end;
end;

function TfrmCargaArquivo.Exec_SP_Atualiza_Benef_Sald_FAB(AtualizarTudo : Integer; AtualizarAte: TDateTime) : Boolean;
var
  SP_PROC : TStoredProc;
begin
  frmProgresso.MostraFormProgresso('Atualizando Benefício Saldado e FAB, por favor, aguarde.', True, False,False,0,0);
  frmProgresso.lblContador.Caption := '';
  frmProgresso.btnCancelar.Visible := False;
  frmProgresso.Panel1.Visible := False;
  frmProgresso.Refresh;

  try

    try
      SP_PROC := TStoredProc.Create(self);
      SP_PROC.DatabaseName  := 'BaseDados';
     // SP_PROC.StoredProcName := 'CM."SP_ATUALIZA_BENEF_SALD_FAB"';   //William Santana - SIG 27626.32406
      SP_PROC.StoredProcName  := 'CM.PCK_BENEFSALDFAB.SP_ATUALIZASALDO';  //William Santana - SIG 27626.32406

      //Criando os parametros
      SP_PROC.Params.CreateParam(ftInteger, 'pAtualizarTudo', ptInput);
      SP_PROC.Params.CreateParam(ftDateTime, 'pAtualizarAte', ptInput);

      //Passandos os parâmetros
      SP_PROC.ParamByName('pAtualizarTudo').AsInteger := AtualizarTudo;
      SP_PROC.ParamByName('pAtualizarAte').AsDate     := AtualizarAte ;

      if not SP_PROC.Prepared then
         SP_PROC.Prepare;

      SP_PROC.Close;
      SP_PROC.ExecProc;
      Result := True;
      SP_PROC.Close;

    except
       Result := False;          
    end;
     
  finally
    FreeAndNil(SP_PROC);
    frmProgresso.EscondeFormProgresso;
  end;
end;

procedure TfrmCargaArquivo.GravarHistorico(qry : TwwQuery);
var
  i : integer;
begin
  // Granvando Histórico
  for i := 0 to qry.Fields.Count - 1 do
    begin
      if Trim(VarToStr(qry.Fields[i].OldValue)) <> Trim(VarToStr(qry.Fields[i].NewValue)) then
        begin
          qryHistorico.Insert;
          qryHistoricoIDPESSOA.AsInteger  := qry.FieldByName('IDPESSOA').AsInteger;
          qryHistoricoIDTITULAR.AsInteger := qry.FieldByName('IDTITULAR').AsInteger;
          qryHistoricoTIPO.AsString  := 'A'; // "A" de Alteração
          qryHistoricoCAMPO.AsString := qry.Fields[i].DisplayName;
          qryHistoricoVALORANTERIOR.AsString := Trim(VarToStr(qry.Fields[i].OldValue));
          qryHistoricoVALORALTERADO.AsString := Trim(VarToStr(qry.Fields[i].NewValue));
          //qryHistoricoMESREFERENCIA.AsString := FormatDateTime('mm/yyyy',Date);    // edilaine - SOL 253577-17564 / PPM 987196 - comentado
          qryHistoricoMESREFERENCIA.AsString := FormatDateTime('yyyy/mm',Date);      // edilaine - SOL 253577-17564 / PPM 987196
          qryHistorico.Post;
        end;
    end;
end;

procedure TfrmCargaArquivo.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
    edtNomeArquivo.clear;
    tmpSaldamento.Date := StrToDate('31/08/2006');
    tmpAtuAte.Date := Now;
end;

procedure TfrmCargaArquivo.FormCreate(Sender: TObject);
begin
  inherited;
  tmpSaldamento.Date := StrToDate('31/08/2006');
  tmpAtuAte.Date := Now;
end;

procedure TfrmCargaArquivo.btnSaldoFABClick(Sender: TObject);
var
  qrySaldo  : TwwQuery;
  sMesRefer : string;
  sMesAnt   : string;
begin
  inherited;
  // edilaine - SOL 253577-17564 / PPM 987196 - inicio
  try
    qrySaldo := TwwQuery.create(self);
    dsSaldoFAB.DataSet := qrySaldo;
    qrySaldo.DatabaseName := 'BaseDados';

    Application.CreateForm(TfrmMesInicioRelSaldoFab, frmMesInicioRelSaldoFab);
    frmMesInicioRelSaldoFab.ShowModal;
    if frmMesInicioRelSaldoFab.sMesReferencia <> '' then
    begin
      sMesRefer := frmMesInicioRelSaldoFab.sMesReferencia;

      {busca mes anterior ao referencia}
      sMesAnt   := '01'+Copy(sMesRefer,5,3)+'/'+Copy(sMesRefer,1,4);
      sMesAnt   := FormatDateTime('yyyy/mm', IncMonth(StrToDate(sMesAnt), -1));

      {monta consulta do saldo}
      qrySaldo.sql.Add('SELECT  ');
      qrySaldo.sql.Add('       (SELECT SUM(SALDOFAB)  ');
      qrySaldo.sql.Add('          FROM BENEFSALDFAB   ');
      qrySaldo.sql.Add('         WHERE MESREFERENCIA = '+QuotedStr(sMesRefer)+') AS MESATUAL, ');
      qrySaldo.sql.Add('       (SELECT SUM(SALDOFAB)  ');
      qrySaldo.sql.Add('          FROM BENEFSALDFAB   ');
      qrySaldo.sql.Add('         WHERE MESREFERENCIA = '+QuotedStr(sMesAnt)+')  AS MESANTERIOR ');
      qrySaldo.sql.Add('FROM DUAL');

      vMesReferencia := sMesRefer;
      vMesAnterior   := sMesAnt;
      TFrmPreview.CreateModalPreview(Self, rptSaldoFAB, 'Saldo Fundo de Acumulação de Benefícios - FAB');

    end
    else
    begin
      exit;
    end;

  finally
    dsSaldoFAB.DataSet := nil;
    qrySaldo.Free;
  end;

end;

procedure TfrmCargaArquivo.rptSaldoFABBeforePrint(Sender: TObject);
begin
  inherited;
  ppLabel15.Caption := 'Mês Informado '+ frmCargaArquivo.vMesReferencia;
  ppLabel3.Caption  := 'Mês Anterior ao Informado '+ frmCargaArquivo.vMesAnterior;
end;

end.
