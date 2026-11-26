// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Pendência   : SIG TIBERO
//Responsável : Everson Luiz Pereira da Cunha
//Data        : 22/02/2018
//Descrição   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//              Retirada de INDEX, +rule etc.
//              Melhoria realizada para adaptação ao TIBERO.
//------------------------------------------------------------------------------
//Pendência   : SIG 51380
//Responsável : André Imakawa
//Data        : 03/08/2017
//Descrição   : Alterações em DFM.
//				Correção do update das tabelas HSTBENEFBFCIARIO e remoção da 
//				atualização da tabela RubricaIndiv.
//------------------------------------------------------------------------------
//Pendência   : SOL 262367 PPM 1090694 
//Responsável : Fernando Xavier / William Santana / André Imakawa
//Data        : 08/12/2015 / 11/01/2016 / 10/05/2016
//Descrição   : mesmo após a implementação dos índices da base de dados temos
//              problema de performance
//------------------------------------------------------------------------------
//Pendência   : SOL 245726 PPM 625076
//Responsável : Fernando Xavier
//Data        : 05/01/2015
//Descrição   : Erro na busca na tela de Reembolso do INSS/Manutenção de Rubricas
//              do Reembolso do INSS e NB
//------------------------------------------------------------------------------
//Pendência   : SOL 243784 PPM 593404
//Responsável : Fernando Xavier
//Data        : 27/11/2014
//Descrição   : erro "Falta Expressão" ao clicar em procurar. Alterações em DFM.
//------------------------------------------------------------------------------
//No. SOL     : 197482
//Kintana     : 1905336
//Responsável : Edilaine Ferraresi
//Data        : 09/06/2014
//Descrição   : Melhora de performance para consultas
//Rotinas     : MSBeneficiario, MSBeneficiarioBeforeOpenCds
//------------------------------------------------------------------------------
//Pendência   : SOL 180865 Kintana 1678136
//Responsável : BRUNO AZEVEDO
//Data        : 29/05/2012
//Descrição   : Ajustes no campo NUMPROCINSS. Alterações também no DFM!
//------------------------------------------------------------------------------
//Pendência   : SOL 178884 Kintana 1665368
//Responsável : BRUNO AZEVEDO
//Data        : 17/05/2012
//Descrição   : Adicionado o SEQRubrica nas alterações, tela e consulta.
//------------------------------------------------------------------------------
//Pendência   : SOL 146668 Kintana 1002463
//Responsável : MARCIO DENILSON
//Data        : 29/08/2011
//Descrição   : Alterações em função da revisão da espeficicação do SOL
//------------------------------------------------------------------------------
//Pendência   : SOL 146668 Kintana 1002463
//Responsável : MARCIO DENILSON
//Dat   a        : 17/02/2011
//Descrição   : Desenvolvimento inicial da tela
//------------------------------------------------------------------------------
unit FManutRubricaReembolsoINSS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroPai, ComCtrls, CmEventosCadastro, ImgList, Db, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97Ctls, TB97, ExtCtrls, fFrameLista, wwdblook, DBCtrls, MontaSelect,
  Grids, Wwdbigrd, Wwdbgrid, DBTables, Wwquery, Mask, DBClient;


CONST
  // edilaine - SOL 197482 / KTN 1905336
//  sFILTRO = '   exists (Select /*+ PARALLEL(HSTBENEF,20,1) */      '+#13+#10+       //Everson TIBERO
  sFILTRO = '   exists (Select                                             '+#13+#10+ //Everson TIBERO
            '                  1 from HSTBENEFBFCIARIO HSTBENEF            '+#13+#10+
            '            where DEPENTIT.IDPESSOA      = HSTBENEF.IDPESSOA  '+#13+#10+
            '              AND DEPENTIT.IDTITULAR     = HSTBENEF.IDTITULAR '+#13+#10+
            '              AND HISTRUBSAL.IDTITULAR   = HSTBENEF.IDTITULAR '+#13+#10+
            '              and HISTRUBSAL.IDPESSOA    = HSTBENEF.IDPESSOA  '+#13+#10+
            '              and HISTRUBSAL.IDPATRO     = HSTBENEF.IDPESSJUR '+#13+#10+
            '              and HISTRUBSAL.MESCOBRANCA = HSTBENEF.MES       '+#13+#10+
            '              and HSTBENEF.FONTEPAGADORA = 2                  '+#13+#10+
            '          )  ';   // SOL 243784 PPM 593404

  // INICIO SOL 245726 PPM 625076
//  sFILTROIND = '   exists (Select /*+ PARALLEL(HSTBENEF,20,1) */      '+#13+#10+       //Everson TIBERO
  sFILTROIND = '   exists (Select                                             '+#13+#10+ //Everson TIBERO
               '                  1 from HSTBENEFBFCIARIO HSTBENEF            '+#13+#10+
               '            where DEPENTIT.IDPESSOA      = HSTBENEF.IDPESSOA  '+#13+#10+
               '              AND DEPENTIT.IDTITULAR     = HSTBENEF.IDTITULAR '+#13+#10+
               '              AND HISTRUBSAL.IDTITULAR   = HSTBENEF.IDTITULAR '+#13+#10+
               '              and HISTRUBSAL.IDPESSOA    = HSTBENEF.IDPESSOA  '+#13+#10+
               '              and HISTRUBSAL.IDPATRO     = HSTBENEF.IDPESSJUR '+#13+#10+
               '              and HISTRUBSAL.MESCOBRANCA = HSTBENEF.MES       '+#13+#10+
               '              and HSTBENEF.FONTEPAGADORA = 2                  '+#13+#10+
               '          ) AND ';
  // FINAL SOL 245726 PPM 625076

type
  TfrmManutRubricaReembolsoINSS = class(TfrmCadastroPai)
    pcPaginas: TPageControl;
    tsIndividual: TTabSheet;
    tsLista: TTabSheet;
    frameBenef: TfrmFrameListaBenef;
    MSBeneficiario: TMontaSelect;
    tsResultado: TTabSheet;
    Panel1: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    btnProcurar: TBitBtn;
    dbgrdResultado: TwwDBGrid;
    dsResultado: TwwDataSource;
    qryResultado: TwwQuery;
    qryRubricaResultado: TwwQuery;
    dsRubricaResultado: TwwDataSource;
    pnOpcaoLista: TPanel;
    chkbxListaIndividual: TCheckBox;
    pnOpcoesIndiv01: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtMatricula: TEdit;
    edtBeneficiario: TEdit;
    edtValorProvento: TEdit;
    edtMesCobranca: TEdit;
    edtMesReferencia: TEdit;
    edtVersaoPagamento: TEdit;
    pnOpcaoMesCompetencia: TPanel;
    Label7: TLabel;
    pnOpcoesIndiv02: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtIdentificadorRubrica: TEdit;
    edtRubrica: TEdit;
    qryBeneficioINSS: TwwQuery;
    dsBeneficioINSS: TwwDataSource;
    cbNumBeneficioINSS: TComboBox;
    chkbxOpcHistRubricas: TCheckBox;
    chkbxOpcHistBeneficios: TCheckBox;
    chkbxOpcRubIndividuais: TCheckBox;
    qryAux: TwwQuery;
    pnOpcoesLista: TPanel;
    qryResultadoMATRICULA: TStringField;
    qryResultadoNOME: TStringField;
    qryResultadoVALORPROVENTO: TFloatField;
    qryResultadoMESCOBRANCA: TStringField;
    qryResultadoMES: TStringField;
    qryResultadoIDVERSAOPAGTO: TFloatField;
    qryResultadoMESCOMPREEM: TStringField;
    qryResultadoCODPROVDESC: TStringField;
    qryResultadoDESCRICAO: TStringField;
    edtMesCompetenciaINSS: TMaskEdit;
    edtMesCobrancaInicio: TMaskEdit;
    edtMesCobrancaFim: TMaskEdit;
    edtMesCompetenciaInicio: TMaskEdit;
    edtMesCompetenciaFim: TMaskEdit;
    edtMesReferenciaInicio: TMaskEdit;
    edtMesReferenciaFim: TMaskEdit;
    pnOpcoesProcLista: TPanel;
    Label18: TLabel;
    btnProcessar: TBitBtn;
    chkbxOpcHistRubricasLista: TCheckBox;
    chkbxOpcHistBeneficiosLista: TCheckBox;
    chkbxOpcRubIndividuaisLista: TCheckBox;
    edtMesCompetenciaINSSLista: TMaskEdit;
    Label19: TLabel;
    edtMesCobrancaInicioConsulta: TMaskEdit;
    Label20: TLabel;
    edtMesCompetenciaInicioConsulta: TMaskEdit;
    Label21: TLabel;
    edtMesReferenciaInicioConsulta: TMaskEdit;
    Label22: TLabel;
    edtMesReferenciaFimConsulta: TMaskEdit;
    edtMesCompetenciaFimConsulta: TMaskEdit;
    Label23: TLabel;
    Label24: TLabel;
    edtMesCobrancaFimConsulta: TMaskEdit;
    Label25: TLabel;
    btnConsultar: TBitBtn;
    dbgrdConsulta: TwwDBGrid;
    qryConsulta: TwwQuery;
    dsConsulta: TwwDataSource;
    qryRubrica: TwwQuery;
    dsRubrica: TwwDataSource;
    dblcRubrica: TwwDBLookupCombo;
    dblcRubricaResultado: TwwDBLookupCombo;
    qryResultadoIDHSTFOLHABENEF: TFloatField;
    Label26: TLabel;
    edtSeqRubrica: TEdit;
    qryResultadoNUMEROPROCESSO: TStringField;
    MSBeneficiarioOld: TMontaSelect;
    ClientDataSet1: TClientDataSet;
    qryConsultaMATRICULA: TStringField;
    qryConsultaNOME: TStringField;
    qryConsultaVALORPROVENTO: TFloatField;
    qryConsultaMESCOBRANCA: TStringField;
    qryConsultaMES: TStringField;
    qryConsultaIDVERSAOPAGTO: TFloatField;
    qryConsultaMESCOMPREEM: TStringField;
    qryConsultaNUMEROPROCESSO: TStringField;
    qryConsultaNUMPROCINSS: TStringField;
    qryConsultaCODPROVDESC: TStringField;
    qryConsultaDESCRICAO: TStringField;
    qryConsultaIDPESSOA: TFloatField;
    qryConsultaIDRUBRICA: TFloatField;
    qryConsultaSEQORIGINAL: TFloatField;
    qryConsultaSEQORIGINAL_1: TFloatField;
    qryConsultaSEQRUBRICA: TFloatField;
    qryConsultaIDHSTFOLHABENEF: TFloatField;
    qryResultadoIDRUBRICA: TFloatField;
    qryConsultaROWID_HISTRUBSAL: TStringField;
    qryConsultaIDPLANOPREV: TFloatField;
    qryConsultaIDBENEFICIO: TFloatField;
    qryConsultaIDMOTIVO: TFloatField;
    qryConsultaIDTITULAR: TFloatField;
    qryConsultaIDPLANOORIGEM: TFloatField;
    qryConsultaNUMEROPROCESSO1: TFloatField;
    qryConsultaIDPATRO: TFloatField;
    procedure bbtnSairClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure chkbxListaIndividualClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure chkbxOpcHistRubricasClick(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
    procedure chkbxOpcHistRubricasListaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnConsultarClick(Sender: TObject);
    procedure dblcRubricaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMesCompetenciaINSSListaChange(Sender: TObject);
    procedure edtMesCompetenciaINSSListaExit(Sender: TObject);
    procedure dblcRubricaResultadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MSBeneficiarioBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
  private
    { Private declarations }
    sIdPessoa, sIdRubrica, sNumProcINSS, sSeqOriginal: String;

    // Andre Imakawa - SIG 51380 - Inicio
    sidplanoprev, sidbeneficio, smes, sidmotivo, snumeroprocesso,
    smescobranca, sidpatro, sidtitular, sidplanoorigem: String;
    // Andre Imakawa - SIG 51380 - Fim

    //BRUNO AZEVEDO SOL 178884 Kintana 1665368
    sSeqRubrica: String;

    procedure consultar();
    procedure consultarRubricasSelecionadas();
    procedure consultarResultado();
    procedure consultarNumerosBeneficiosInss(pIdPessoa: String);

    procedure consultarRubricas(pRubrica: string = '');     //William Santana - SOL 262367 PPM 1090694
    //procedure consultarRubricas();                        //William Santana - SOL 262367 PPM 1090694

    procedure consultarRubricasAposConsulta();
    procedure consultarRubricasResultadoAposConsulta();


    procedure AlterarIndividual();
    procedure AlterarListaAnt();
    procedure AlterarLista();

    procedure Limpar();

  public
    { Public declarations }
  end;

var
  frmManutRubricaReembolsoINSS: TfrmManutRubricaReembolsoINSS;

implementation

uses UMensErro,DBaseDados;

{$R *.DFM}

procedure TfrmManutRubricaReembolsoINSS.bbtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmManutRubricaReembolsoINSS.sbtnProcurarClick(Sender: TObject);
begin
  inherited;

  MSBeneficiario.Executar;
  if (MSBeneficiario.ValoresChave.Count > 0) and (MSBeneficiario.ValoresChave[0] <> '') then
   begin
     consultar();
     sbtnAlterar.Enabled := True;
   end
  Else
   begin
     Limpar();
     sbtnAlterar.Enabled := False;
   end;

  sbtnProcurar.Down   := False;

end;

procedure TfrmManutRubricaReembolsoINSS.FormCreate(Sender: TObject);
begin
  inherited;
  tsLista.TabVisible     := False;

  consultarRubricas();

  qryConsulta.Open;
  qryResultado.Open;

end;

procedure TfrmManutRubricaReembolsoINSS.consultarResultado;
begin
  if chkbxListaIndividual.Checked then
   begin

   end;




   qryResultado.Close;
   With qryResultado do
    begin
       Sql.Clear;
       Sql.Add(' SELECT DISTINCT DEPENTIT.MATRICULA,                                 ');   // edilaine - SOL 197482 / KTN 1905336 //Andre Imakawa - SOL 262367 PPM 1090694
       Sql.Add('        PESSOA.NOME,                                                 ');
       Sql.Add('        HISTRUBSAL.VALORPROVENTO,                                    ');
       Sql.Add('        HISTRUBSAL.MESCOBRANCA,                                      ');
       Sql.Add('        HISTRUBSAL.MES,                                              ');
       Sql.Add('        HISTRUBSAL.IDVERSAOPAGTO,                                    ');
       Sql.Add('        HISTRUBSAL.MESCOMPREEM,                                      ');
       //BRUNO AZEVEDO SOL 180865 Kintana 1678136
       //Sql.Add('        HSTBENEFBFCIARIO.NUMEROPROCESSO,                           ');
       Sql.Add('        HISTRUBSAL.IDRUBRICA,                                        ');  //William Santana - SOL 262367 PPM 1090694
       Sql.Add('        HistRubSal.NumProcInss as NUMEROPROCESSO,                    ');
       //BRUNO AZEVEDO SOL 180865 Kintana 1678136
       Sql.Add('        PROVDESC.CODPROVDESC,                                        ');
       Sql.Add('        PROVDESC.DESCRICAO,                                          ');
       Sql.Add('        HISTRUBSAL.IDHSTFOLHABENEF,                                   ');

       // Andre Imakawa - SIG 51380 - Inicio
       Sql.Add('        HISTRUBSAL.IDPLANOPREV,                                       ');
       Sql.Add('        HISTRUBSAL.IDBENEFICIO,                                       ');
       Sql.Add('        HISTRUBSAL.IDMOTIVO,                                          ');
       Sql.Add('        HISTRUBSAL.NUMEROPROCESSO AS NUMEROPROCESSO1,                 ');
       Sql.Add('        HISTRUBSAL.IDPATRO,                                         ');
       Sql.Add('        HISTRUBSAL.IDTITULAR,                                         ');
       Sql.Add('        HISTRUBSAL.IDPLANOORIGEM,                                     ');
       // Andre Imakawa - SIG 51380 - Fim

       Sql.Add('        HISTRUBSAL.ROWID AS ROWID_HISTRUBSAL                         ');//Andre Imakawa - SOL 262367 PPM 1090694
       Sql.Add(' FROM CM.HISTRUBSAL,                                                 ');
       //Sql.Add('      CM.HSTBENEFBFCIARIO,                                           ');   // edilaine - SOL 197482 / KTN 1905336 - comentado
       Sql.Add('      CM.DEPENTIT,                                                   ');
       Sql.Add('      CM.PESSOA,                                                     ');
       Sql.Add('      CM.PROVDESC                                                    ');
       // edilaine - SOL 197482 / KTN 1905336 - inicio
       //Sql.Add(' WHERE '+ sFILTRO ); //Andre Imakawa - SOL 262367 PPM 1090694
       //Andre Imakawa - SOL 262367 PPM 1090694 - Inicio
       if chkbxListaIndividual.Checked then
       begin
          Sql.Add(' WHERE exists (Select 1 from HSTBENEFBFCIARIO HSTBENEF                                '); //Andre Imakawa - SOL 262367 PPM 1090694
          Sql.Add('               where DEPENTIT.IDPESSOA      = HSTBENEF.IDPESSOA                       ');
          Sql.Add('                 AND DEPENTIT.IDTITULAR     = HSTBENEF.IDTITULAR                      ');
          Sql.Add('                 AND HISTRUBSAL.IDTITULAR   = HSTBENEF.IDTITULAR                      ');
          Sql.Add('                 AND HISTRUBSAL.IDPESSOA    = HSTBENEF.IDPESSOA                       ');
          Sql.Add('                 AND HISTRUBSAL.IDPATRO     = HSTBENEF.IDPESSJUR                      ');
          Sql.Add('                 AND HISTRUBSAL.MESCOBRANCA = HSTBENEF.MES                            ');
          Sql.Add('                 AND HSTBENEF.FONTEPAGADORA = 2                                       ');
          Sql.Add('               )                                                                      ');
       end;
       //Andre Imakawa - SOL 262367 PPM 1090694 - Fim

       {Sql.Add(' WHERE HISTRUBSAL.IDTITULAR       = HSTBENEFBFCIARIO.IDTITULAR       ');
       Sql.Add(' AND   HISTRUBSAL.IDPESSOA        = HSTBENEFBFCIARIO.IDPESSOA        ');
       Sql.Add(' AND   HISTRUBSAL.IDPATRO         = HSTBENEFBFCIARIO.IDPESSJUR       ');
       Sql.Add(' AND   HSTBENEFBFCIARIO.IDPESSOA  = DEPENTIT.IDPESSOA                ');
       Sql.Add(' AND   HSTBENEFBFCIARIO.IDTITULAR = DEPENTIT.IDTITULAR               ');
       Sql.Add(' AND   HSTBENEFBFCIARIO.IDPESSOA  = PESSOA.IDPESSOA                  ');
       Sql.Add(' AND   HSTBENEFBFCIARIO.MES       = HISTRUBSAL.MESCOBRANCA           ');
       }// edilaine - SOL 197482 / KTN 1905336 - fim

       if chkbxListaIndividual.Checked then
          Sql.Add(' AND   DEPENTIT.IDPESSOA          = HISTRUBSAL.IDPESSOA                  ') //William Santana - SOL 262367 PPM 1090694
       else
          Sql.Add(' WHERE   DEPENTIT.IDPESSOA          = HISTRUBSAL.IDPESSOA                  ');
       Sql.Add(' AND   DEPENTIT.IDTITULAR          = HISTRUBSAL.IDTITULAR                  ');
       Sql.Add(' AND   HISTRUBSAL.IDPESSOA        = PESSOA.IDPESSOA                  ');
       Sql.Add(' AND   HISTRUBSAL.IDRUBRICA       = PROVDESC.IDPROVENTO              ');
       //Sql.Add(' AND   HISTRUBSAL.FONTEPAGADORA   = PROVDESC.CODFONTEPAGADORA        '); //Andre Imakawa - SOL 262367 PPM 1090694
       //Sql.Add(' AND   HSTBENEFBFCIARIO.FONTEPAGADORA  = 2                           ');   // edilaine - SOL 197482 / KTN 1905336 - comentado

       if Trim(edtMesCobrancaInicio.Text) <> '/' then
         Sql.Add(' AND   HISTRUBSAL.MESCOBRANCA   >= ' + QuotedStr( Trim(edtMesCobrancaInicio.Text) )  );
       if Trim(edtMesCobrancaFim.Text) <> '/' then
         Sql.Add(' AND   HISTRUBSAL.MESCOBRANCA   <= ' + QuotedStr( Trim(edtMesCobrancaFim.Text) )  );

       if Trim(edtMesReferenciaInicio.Text) <> '/' then
         Sql.Add(' AND   HISTRUBSAL.MES   >= ' + QuotedStr( Trim(edtMesReferenciaInicio.Text) )  );
       if Trim(edtMesReferenciaFim.Text) <> '/' then
         Sql.Add(' AND   HISTRUBSAL.MES   <= ' + QuotedStr( Trim(edtMesReferenciaFim.Text) )  );

       if Trim(edtMesCompetenciaInicio.Text) <> '/' then
         Sql.Add(' AND   HISTRUBSAL.MESCOMPREEM   >= ' + QuotedStr( Trim(edtMesCompetenciaInicio.Text) )  );
       if Trim(edtMesCompetenciaFim.Text) <> '/' then
         Sql.Add(' AND   HISTRUBSAL.MESCOMPREEM   <= ' + QuotedStr( Trim(edtMesCompetenciaFim.Text) )  );

       if Trim(dblcRubricaResultado.Text)  <> '' then
         Sql.Add(' AND  PROVDESC.CODPROVDESC  = ' + QuotedStr( Trim( qryRubricaResultado.FieldByName('CODPROVDESC').asString  ) )  );

       //Andre Imakawa - SOL 262367 PPM 1090694 - Inicio

       Sql.Add(' AND HISTRUBSAL.IDPESSJUR IN (1,91008)                                ');
       Sql.Add(' AND HISTRUBSAL.FONTEPAGADORA   = 2                                   ');
       Sql.Add(' AND HISTRUBSAL.IDMODULO = 18                                         ');

       //Andre Imakawa - SOL 262367 PPM 1090694 - Fim

       if chkbxListaIndividual.Checked then
        begin
           Sql.Add('   AND EXISTS                        ');
           Sql.Add('   (                                 ');
           Sql.Add('     SELECT 1                        ');
           Sql.Add('     FROM LISTAFOLHABENEFDET L       ');
           Sql.Add('     WHERE L.IDLISTA = ' + IntToStr(framebenef.ListaUsuario) );
           Sql.Add('     AND L.IDTITULAR = HISTRUBSAL.IDTITULAR'); //Andre Imakawa - SOL 262367 PPM 1090694
           Sql.Add('     AND L.IDPESSOA = HISTRUBSAL.IDPESSOA');
           Sql.Add('   )                                 ');
        end
       Else
          Sql.Add('  AND PESSOA.IDPESSOA = ' + sIdPessoa );

       //Everson TIBERO - Início
       {Sql.Add(' ORDER BY MATRICULA,                                 ');
       Sql.Add('          MESCOBRANCA DESC,                          ');
       Sql.Add('          MES DESC,                                  ');
       Sql.Add('          DESCRICAO                                  '); }

       Sql.Add(' ORDER BY DEPENTIT.MATRICULA,                        ');
       Sql.Add('          HISTRUBSAL.MESCOBRANCA DESC,               ');
       Sql.Add('          HISTRUBSAL.MES DESC,                       ');
       Sql.Add('          PROVDESC.DESCRICAO                         ');
       //Everson TIBERO - Fim

       Open;
    end;
end;

procedure TfrmManutRubricaReembolsoINSS.btnProcurarClick(Sender: TObject);
var vRubSel: String;
begin
  inherited;
  vRubSel := '';

  if chkbxListaIndividual.Checked then
   begin
     if (not frameBenef.qryLista.Active) or (frameBenef.qryLista.recordCount = 0 ) then
      begin
          MsgDlg('Nenhum beneficiário selecionado na lista de processamento.','Aviso',mtInformation,[mbOk],0);
          Exit;
      end;
   end;

  if (not chkbxListaIndividual.Checked) and (Trim(edtMatricula.Text) = '') then
   begin
        MsgDlg('Nenhum beneficiário selecionado.','Aviso',mtInformation,[mbOk],0);
        Exit;
   end;

  if dblcRubricaResultado.Text <> '' then
    vRubSel := qryRubricaResultado.FieldByName('DESCRICAO').AsString;

  consultarResultado();

  consultarRubricasResultadoAposConsulta();

  if vRubSel <> '' then
    dblcRubricaResultado.Text := vRubSel;

end;

procedure TfrmManutRubricaReembolsoINSS.consultarNumerosBeneficiosInss(pIdPessoa: String);
begin
  With qryBeneficioINSS do
   begin
      Close;
      Sql.Clear;
      Sql.Add(' SELECT DISTINCT NUMPROCINSS        ');
      Sql.Add(' FROM DETCONCINSS D                 ');
      Sql.Add(' WHERE IDPESSOA = ' + QuotedStr(pIdPessoa) );
      Open;
      cbNumBeneficioINSS.Clear;
      First;
      While not EOF do
       begin
         cbNumBeneficioINSS.Items.Add( FieldByName('NUMPROCINSS').AsString );
         Next;
       end;
      Close;
   end;
end;

//procedure TfrmManutRubricaReembolsoINSS.consultarRubricas;
procedure TfrmManutRubricaReembolsoINSS.consultarRubricas(pRubrica: string);
begin

  With qryRubrica do
   begin
      Close;
      Sql.Clear;
      Sql.Add(' SELECT CODPROVDESC , DESCRICAO, DESCRPROVDESC, IDPROVENTO   ');
      Sql.Add(' FROM PROVDESC                                               ');
      Sql.Add(' WHERE CODFONTEPAGADORA = 2                                  ');
      Sql.Add(' AND CODPROVDESC IS NOT  NULL                                ');
      // Início - William Santana - SOL 262367 PPM 1090694
      //Sql.Add(' AND SUBSTR(CODPROVDESC,3,3) <> ''280''                      ');
      if trim(pRubrica) <> '' then
        Sql.Add(' AND IDPROVENTO in (' + pRubrica + ')' )
      else
      Sql.Add(' AND SUBSTR(CODPROVDESC,3,3) <> ''280''                      ');  
      // Término - William Santana - SOL 262367 PPM 1090694
      Sql.Add(' ORDER BY CODPROVDESC                                        ');
      Open;
   end;

  With qryRubricaResultado do
   begin
      Close;
      Sql.Clear;
      Sql.Add(' SELECT CODPROVDESC , DESCRICAO, DESCRPROVDESC, IDPROVENTO   ');
      Sql.Add(' FROM PROVDESC                                               ');
      Sql.Add(' WHERE CODFONTEPAGADORA = 2                                  ');
      Sql.Add(' AND CODPROVDESC IS NOT  NULL                                ');
      // Início - William Santana - SOL 262367 PPM 1090694
      //Sql.Add(' AND SUBSTR(CODPROVDESC,3,3) <> ''280''                      ');   
      if trim(pRubrica) <> '' then
        Sql.Add(' AND IDPROVENTO in (' + pRubrica + ')' )
      else
      Sql.Add(' AND SUBSTR(CODPROVDESC,3,3) <> ''280''                      ');
      // Término - William Santana - SOL 262367 PPM 1090694
      Sql.Add(' ORDER BY CODPROVDESC                                        ');
      Open;
   end;

end;

procedure TfrmManutRubricaReembolsoINSS.sbtnAlterarClick(Sender: TObject);
begin
  inherited;

  if bbtnConfirmar.Enabled then
   begin
     bbtnCancelar.Click();
     Exit;
   end;

  chkbxListaIndividual.Enabled      := False;

  tsResultado.TabVisible            := False;

  edtMesCompetenciaINSS.ReadOnly    := False;
  cbNumBeneficioINSS.Enabled        := True;
  chkbxOpcHistRubricas.Enabled      := True;
  chkbxOpcHistBeneficios.Enabled    := True;
  //chkbxOpcRubIndividuais.Enabled    := True; // Andre Imakawa - SIG 51380

  chkbxOpcHistRubricas.Checked           := True;
  chkbxOpcHistBeneficios.Checked         := True;
  //chkbxOpcRubIndividuais.Checked         := True; // Andre Imakawa - SIG 51380

  bbtnConfirmar.Enabled := True;
  bbtnCancelar.Enabled  := True;

  if not chkbxListaIndividual.Checked then
    chkbxOpcHistRubricas.Checked := True
  Else
    chkbxOpcHistRubricasLista.Checked := True;

end;

procedure TfrmManutRubricaReembolsoINSS.AlterarIndividual;
begin

  // Andre Imakawa - SIG 51380 - Inicio
  {
  if (Trim(sSeqOriginal) = '') then
   begin
     MsgDlg('Campo identificador da tabela de Histórico de Rubricas Salariais não preenchido.','Aviso',mtInformation,[mbOk],0);
     Exit;
   end;
  }
  // Andre Imakawa - SIG 51380 - Fim
  
  if MsgDlg('Deseja efetivar a operação ?','Verifique',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      Exit;


  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;


  try
    if chkbxOpcHistRubricas.Checked then
     begin
       with qryAux do
       begin
         Close;
         Sql.Clear;
         Sql.Add(' UPDATE HISTRUBSAL    ');
         Sql.Add(' SET MESCOMPREEM = ' + QuotedStr(edtMesCompetenciaINSS.Text)    );
         Sql.Add(' WHERE IDPESSOA =  ' + QuotedStr(sIdPessoa)                     );
         Sql.Add('   AND MES = ' + QuotedStr(edtMesReferencia.Text)               );
         Sql.Add('   AND MESCOBRANCA = ' + QuotedStr(edtMesCobranca.Text)         );
         Sql.Add('   AND IDRUBRICA =   ' + QuotedStr(sIdRubrica)                  );

         // Andre Imakawa - SIG 51380 - Inicio
         if ( Length(Trim(sSeqOriginal)) > 0) or (sSeqOriginal <> '') then
           Sql.Add('   AND SEQORIGINAL = ' + sSeqOriginal                           );
         // Andre Imakawa - SIG 51380 - Fim

         //BRUNO AZEVEDO SOL 178884 Kintana 1665368
         Sql.Add('   AND SEQRUBRICA  = ' + sSeqRubrica                            );
         ExecSQL;
       end;
     end;


    if chkbxOpcHistBeneficios.Checked then
     begin
       with qryAux do
       begin
         Close;
         Sql.Clear;
         Sql.Add(' UPDATE HSTBENEFBFCIARIO                                     ');
         Sql.Add(' SET MESCOMPREEM = ' + QuotedStr(edtMesCompetenciaINSS.Text)  );
         Sql.Add(' WHERE IDPESSOA =  ' + QuotedStr(sIdPessoa)                   );
         Sql.Add('   AND FONTEPAGADORA = 2                                     ');

         // Andre Imakawa - SIG 51380 - Inicio
         //Sql.Add('   AND IDSEQINTERNOFB = ' + sSeqOriginal                      );
          if ( Length(Trim(sidplanoprev)) > 0) or (sidplanoprev <> '') then
            Sql.Add('   AND IDPLANOPREV = ' + sidplanoprev                        );

          if ( Length(Trim(sidbeneficio)) > 0) or (sidbeneficio <> '') then
            Sql.Add('   AND IDBENEFICIO = ' + QuotedStr(sidbeneficio)             );

          if ( Length(Trim(smes)) > 0) or (smes <> '') then
            Sql.Add('   AND MES = ' +  QuotedStr(smes)                            );

          if ( Length(Trim(smescobranca)) > 0) or (smescobranca <> '') then
            Sql.Add('   AND MESREFERENCIA = ' +  QuotedStr(smescobranca)          );

          if ( Length(Trim(sidmotivo)) > 0) or (sidmotivo <> '') then
            Sql.Add('   AND IDMOTIVO = ' + sidmotivo                              );

          if ( Length(Trim(snumeroprocesso)) > 0) or (snumeroprocesso <> '') then
            Sql.Add('   AND NUMEROPROCESSO = ' + QuotedStr(snumeroprocesso)       );

          if ( Length(Trim(sidpatro)) > 0) or (sidpatro <> '') then
            Sql.Add('   AND IDPESSJUR = ' + sidpatro                            );

          if ( Length(Trim(sidtitular)) > 0) or (sidtitular <> '') then
            Sql.Add('   AND IDTITULAR = ' + sidtitular                            );

          if ( Length(Trim(sidplanoorigem)) > 0) or (sidplanoorigem <> '') then
            Sql.Add('   AND IDPLANOORIGEM = ' + sidplanoorigem                    );

         // Andre Imakawa - SIG 51380 - Fim

         ExecSQL;
       end;
     end;

    // Andre Imakawa - SIG 51380 - Inicio
    {
    if chkbxOpcRubIndividuais.Checked then
     begin
       with qryAux do
       begin
         Close;
         Sql.Clear;
         Sql.Add(' UPDATE RUBRICAINDIV    ');
         Sql.Add(' SET MESCOMPREEM = ' + QuotedStr(edtMesCompetenciaINSS.Text)   );
         Sql.Add(' WHERE IDPESSOA =  ' + QuotedStr(sIdPessoa)                    );
         Sql.Add('   AND IDRUBRICA =   ' + QuotedStr(sIdRubrica)                 );
         Sql.Add('   AND IDSEQINTERNOFB = ' + sSeqOriginal                       );
         ExecSQL;
       end;
     end;
    }
    // Andre Imakawa - SIG 51380 - Fim

    if cbNumBeneficioINSS.ItemIndex >= 0 then
     begin
       with qryAux do
       begin
         Close;
         Sql.Clear;
         Sql.Add(' UPDATE HISTRUBSAL    ');
         Sql.Add(' SET NUMPROCINSS = ' + QuotedStr(cbNumBeneficioINSS.Text)    );
         Sql.Add(' WHERE IDPESSOA =  ' + QuotedStr(sIdPessoa)                     );
         Sql.Add('   AND MES = ' + QuotedStr(edtMesReferencia.Text)               );
         Sql.Add('   AND MESCOBRANCA = ' + QuotedStr(edtMesCobranca.Text)         );
         Sql.Add('   AND IDRUBRICA =   ' + QuotedStr(sIdRubrica)                  );

         // Andre Imakawa - SIG 51380 - Inicio
         if ( Length(Trim(sSeqOriginal)) > 0) or (sSeqOriginal <> '') then
           Sql.Add('   AND SEQORIGINAL = ' + sSeqOriginal                           );
         // Andre Imakawa - SIG 51380 - Fim

         ExecSQL;

       end;
     end;

    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;
  except
    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;
  end;

end;

procedure TfrmManutRubricaReembolsoINSS.bbtnConfirmarClick(
  Sender: TObject);
begin
  inherited;

  if (not chkbxListaIndividual.Checked) and
     (not chkbxOpcHistBeneficios.Checked) then
     //(not chkbxOpcRubIndividuais.Checked) then // Andre Imakawa - SIG 51380
    begin
      MsgDlg('É necessário selecionar “Histórico de Benefícios” ou “Rubricas Individuais” para proceder a alteração','Aviso',mtInformation,[mbOk],0);
      Exit;
    end;

  if (not chkbxListaIndividual.Checked) and
     (not chkbxOpcHistBeneficios.Checked) then
    begin
      if MsgDlg('Opção “Histórico de Benefícios” não selecionada. Deseja continuar ?','Verifique',mtConfirmation,[mbYes,mbNo],0) = mrNo then
        Exit;
    end;

  // Andre Imakawa - SIG 51380 - Incio
  {
  if (not chkbxListaIndividual.Checked) and
     (not chkbxOpcRubIndividuais.Checked) then
    begin
      if MsgDlg('Opção “Rubricas Individuais” não selecionada. Deseja continuar ?','Verifique',mtConfirmation,[mbYes,mbNo],0) = mrNo then
        Exit;
    end;
  }
  // Andre Imakawa - SIG 51380 - Fim

  if chkbxListaIndividual.Checked then
   begin
    if MsgDlg('Deseja efetivar a operação ?','Verifique',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      Exit;

    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;
   end
  Else
   begin
    AlterarIndividual();
   end;

  tsResultado.TabVisible            := True;

  edtMesCompetenciaINSS.ReadOnly    := True;
  cbNumBeneficioINSS.Enabled        := False;
  chkbxOpcHistRubricas.Enabled      := False;
  chkbxOpcHistBeneficios.Enabled    := False;
  //chkbxOpcRubIndividuais.Enabled    := False; // Andre Imakawa - SIG 51380
  chkbxListaIndividual.Enabled      := True;
  edtMesCompetenciaINSSLista.ReadOnly   := True;

  chkbxOpcHistRubricasLista.Enabled      := False;
  chkbxOpcHistBeneficiosLista.Enabled    := False;
  //chkbxOpcRubIndividuaisLista.Enabled    := False; // Andre Imakawa - SIG 51380


  sbtnAlterar.Down             := False;
  chkbxListaIndividual.Enabled := True;

  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;
  btnProcessar.Enabled  := False;

  if not chkbxListaIndividual.Checked then
    sbtnAlterar.Enabled := False;

end;

procedure TfrmManutRubricaReembolsoINSS.chkbxListaIndividualClick(
  Sender: TObject);
begin
  inherited;

  Limpar();

  btnProcessar.Enabled          :=  False;

  pnOpcoesIndiv02.Visible       := not chkbxListaIndividual.Checked;
  pnOpcaoMesCompetencia.Visible := not chkbxListaIndividual.Checked;
  pnOpcoesIndiv01.Visible       := not chkbxListaIndividual.Checked;

  pnOpcoesLista.Visible         := chkbxListaIndividual.Checked;

  tsLista.TabVisible            := chkbxListaIndividual.Checked;

  if chkbxListaIndividual.Checked then
   begin
      sbtnAlterar.Enabled  := False;
      sbtnProcurar.Enabled := False;

      // habilitar campos processamento lista
      edtMesCompetenciaINSSLista.Enabled      := True;
      edtMesCompetenciaINSSLista.ReadOnly     := False;

      edtMesCobrancaInicioConsulta.Enabled    := True;
      edtMesCompetenciaInicioConsulta.Enabled := True;
      edtMesCompetenciaFimConsulta.Enabled    := True;
      edtMesReferenciaInicioConsulta.Enabled  := True;
      edtMesReferenciaFimConsulta.Enabled     := True;

      edtMesCompetenciaINSSLista.ReadOnly     := False;
      edtMesCobrancaInicioConsulta.ReadOnly   := False;
      edtMesCompetenciaInicioConsulta.ReadOnly:= False;
      edtMesCompetenciaFimConsulta.ReadOnly   := False;
      edtMesReferenciaInicioConsulta.ReadOnly := False;
      edtMesReferenciaFimConsulta.ReadOnly    := False;

      chkbxOpcHistRubricasLista.Enabled       := True;
      chkbxOpcHistBeneficiosLista.Enabled     := True;
      //chkbxOpcRubIndividuaisLista.Enabled     := True; // Andre Imakawa - SIG 51380

      chkbxOpcHistRubricasLista.Checked       := True;
      chkbxOpcHistBeneficiosLista.Checked     := True;
      //chkbxOpcRubIndividuaisLista.Checked     := True; // Andre Imakawa - SIG 51380
   end
  Else
   begin
      sbtnProcurar.Enabled := True;
   end;

  if chkbxListaIndividual.Checked then
    frameBenef.DefineLista(0);
end;

procedure TfrmManutRubricaReembolsoINSS.bbtnCancelarClick(Sender: TObject);
begin
  inherited;

  Limpar();

  if chkbxListaIndividual.Checked then
   begin
    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;
   end;

  tsResultado.TabVisible       := True;
  sbtnAlterar.Enabled          := False;
  sbtnAlterar.Down             := False;
  chkbxListaIndividual.Enabled := True;

  btnProcessar.Enabled         := False;

  edtMesCompetenciaINSS.ReadOnly    := True;
  cbNumBeneficioINSS.Enabled        := False;
  chkbxOpcHistRubricas.Enabled      := False;
  chkbxOpcHistBeneficios.Enabled    := False;
  //chkbxOpcRubIndividuais.Enabled    := False; // Andre Imakawa - SIG 51380 - Incio
  chkbxListaIndividual.Enabled      := True;

  edtMesCompetenciaINSSLista.ReadOnly   := True;

  chkbxOpcHistRubricasLista.Enabled      := False;
  chkbxOpcHistBeneficiosLista.Enabled    := False;
  //chkbxOpcRubIndividuaisLista.Enabled    := False; // Andre Imakawa - SIG 51380

  edtMesCobrancaInicioConsulta.Enabled    := False;
  edtMesCompetenciaInicioConsulta.Enabled := False;
  edtMesCompetenciaFimConsulta.Enabled    := False;
  edtMesReferenciaInicioConsulta.Enabled  := False;
  edtMesReferenciaFimConsulta.Enabled     := False;
  chkbxOpcHistRubricasLista.Checked       := False;
  chkbxOpcHistBeneficiosLista.Checked     := False;
  //chkbxOpcRubIndividuaisLista.Checked     := False; // Andre Imakawa - SIG 51380

  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;
  btnProcessar.Enabled  := False;
  

end;

procedure TfrmManutRubricaReembolsoINSS.Limpar;
begin
   edtMatricula.Clear;
   edtBeneficiario.Clear;
   edtValorProvento.Clear;

   edtMesCobranca.Clear;
   edtMesReferencia.Clear;
   edtVersaoPagamento.Clear;

   edtMesCompetenciaINSS.Clear;
   chkbxOpcHistRubricas.Checked   := False;
   chkbxOpcHistBeneficios.Checked := False;
   //chkbxOpcRubIndividuais.Checked := False; // Andre Imakawa - SIG 51380

   cbNumBeneficioINSS.Clear;
   edtIdentificadorRubrica.Clear;
   edtRubrica.Clear;

   edtMesCobrancaInicioConsulta.Clear;
   edtMesCobrancaFimConsulta.Clear;
   edtMesCompetenciaInicioConsulta.Clear;
   edtMesCompetenciaFimConsulta.Clear;
   edtMesReferenciaInicioConsulta.Clear;
   edtMesReferenciaFimConsulta.Clear;

   edtMesCompetenciaINSSLista.Clear;
   chkbxOpcHistRubricasLista.Checked       := False;
   chkbxOpcHistBeneficiosLista.Checked     := False;
   //chkbxOpcRubIndividuaisLista.Checked     := False; // Andre Imakawa - SIG 51380

   qryConsulta.Close;

   qryResultado.Close;

   consultarRubricas();

end;

procedure TfrmManutRubricaReembolsoINSS.consultar;
begin
  if (MSBeneficiario.ValoresChave.Count > 0) and (MSBeneficiario.ValoresChave[0] <> '') then
   begin
     edtMatricula.Text       := MSBeneficiario.ValoresChave[0];
     edtBeneficiario.Text    := MSBeneficiario.ValoresChave[1];
     edtValorProvento.Text   := MSBeneficiario.ValoresChave[2];
     edtMesCobranca.Text     := MSBeneficiario.ValoresChave[3];
     edtMesReferencia.Text   := MSBeneficiario.ValoresChave[4];
     edtVersaoPagamento.Text := MSBeneficiario.ValoresChave[5];
     edtMesCompetenciaINSS.Text   := MSBeneficiario.ValoresChave[6];
     edtIdentificadorRubrica.Text := MSBeneficiario.ValoresChave[7];
     edtRubrica.Text              := MSBeneficiario.ValoresChave[8];

     sIdPessoa    := MSBeneficiario.ValoresChave[9];
     sIdRubrica   := MSBeneficiario.ValoresChave[10];
     sSeqOriginal := MSBeneficiario.ValoresChave[11];
     //BRUNO AZEVEDO SOL 178884 Kintana 1665368
     sSeqRubrica   := MSBeneficiario.ValoresChave[12];
     edtSeqRubrica.Text := sSeqRubrica;

     sNumProcINSS := '';

     // Andre Imakawa - SIG 51380 - Inicio
     sidplanoprev     := MSBeneficiario.ValoresChave[13];
     sidbeneficio     := MSBeneficiario.ValoresChave[14];
     smes             := MSBeneficiario.ValoresChave[3];
     smescobranca     := MSBeneficiario.ValoresChave[4];
     sidmotivo        := MSBeneficiario.ValoresChave[15];
     snumeroprocesso  := MSBeneficiario.ValoresChave[16];
     sidpatro         := MSBeneficiario.ValoresChave[17];
     sidtitular       := MSBeneficiario.ValoresChave[18];
     sidplanoorigem   := MSBeneficiario.ValoresChave[19];
     // Andre Imakawa - SIG 51380 - Fim

     consultarNumerosBeneficiosInss(sIdPessoa);
   end;
end;

procedure TfrmManutRubricaReembolsoINSS.chkbxOpcHistRubricasClick(
  Sender: TObject);
begin
  inherited;
  chkbxOpcHistRubricas.Checked   := True;
end;

procedure TfrmManutRubricaReembolsoINSS.btnProcessarClick(Sender: TObject);
begin
  inherited;

  if (not frameBenef.qryLista.Active) or (frameBenef.qryLista.recordCount = 0 ) then
   begin
      MsgDlg('Nenhum beneficiário selecionado na lista de processamento.','Aviso',mtInformation,[mbOk],0);
      Exit;
   end;

  if (not qryConsulta.Active) or (qryConsulta.recordCount = 0 ) then
   begin
      MsgDlg('Nenhuma rubrica selecionada.','Aviso',mtInformation,[mbOk],0);
      Exit;
   end;

  if ( Trim(edtMesCompetenciaINSSLista.Text) = '/' ) then
   begin
      MsgDlg('Mês de competência do reembolso do INSS não informado.','Aviso',mtInformation,[mbOk],0);
      edtMesCompetenciaINSSLista.SetFocus();
      Exit;
   end;

  if (chkbxListaIndividual.Checked) and
     (not chkbxOpcHistBeneficiosLista.Checked) then
    // (not chkbxOpcRubIndividuaisLista.Checked) then // Andre Imakawa - SIG 51380
    begin
      //MsgDlg('É necessário selecionar “Histórico de Benefícios” ou “Rubricas Individuais” para proceder a alteração','Aviso',mtInformation,[mbOk],0); // Andre Imakawa - SIG 51380
      MsgDlg('É necessário selecionar “Histórico de Benefícios” para proceder a alteração','Aviso',mtInformation,[mbOk],0);
      Exit;
    end;

  if (chkbxListaIndividual.Checked) and
     (not chkbxOpcHistBeneficiosLista.Checked) then
    begin
      if MsgDlg('Opção “Histórico de Benefícios” não selecionada. Deseja continuar ?','Verifique',mtConfirmation,[mbYes,mbNo],0) = mrNo then
        Exit;
    end;

  // Andre Imakawa - SIG 51380 - Inicio
  {
  if (chkbxListaIndividual.Checked) and
     (not chkbxOpcRubIndividuaisLista.Checked) then
    begin
      if MsgDlg('Opção “Rubricas Individuais” não selecionada. Deseja continuar ?','Verifique',mtConfirmation,[mbYes,mbNo],0) = mrNo then
        Exit;
    end;
   }
   // Andre Imakawa - SIG 51380 - Fim

  AlterarLista();


end;

procedure TfrmManutRubricaReembolsoINSS.AlterarLista;
begin
   qryConsulta.DisableControls;

   // Andre Imakawa - SIG 51380 - Inicio
   {
   qryConsulta.First;
   While not qryConsulta.Eof do
     begin
       if (qryConsulta.FieldByName('SEQORIGINAL').IsNull) or (qryConsulta.FieldByName('SEQORIGINAL').AsString = '') then
        begin
            MsgDlg('Campo identificador da tabela de Histórico de Rubricas Salariais não preenchido.','Aviso',mtInformation,[mbOk],0);
            qryConsulta.EnableControls;
            btnProcessar.Enabled := False;            
            Exit;
        end;
       qryConsulta.Next;
     end;
   }
   // Andre Imakawa - SIG 51380 - Fim

   if not dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.StartTransaction;

   Try

     qryConsulta.First;

     While not qryConsulta.Eof do
      begin
        if chkbxOpcHistRubricasLista.Checked then
         begin
           with qryAux do
           begin
             Close;
             Sql.Clear;
             Sql.Add(' UPDATE HISTRUBSAL    ');
             Sql.Add(' SET MESCOMPREEM = ' + QuotedStr(edtMesCompetenciaINSSLista.Text)                        );
             //Andre Imakawa - SOL 262367 PPM 1090694 - Inicio
             Sql.Add(' WHERE ROWID =  ' + QuotedStr( qryConsulta.FieldByName('ROWID_HISTRUBSAL').AsString )    );
             {
             Sql.Add(' WHERE IDPESSOA =  ' + QuotedStr( qryConsulta.FieldByName('IDPESSOA').AsString )         );
             Sql.Add('   AND MES = ' + QuotedStr( qryConsulta.FieldByName('MES').AsString )                    );
             Sql.Add('   AND MESCOBRANCA = ' + QuotedStr( qryConsulta.FieldByName('MESCOBRANCA').AsString )    );
             Sql.Add('   AND IDRUBRICA =   ' + QuotedStr( qryConsulta.FieldByName('IDRUBRICA').AsString )      );
             Sql.Add('   AND SEQORIGINAL = ' + qryConsulta.FieldByName('SEQORIGINAL').AsString                 );
             //BRUNO AZEVEDO SOL 178884 Kintana 1665368
             Sql.Add('   AND SEQRUBRICA  = ' + qryConsulta.FieldByName('SEQRUBRICA').AsString                 );
             }
             //Andre Imakawa - SOL 262367 PPM 1090694 - Fim
             ExecSQL;
           end;
         end;


      if chkbxOpcHistBeneficiosLista.Checked then
       begin
         with qryAux do
         begin
           Close;
           Sql.Clear;
           Sql.Add(' UPDATE HSTBENEFBFCIARIO                                                            ');
           Sql.Add(' SET MESCOMPREEM = ' + QuotedStr(edtMesCompetenciaINSSLista.Text)                    );
           Sql.Add(' WHERE IDPESSOA =  ' + QuotedStr( qryConsulta.FieldByName('IDPESSOA').AsString )     );
           Sql.Add('   AND FONTEPAGADORA = 2                                                            ');
           //Sql.Add('   AND IDSEQINTERNOFB = ' + qryConsulta.FieldByName('SEQORIGINAL').AsString          ); // Andre Imakawa - SIG 51380
           Sql.Add('   AND IDHSTFOLHABENEF = ' + qryConsulta.FieldByName('IDHSTFOLHABENEF').AsString     ); //Andre Imakawa - SOL 262367 PPM 1090694

           // Andre Imakawa - SIG 51380 - Inicio
           if ( Length(Trim(qryConsulta.FieldByName('IDPLANOPREV').AsString)) > 0) or
              (qryConsulta.FieldByName('IDPLANOPREV').AsString <> '') then
             Sql.Add('   AND IDPLANOPREV = ' + qryConsulta.FieldByName('IDPLANOPREV').AsString             );

           if ( Length(Trim(qryConsulta.FieldByName('IDBENEFICIO').AsString)) > 0) or
              (qryConsulta.FieldByName('IDBENEFICIO').AsString <> '') then
             Sql.Add('   AND IDBENEFICIO = ' + QuotedStr(qryConsulta.FieldByName('IDBENEFICIO').AsString)  );

           if ( Length(Trim(qryConsulta.FieldByName('MES').AsString)) > 0) or
              (qryConsulta.FieldByName('MES').AsString <> '') then
             Sql.Add('   AND MES = ' +  QuotedStr(qryConsulta.FieldByName('MES').AsString)                 );

           if ( Length(Trim(qryConsulta.FieldByName('MESCOBRANCA').AsString)) > 0) or
              (qryConsulta.FieldByName('MESCOBRANCA').AsString <> '') then
             Sql.Add('   AND MESREFERENCIA = ' +  QuotedStr(qryConsulta.FieldByName('MESCOBRANCA').AsString));

           if ( Length(Trim(qryConsulta.FieldByName('IDMOTIVO').AsString)) > 0) or
              (qryConsulta.FieldByName('IDMOTIVO').AsString <> '') then
             Sql.Add('   AND IDMOTIVO = ' + QuotedStr(qryConsulta.FieldByName('IDMOTIVO').AsString)         );

           if ( Length(Trim(qryConsulta.FieldByName('NUMEROPROCESSO').AsString)) > 0) or
              (qryConsulta.FieldByName('NUMEROPROCESSO').AsString <> '') then
             Sql.Add('   AND NUMEROPROCESSO = ' + QuotedStr(qryConsulta.FieldByName('NUMEROPROCESSO1').AsString)   );

           if ( Length(Trim(qryConsulta.FieldByName('IDPATRO').AsString)) > 0) or
              (qryConsulta.FieldByName('IDPATRO').AsString <> '') then
             Sql.Add('   AND IDPESSJUR = ' + qryConsulta.FieldByName('IDPATRO').AsString                   );

           if ( Length(Trim(qryConsulta.FieldByName('IDTITULAR').AsString)) > 0) or
              (qryConsulta.FieldByName('IDTITULAR').AsString <> '') then
             Sql.Add('   AND IDTITULAR = ' + qryConsulta.FieldByName('IDTITULAR').AsString                   );

           if ( Length(Trim(qryConsulta.FieldByName('IDPLANOORIGEM').AsString)) > 0) or
              (qryConsulta.FieldByName('IDPLANOORIGEM').AsString <> '') then
             Sql.Add('   AND IDPLANOORIGEM = ' + qryConsulta.FieldByName('IDPLANOORIGEM').AsString           );
           // Andre Imakawa - SIG 51380 - Fim

           ExecSQL;
         end;
       end;

      // Andre Imakawa - SIG 51380 - Inicio
      {
      if chkbxOpcRubIndividuaisLista.Checked then
       begin
         with qryAux do
         begin
           Close;
           Sql.Clear;
           Sql.Add(' UPDATE RUBRICAINDIV                                                                ');
           Sql.Add(' SET MESCOMPREEM = ' + QuotedStr(edtMesCompetenciaINSSLista.Text)                    );
           Sql.Add(' WHERE IDPESSOA =  ' + QuotedStr( qryConsulta.FieldByName('IDPESSOA').AsString )     );
           Sql.Add('   AND IDRUBRICA =   ' + QuotedStr( qryConsulta.FieldByName('IDRUBRICA').AsString )  );
           Sql.Add('   AND IDSEQINTERNOFB = ' + qryConsulta.FieldByName('SEQORIGINAL').AsString          );
           ExecSQL;
         end;
       end;
      }
      // Andre Imakawa - SIG 51380 - Fim

        qryConsulta.Next;
      end;

   Finally

    qryConsulta.EnableControls;

   end;

  bbtnConfirmar.Enabled := True;
  bbtnCancelar.Enabled  := True;


end;

procedure TfrmManutRubricaReembolsoINSS.chkbxOpcHistRubricasListaClick(
  Sender: TObject);
begin
  inherited;
  chkbxOpcHistRubricasLista.Checked   := True;
end;

procedure TfrmManutRubricaReembolsoINSS.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if  bbtnConfirmar.Enabled and ( MsgDlg('Todas as operações serão canceladas. Deseja continuar?','Verifique',mtConfirmation,[mbYes,mbNo],0) = mrNo ) then
   begin
    CanClose := False;
    Exit;
   end;

  if dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.Rollback;
end;

procedure TfrmManutRubricaReembolsoINSS.consultarRubricasSelecionadas;
begin
   qryConsulta.Close;
   With qryConsulta do
    begin
       Sql.Clear;
       Sql.Add(' SELECT DISTINCT DEPENTIT.MATRICULA,                                 ');    // edilaine - SOL 197482 / KTN 1905336 //Andre Imakawa - SOL 262367 PPM 1090694
       Sql.Add('        PESSOA.NOME,                                                 ');
       Sql.Add('        HISTRUBSAL.VALORPROVENTO,                                    ');
       Sql.Add('        HISTRUBSAL.MESCOBRANCA,                                      ');
       Sql.Add('        HISTRUBSAL.MES,                                              ');
       Sql.Add('        HISTRUBSAL.IDVERSAOPAGTO,                                    ');
       Sql.Add('        HISTRUBSAL.MESCOMPREEM,                                      ');
       //Sql.Add('        HSTBENEFBFCIARIO.NUMEROPROCESSO,                             ');  // edilaine - SOL 197482 / KTN 1905336 - comentado
       Sql.Add('        HistRubSal.NumProcInss as NUMEROPROCESSO,                    ');    // edilaine - SOL 197482 / KTN 1905336
       //BRUNO AZEVEDO SOL 180865 Kintana 1678136
       Sql.Add('        to_char(HistRubSal.NumProcInss) as NumProcInss,              ');
       //BRUNO AZEVEDO SOL 180865 Kintana 1678136
       Sql.Add('        PROVDESC.CODPROVDESC,                                        ');
       Sql.Add('        PROVDESC.DESCRICAO,                                          ');
       Sql.Add('        HISTRUBSAL.IDPESSOA,                                         ');
       Sql.Add('        HISTRUBSAL.IDRUBRICA,                                        ');
       Sql.Add('        HISTRUBSAL.SEQORIGINAL,                                      ');
       Sql.Add('        HISTRUBSAL.SEQORIGINAL,                                      ');
       //BRUNO AZEVEDO SOL 178884 Kintana 1665368
       Sql.Add('        HISTRUBSAL.SEQRUBRICA,                                       ');
       Sql.Add('        HISTRUBSAL.IDHSTFOLHABENEF,                                   ');

       // Andre Imakawa - SIG 51380 - Inicio
       Sql.Add('        HISTRUBSAL.IDPLANOPREV,                                       ');
       Sql.Add('        HISTRUBSAL.IDBENEFICIO,                                       ');
       Sql.Add('        HISTRUBSAL.IDMOTIVO,                                          ');
       Sql.Add('        HISTRUBSAL.NUMEROPROCESSO AS NUMEROPROCESSO1,                 ');
       Sql.Add('        HISTRUBSAL.IDPATRO,                                         ');
       Sql.Add('        HISTRUBSAL.IDTITULAR,                                         ');
       Sql.Add('        HISTRUBSAL.IDPLANOORIGEM,                                     ');
       // Andre Imakawa - SIG 51380 - Fim

       Sql.Add('        HISTRUBSAL.ROWID AS ROWID_HISTRUBSAL                         ');//Andre Imakawa - SOL 262367 PPM 1090694
       Sql.Add(' FROM CM.HISTRUBSAL,                                                 ');
       //Sql.Add('      CM.HSTBENEFBFCIARIO,                                           ');  // edilaine - SOL 197482 / KTN 1905336 - comentado
       Sql.Add('      CM.DEPENTIT,                                                   ');
       Sql.Add('      CM.PESSOA,                                                     ');
       Sql.Add('      CM.PROVDESC                                                    ');
       // edilaine - SOL 197482 / KTN 1905336 - inicio

      // Sql.Add(' WHERE '+ sFILTRO );                                                //William Santana - SOL 262367 PPM 1090694
      //Andre Imakawa - SOL 262367 PPM 1090694 - Inicio
      if chkbxListaIndividual.Checked then
      begin
         Sql.Add(' WHERE exists (Select 1 from HSTBENEFBFCIARIO HSTBENEF                                ');  //Andre Imakawa - SOL 262367 PPM 1090694
         Sql.Add('               where DEPENTIT.IDPESSOA      = HSTBENEF.IDPESSOA                       ');
         Sql.Add('                 AND DEPENTIT.IDTITULAR     = HSTBENEF.IDTITULAR                      ');
         Sql.Add('                 AND HISTRUBSAL.IDTITULAR   = HSTBENEF.IDTITULAR                      ');
         Sql.Add('                 AND HISTRUBSAL.IDPESSOA    = HSTBENEF.IDPESSOA                       ');
         Sql.Add('                 AND HISTRUBSAL.IDPATRO     = HSTBENEF.IDPESSJUR                      ');
         Sql.Add('                 AND HISTRUBSAL.MESCOBRANCA = HSTBENEF.MES                            ');
         Sql.Add('                 AND HSTBENEF.FONTEPAGADORA = 2                                       ');
         Sql.Add('                )                                                                     ');
      end;
      //Andre Imakawa - SOL 262367 PPM 1090694 - Fim
      
       {Sql.Add(' WHERE HISTRUBSAL.IDTITULAR       = HSTBENEFBFCIARIO.IDTITULAR       ');
       Sql.Add(' AND   HISTRUBSAL.IDPESSOA        = HSTBENEFBFCIARIO.IDPESSOA        ');
       Sql.Add(' AND   HISTRUBSAL.IDPATRO         = HSTBENEFBFCIARIO.IDPESSJUR       ');
       Sql.Add(' AND   HSTBENEFBFCIARIO.IDPESSOA  = DEPENTIT.IDPESSOA                ');
       Sql.Add(' AND   HSTBENEFBFCIARIO.IDTITULAR = DEPENTIT.IDTITULAR               ');
       Sql.Add(' AND   HSTBENEFBFCIARIO.IDPESSOA  = PESSOA.IDPESSOA                  ');
       Sql.Add(' AND   HSTBENEFBFCIARIO.MES       = HISTRUBSAL.MESCOBRANCA           ');
       }// edilaine - SOL 197482 / KTN 1905336 - fim
       if chkbxListaIndividual.Checked then
          Sql.Add(' AND   DEPENTIT.IDPESSOA       = HISTRUBSAL.IDPESSOA                  ')
       else
          Sql.Add(' WHERE   DEPENTIT.IDPESSOA     = HISTRUBSAL.IDPESSOA                  '); //William Santana - SOL 262367 PPM 1090694
       Sql.Add(' AND   DEPENTIT.IDTITULAR         = HISTRUBSAL.IDTITULAR                  '); //William Santana - SOL 262367 PPM 1090694
       Sql.Add(' AND   HISTRUBSAL.IDPESSOA        = PESSOA.IDPESSOA                  ');
       Sql.Add(' AND   HISTRUBSAL.IDRUBRICA       = PROVDESC.IDPROVENTO              ');
       //Sql.Add(' AND   HISTRUBSAL.FONTEPAGADORA   = PROVDESC.CODFONTEPAGADORA        ');
       //Sql.Add(' AND   HSTBENEFBFCIARIO.FONTEPAGADORA  = 2                           ');  // edilaine - SOL 197482 / KTN 1905336 - comentado

       if Trim(edtMesCobrancaInicioConsulta.Text) <> '/' then
         Sql.Add(' AND   HISTRUBSAL.MESCOBRANCA   >= ' + QuotedStr( Trim(edtMesCobrancaInicioConsulta.Text) )  );
       if Trim(edtMesCobrancaFimConsulta.Text) <> '/' then
         Sql.Add(' AND   HISTRUBSAL.MESCOBRANCA   <= ' + QuotedStr( Trim(edtMesCobrancaFimConsulta.Text) )  );

       if Trim(edtMesReferenciaInicioConsulta.Text) <> '/' then
         Sql.Add(' AND   HISTRUBSAL.MES   >= ' + QuotedStr( Trim(edtMesReferenciaInicioConsulta.Text) )  );
       if Trim(edtMesReferenciaFimConsulta.Text) <> '/' then
         Sql.Add(' AND   HISTRUBSAL.MES   <= ' + QuotedStr( Trim(edtMesReferenciaFimConsulta.Text) )  );

       if Trim(edtMesCompetenciaInicioConsulta.Text) <> '/' then
         Sql.Add(' AND   HISTRUBSAL.MESCOMPREEM   >= ' + QuotedStr( Trim(edtMesCompetenciaInicioConsulta.Text) )  );
       if Trim(edtMesCompetenciaFimConsulta.Text) <> '/' then
         Sql.Add(' AND   HISTRUBSAL.MESCOMPREEM   <= ' + QuotedStr( Trim(edtMesCompetenciaFimConsulta.Text) )  );

       if dblcRubrica.Text <> '' then
         Sql.Add(' AND  PROVDESC.CODPROVDESC  = ' + QuotedStr( Trim( qryRubrica.FieldByName('CODPROVDESC').AsString ) )  );

       //Andre Imakawa - SOL 262367 PPM 1090694 - Inicio

       Sql.Add(' AND HISTRUBSAL.IDPESSJUR IN (1,91008)                                ');
       Sql.Add(' AND HISTRUBSAL.FONTEPAGADORA   = 2                                   ');
       Sql.Add(' AND HISTRUBSAL.IDMODULO = 18                                         ');

       //Andre Imakawa - SOL 262367 PPM 1090694 - Fim

       Sql.Add('   AND EXISTS                        ');
       Sql.Add('   (                                 ');
       Sql.Add('     SELECT 1                        ');
       Sql.Add('     FROM LISTAFOLHABENEFDET L       ');
       Sql.Add('     WHERE L.IDLISTA = ' + IntToStr(framebenef.ListaUsuario) );
       Sql.Add('     AND L.IDTITULAR = HISTRUBSAL.IDTITULAR');  //Andre Imakawa - SOL 262367 PPM 1090694
       Sql.Add('     AND L.IDPESSOA = HISTRUBSAL.IDPESSOA');
       Sql.Add('   )                                 ');

       //Everson TIBERO - Início
       {Sql.Add(' ORDER BY MATRICULA,                                 ');
       Sql.Add('          MESCOBRANCA DESC,                          ');
       Sql.Add('          MES DESC,                                  ');
       Sql.Add('          DESCRICAO                                  ');}

       Sql.Add(' ORDER BY DEPENTIT.MATRICULA,                         ');
       Sql.Add('          HISTRUBSAL.MESCOBRANCA DESC,                ');
       Sql.Add('          HISTRUBSAL.MES DESC,                        ');
       Sql.Add('          PROVDESC.DESCRICAO                          ');
       //Everson TIBERO - Fim

       Open;
    end;

end;

procedure TfrmManutRubricaReembolsoINSS.btnConsultarClick(Sender: TObject);
var vRubSel: String;
begin
  inherited;

  vRubSel := '';

  if dblcRubrica.Text <> '' then
    vRubSel := qryRubrica.FieldByName('DESCRICAO').AsString;

  qryConsulta.Close;
  btnProcessar.Enabled :=  False;

  if ( Trim(edtMesCobrancaInicioConsulta.Text) = '/' ) and
     ( Trim(edtMesCobrancaFimConsulta.Text) = '/' ) and
     ( Trim(edtMesCompetenciaInicioConsulta.Text) = '/' ) and
     ( Trim(edtMesCompetenciaFimConsulta.Text) = '/' ) and
     ( Trim(edtMesReferenciaInicioConsulta.Text) = '/' ) and
     ( Trim(edtMesReferenciaFimConsulta.Text) = '/' ) and
     ( Trim(dblcRubrica.Text) = '' ) then
    begin
      MsgDlg('Para efetuar a consulta é necessário selecionar um dos parâmetros apresentados na interface.','Aviso',mtInformation,[mbOk],0);
      Exit;
    end;

  if ( Trim(edtMesCobrancaInicioConsulta.Text) = '/' ) and
     ( Trim(edtMesCobrancaFimConsulta.Text) = '/' ) and
     ( Trim(edtMesCompetenciaInicioConsulta.Text) = '/' ) and
     ( Trim(edtMesCompetenciaFimConsulta.Text) = '/' ) and
     ( Trim(edtMesReferenciaInicioConsulta.Text) = '/' ) and
     ( Trim(edtMesReferenciaFimConsulta.Text) = '/' ) and
     ( Trim(dblcRubrica.Text) <> '' ) then
    begin
      MsgDlg('Para efetuar a consulta é necessário selecionar outros parâmetros para consulta apresentados na interface.','Aviso',mtInformation,[mbOk],0);
      Exit;
    end;

  consultarRubricasSelecionadas();

  consultarRubricasAposConsulta();

  if vRubSel <> '' then
    dblcRubrica.Text := vRubSel;


  btnProcessar.Enabled :=  ( Trim(edtMesCompetenciaINSSLista.Text) <> ''  ) and (qryConsulta.Active) and (qryConsulta.recordCount > 0 );
  
end;

procedure TfrmManutRubricaReembolsoINSS.AlterarListaAnt;
begin
   With qryAux do
   begin
     Close;
     Sql.Clear;
     Sql.Add(' UPDATE HISTRUBSAL  H  ');
     Sql.Add(' SET MESCOMPREEM = ' + QuotedStr(edtMesCompetenciaINSSLista.Text) );
     Sql.Add('   AND FONTEPAGADORA = 2             ');
     Sql.Add('   AND EXISTS                        ');
     Sql.Add('   (                                 ');
     Sql.Add('     SELECT 1                        ');
     Sql.Add('     FROM LISTAFOLHABENEFDET L       ');
     Sql.Add('     WHERE L.IDLISTA = ' + IntToStr(framebenef.ListaUsuario) );
     Sql.Add('     AND L.IDTITULAR = H.IDTITULAR     ');    //Andre Imakawa - SOL 262367 PPM 1090694
     Sql.Add('     AND L.IDPESSOA = H.IDPESSOA     ');
     Sql.Add('   )                                 ');

     ExecSQL;


    if chkbxOpcHistBeneficiosLista.Checked then
     begin
       with qryAux do
       begin
         Close;
         Sql.Clear;
         Sql.Add(' UPDATE HSTBENEFBFCIARIO H           ');
         Sql.Add(' SET MESCOMPREEM = ' + QuotedStr(edtMesCompetenciaINSSLista.Text)    );
         Sql.Add('   AND FONTEPAGADORA = 2             ');
         Sql.Add('   AND EXISTS                        ');
         Sql.Add('   (                                 ');
         Sql.Add('     SELECT 1                        ');
         Sql.Add('     FROM LISTAFOLHABENEFDET L       ');
         Sql.Add('     WHERE L.IDLISTA = ' + IntToStr(framebenef.ListaUsuario) );
         Sql.Add('     AND L.IDTITULAR = H.IDTITULAR    ');  //Andre Imakawa - SOL 262367 PPM 1090694
         Sql.Add('     AND L.IDPESSOA = H.IDPESSOA     ');
         Sql.Add('   )                                 ');
         ExecSQL;
       end;
     end;

    // Andre Imakawa - SIG 51380 - Inicio
    {
    if chkbxOpcRubIndividuaisLista.Checked then
     begin
       with qryAux do
       begin
         Close;
         Sql.Clear;
         Sql.Add(' UPDATE RUBRICAINDIV R   ');
         Sql.Add(' SET MESCOMPREEM = ' + QuotedStr(edtMesCompetenciaINSSLista.Text)   );
         Sql.Add('   AND EXISTS                        ');
         Sql.Add('   (                                 ');
         Sql.Add('    SELECT 1                         ');
         Sql.Add('    FROM PROVDESC P                  ');
         Sql.Add('    WHERE P.IDPROVENTO = R.IDRUBRICA ');
         Sql.Add('    AND P.CODFONTEPAGADORA = 2       ');
         Sql.Add('   )                                 ');
         Sql.Add('   AND EXISTS                        ');
         Sql.Add('   (                                 ');
         Sql.Add('     SELECT 1                        ');
         Sql.Add('     FROM LISTAFOLHABENEFDET L       ');
         Sql.Add('     WHERE L.IDLISTA = ' + IntToStr(framebenef.ListaUsuario) );
         Sql.Add('     AND L.IDTITULAR = R.IDTITULAR     '); //Andre Imakawa - SOL 262367 PPM 1090694
         Sql.Add('     AND L.IDPESSOA = R.IDPESSOA     ');
         Sql.Add('   )                                 ');
         ExecSQL;
       end;
     end;
    }
    // Andre Imakawa - SIG 51380 - Fim

   end;

end;

procedure TfrmManutRubricaReembolsoINSS.dblcRubricaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  if key = vk_return then
    dblcRubrica.Text := '';

end;

procedure TfrmManutRubricaReembolsoINSS.edtMesCompetenciaINSSListaChange(  Sender: TObject);
begin
  inherited;
  btnProcessar.Enabled :=  ( Trim(edtMesCompetenciaINSSLista.Text) <> ''  ) and (qryConsulta.Active) and (qryConsulta.recordCount > 0 );
end;

procedure TfrmManutRubricaReembolsoINSS.edtMesCompetenciaINSSListaExit(  Sender: TObject);
begin
  inherited;
  btnProcessar.Enabled :=  ( Trim(edtMesCompetenciaINSSLista.Text) <> ''  ) and (qryConsulta.Active) and (qryConsulta.recordCount > 0 );
end;

procedure TfrmManutRubricaReembolsoINSS.consultarRubricasAposConsulta;
var
  sRubrica: String;  //William Santana - SOL 262367 PPM 1090694
begin

   //Início - William Santana - SOL 262367 PPM 1090694
   sRubrica := ',';
   qryConsulta.First;
   qryConsulta.DisableControls;
   while not qryConsulta.Eof do
   begin
     if Pos(','+qryConsulta.FieldByName('IDRUBRICA').AsString+',', sRubrica) = 0 then
       sRubrica := sRubrica + qryConsulta.FieldByName('IDRUBRICA').AsString+',';

     qryConsulta.Next;
   end;
   qryConsulta.First;
   qryConsulta.EnableControls;
   delete(sRubrica,1,1);
   delete(sRubrica,length(sRubrica),length(sRubrica));

   consultarRubricas(sRubrica);

 //  qryRubrica.Close;
//   With qryRubrica do
//    begin
//       Sql.Clear;
//       Sql.Add(' SELECT /*+ PARALLEL(HISTRUBSAL,20,1) (PESSOA,20,1)*/                ');    // edilaine - SOL 197482 / KTN 1905336
//       Sql.Add('        DISTINCT PROVDESC.CODPROVDESC                                ');    // edilaine - SOL 197482 / KTN 1905336
//       Sql.Add('               , PROVDESC.DESCRICAO                                  ');
//       Sql.Add('               , PROVDESC.DESCRPROVDESC                              ');
//       Sql.Add('               , PROVDESC.IDPROVENTO                                 ');
//       Sql.Add(' FROM CM.HISTRUBSAL,                                                 ');
//       //Sql.Add('      CM.HSTBENEFBFCIARIO,                                           ');  // edilaine - SOL 197482 / KTN 1905336 - comentado
//       Sql.Add('      CM.DEPENTIT,                                                   ');
//       Sql.Add('      CM.PESSOA,                                                     ');
//       Sql.Add('      CM.PROVDESC                                                    ');
//       // edilaine - SOL 197482 / KTN 1905336 - inicio
//       Sql.Add(' WHERE '+ sFILTRO ) ;
//       {Sql.Add(' WHERE HISTRUBSAL.IDTITULAR       = HSTBENEFBFCIARIO.IDTITULAR       ');
//       Sql.Add(' AND   HISTRUBSAL.IDPESSOA        = HSTBENEFBFCIARIO.IDPESSOA        ');
//       Sql.Add(' AND   HISTRUBSAL.IDPATRO         = HSTBENEFBFCIARIO.IDPESSJUR       ');
//       Sql.Add(' AND   HSTBENEFBFCIARIO.IDPESSOA  = DEPENTIT.IDPESSOA                ');
//       Sql.Add(' AND   HSTBENEFBFCIARIO.IDTITULAR = DEPENTIT.IDTITULAR               ');
//       Sql.Add(' AND   HSTBENEFBFCIARIO.IDPESSOA  = PESSOA.IDPESSOA                  ');
//       Sql.Add(' AND   HSTBENEFBFCIARIO.MES       = HISTRUBSAL.MESCOBRANCA           ');
//       }// edilaine - SOL 197482 / KTN 1905336 - fim
//       Sql.Add(' AND   DEPENTIT.IDPESSOA          = PESSOA.IDPESSOA                  ');
//       Sql.Add(' AND   HISTRUBSAL.IDPESSOA        = PESSOA.IDPESSOA                  ');
//       Sql.Add(' AND   HISTRUBSAL.IDRUBRICA       = PROVDESC.IDPROVENTO              ');
//       Sql.Add(' AND   HISTRUBSAL.FONTEPAGADORA   = PROVDESC.CODFONTEPAGADORA        ');
//       Sql.Add(' AND   HISTRUBSAL.FONTEPAGADORA   = 2                                ');
//       //Sql.Add(' AND   HSTBENEFBFCIARIO.FONTEPAGADORA  = 2                           ');  // edilaine - SOL 197482 / KTN 1905336 - comentado
//
//       if Trim(edtMesCobrancaInicioConsulta.Text) <> '/' then
//         Sql.Add(' AND   HISTRUBSAL.MESCOBRANCA   >= ' + QuotedStr( Trim(edtMesCobrancaInicioConsulta.Text) )  );
//       if Trim(edtMesCobrancaFimConsulta.Text) <> '/' then
//         Sql.Add(' AND   HISTRUBSAL.MESCOBRANCA   <= ' + QuotedStr( Trim(edtMesCobrancaFimConsulta.Text) )  );
//
//       if Trim(edtMesReferenciaInicioConsulta.Text) <> '/' then
//         Sql.Add(' AND   HISTRUBSAL.MES   >= ' + QuotedStr( Trim(edtMesReferenciaInicioConsulta.Text) )  );
//       if Trim(edtMesReferenciaFimConsulta.Text) <> '/' then
//         Sql.Add(' AND   HISTRUBSAL.MES   <= ' + QuotedStr( Trim(edtMesReferenciaFimConsulta.Text) )  );
//
//       if Trim(edtMesCompetenciaInicioConsulta.Text) <> '/' then
//         Sql.Add(' AND   HISTRUBSAL.MESCOMPREEM   >= ' + QuotedStr( Trim(edtMesCompetenciaInicioConsulta.Text) )  );
//       if Trim(edtMesCompetenciaFimConsulta.Text) <> '/' then
//         Sql.Add(' AND   HISTRUBSAL.MESCOMPREEM   <= ' + QuotedStr( Trim(edtMesCompetenciaFimConsulta.Text) )  );
//
//       Sql.Add('   AND EXISTS                        ');
//       Sql.Add('   (                                 ');
//       Sql.Add('     SELECT 1                        ');
//       Sql.Add('     FROM LISTAFOLHABENEFDET L       ');
//       Sql.Add('     WHERE L.IDLISTA = ' + IntToStr(framebenef.ListaUsuario) );
//       Sql.Add('     AND L.IDPESSOA = PESSOA.IDPESSOA');
//       Sql.Add('   )                                 ');
//
//       Sql.Add(' ORDER BY CODPROVDESC                ');
//       Open;
//    end;

//Término - William Santana - SOL 262367 PPM 1090694

end;

procedure TfrmManutRubricaReembolsoINSS.dblcRubricaResultadoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_return then
    dblcRubricaResultado.Text := '';
end;

procedure TfrmManutRubricaReembolsoINSS.consultarRubricasResultadoAposConsulta;
var
  sRubrica: String;  //William Santana - SOL 262367 PPM 1090694
begin

   //Início - William Santana - SOL 262367 PPM 1090694
   sRubrica := ',';
   qryResultado.First;
   qryResultado.DisableControls;
   while not qryResultado.Eof do
   begin
     if Pos(','+qryResultado.FieldByName('IDRUBRICA').AsString+',', sRubrica) = 0 then
       sRubrica := sRubrica + qryResultado.FieldByName('IDRUBRICA').AsString+',';

     qryResultado.Next;
   end;
   qryResultado.First;
   qryResultado.EnableControls;
   delete(sRubrica,1,1);
   delete(sRubrica,length(sRubrica),length(sRubrica));

   consultarRubricas(sRubrica);

 //  qryRubricaResultado.Close;
//   With qryRubricaResultado do
//    begin
//       Sql.Clear;
//       Sql.Add(' SELECT /*+ PARALLEL(HISTRUBSAL,20,1) (PESSOA,20,1)*/                ');   // edilaine - SOL 197482 / KTN 1905336
//       Sql.Add('        DISTINCT PROVDESC.CODPROVDESC                                ');   // edilaine - SOL 197482 / KTN 1905336
//       Sql.Add('               , PROVDESC.DESCRICAO                                  ');
//       Sql.Add('               , PROVDESC.DESCRPROVDESC                              ');
//       Sql.Add('               , PROVDESC.IDPROVENTO                                 ');
//       Sql.Add(' FROM CM.HISTRUBSAL,                                                 ');
//       //Sql.Add('      CM.HSTBENEFBFCIARIO,                                           '); // edilaine - SOL 197482 / KTN 1905336 - comentado
//       Sql.Add('      CM.DEPENTIT,                                                   ');
//       Sql.Add('      CM.PESSOA,                                                     ');
//       Sql.Add('      CM.PROVDESC                                                    ');
//       // edilaine - SOL 197482 / KTN 1905336 - inicio
//       Sql.Add(' WHERE '+ sFILTRO );
//       {Sql.Add(' WHERE HISTRUBSAL.IDTITULAR       = HSTBENEFBFCIARIO.IDTITULAR       ');
//       Sql.Add(' AND   HISTRUBSAL.IDPESSOA        = HSTBENEFBFCIARIO.IDPESSOA        ');
//       Sql.Add(' AND   HISTRUBSAL.IDPATRO         = HSTBENEFBFCIARIO.IDPESSJUR       ');
//       Sql.Add(' AND   HSTBENEFBFCIARIO.IDPESSOA  = DEPENTIT.IDPESSOA                ');
//       Sql.Add(' AND   HSTBENEFBFCIARIO.IDTITULAR = DEPENTIT.IDTITULAR               ');
//       Sql.Add(' AND   HSTBENEFBFCIARIO.IDPESSOA  = PESSOA.IDPESSOA                  ');
//       Sql.Add(' AND   HSTBENEFBFCIARIO.MES       = HISTRUBSAL.MESCOBRANCA           ');
//       }// edilaine - SOL 197482 / KTN 1905336 - fim
//       Sql.Add(' AND   DEPENTIT.IDPESSOA          = PESSOA.IDPESSOA                  ');
//       Sql.Add(' AND   HISTRUBSAL.IDPESSOA        = PESSOA.IDPESSOA                  ');
//       Sql.Add(' AND   HISTRUBSAL.IDRUBRICA       = PROVDESC.IDPROVENTO              ');
//       Sql.Add(' AND   HISTRUBSAL.FONTEPAGADORA   = PROVDESC.CODFONTEPAGADORA        ');
//       Sql.Add(' AND   HISTRUBSAL.FONTEPAGADORA   = 2                                ');
//       //Sql.Add(' AND   HSTBENEFBFCIARIO.FONTEPAGADORA  = 2                           ');   // edilaine - SOL 197482 / KTN 1905336 - comentado
//       if Trim(edtMesCobrancaInicio.Text) <> '/' then
//         Sql.Add(' AND   HISTRUBSAL.MESCOBRANCA   >= ' + QuotedStr( Trim(edtMesCobrancaInicio.Text) )  );
//       if Trim(edtMesCobrancaFim.Text) <> '/' then
//         Sql.Add(' AND   HISTRUBSAL.MESCOBRANCA   <= ' + QuotedStr( Trim(edtMesCobrancaFim.Text) )  );
//
//       if Trim(edtMesReferenciaInicio.Text) <> '/' then
//         Sql.Add(' AND   HISTRUBSAL.MES   >= ' + QuotedStr( Trim(edtMesReferenciaInicio.Text) )  );
//       if Trim(edtMesReferenciaFim.Text) <> '/' then
//         Sql.Add(' AND   HISTRUBSAL.MES   <= ' + QuotedStr( Trim(edtMesReferenciaFim.Text) )  );
//
//       if Trim(edtMesCompetenciaInicio.Text) <> '/' then
//         Sql.Add(' AND   HISTRUBSAL.MESCOMPREEM   >= ' + QuotedStr( Trim(edtMesCompetenciaInicio.Text) )  );
//       if Trim(edtMesCompetenciaFim.Text) <> '/' then
//         Sql.Add(' AND   HISTRUBSAL.MESCOMPREEM   <= ' + QuotedStr( Trim(edtMesCompetenciaFim.Text) )  );
//
//       Sql.Add('   AND EXISTS                        ');
//       Sql.Add('   (                                 ');
//       Sql.Add('     SELECT 1                        ');
//       Sql.Add('     FROM LISTAFOLHABENEFDET L       ');
//       Sql.Add('     WHERE L.IDLISTA = ' + IntToStr(framebenef.ListaUsuario) );
//       Sql.Add('     AND L.IDPESSOA = PESSOA.IDPESSOA');
//       Sql.Add('   )                                 ');
//
//       Sql.Add(' ORDER BY CODPROVDESC                ');
//
//       Open;
//    end;

//Término - William Santana - SOL 262367 PPM 1090694

end;

// edilaine - SOL 197482 / KTN 1905336
procedure TfrmManutRubricaReembolsoINSS.MSBeneficiarioBeforeOpenCds(
  var sqlText: String; strListParams: TStringList);
begin
  inherited;
  //Início - William Santana - SOL 262367 PPM 1090694
 // if chkbxListaIndividual.Checked then // SOL 245726 PPM 625076
//     sqlText := StringReplace(sqlText, 'WHERE', 'WHERE ' + sFILTRO, [rfReplaceAll])
//  else
//     sqlText := StringReplace(sqlText, 'WHERE', 'WHERE ' + sFILTROIND, [rfReplaceAll]); // SOL 245726 PPM 625076
  //Término William Santana - SOL 262367 PPM 1090694

end;

end.
