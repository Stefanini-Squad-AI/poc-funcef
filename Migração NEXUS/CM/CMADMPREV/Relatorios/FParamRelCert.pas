// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO 
//------------------------------------------------------------------------------
unit FParamRelCert;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, ComCtrls, MontaSelect;

type
  TfrmParamRelCert = class(TfrmOkCancelar)
    pgcQuantPart: TPageControl;
    tbsUmPart: TTabSheet;
    tbsVarPart: TTabSheet;
    grbFaixa: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    mebMesFim: TMaskEdit;
    mebMesIni: TMaskEdit;
    edNomePart: TEdit;
    Label3: TLabel;
    edPlano: TEdit;
    Label4: TLabel;
    edMatricula: TEdit;
    Label5: TLabel;
    MontaSelect1: TMontaSelect;
    gpbProcura: TGroupBox;
    Label6: TLabel;
    bbtnProcurar: TBitBtn;
    edInscricao: TEdit;
    Label7: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    sIdPessJur, sIdPessoa, sIdPlanoPrev,sIdSeqProposta,sIdNomePart: string;
  public
    { Public declarations }
  end;

var
  frmParamRelCert: TfrmParamRelCert;

implementation

uses UAdmPrev, UMensErro, DRelatAdmPREV2;

{$R *.DFM}

procedure TfrmParamRelCert.bbtnConfirmarClick(Sender: TObject);
var sEnd, sSQLFaixa : string;
begin
  { OBTER DADOS DA FUNDAÇÃO }
  with dtmRelatAdmPrev2 do
  begin   
    qryFundacao.Close;
    qryFundacao.ParamByName('pFundacao').asinteger;
    qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
    qryFundacao.Prepare;
    qryFundacao.Open;

    // Montar Endereço  e  Bairro/Cidade/Estado
    sEnd := trim(qryFundacao.FieldByName('LOGRADOURO').asstring) + ', ' +
            trim(qryFundacao.FieldByName('NUMERO').asstring);
    if trim(qryFundacao.FieldByName('COMPLEMENTO').asstring) <> '' then
       sEnd := sEnd + trim(qryFundacao.FieldByName('COMPLEMENTO').asstring);

  end;

  { ESCOLHER QUERY PARA ALIMENTAR RELATÓRIO }
  if pgcQuantPart.ActivePage = tbsUmPart then
 //  Por Participante
   begin
     if (trim(edNomePart.Text) = '') then
       begin
         MsgDlg('Escolha um participante!','Informação',mtInformation,[mbOk,mbHelp],0);
         mebMesIni.SetFocus;
         exit;
       end;

      with dtmRelatAdmPrev2 do
      begin
       qryCertificado.Close;
       sSQLFaixa := ' SELECT P.NOME AS PARTICIPANTE,PAT.NOME AS PATROCINADORA, PF.DATANASC,  PF.SEXO, PP.IDPESSOA AS IDTITULAR, PP.IDPESSJUR, PP.IDPLANOPREV,' +
                    '        P.NUMDOCUMENTO AS CPF,EL.DATAADMISSAO, EL.MATRICULA as MATRICULA,  EL.TEMPOSERVANTERIOR,           ' +
                    '        PLP.NOME AS NOMEPLAN, PP.INSCRICAODATA, PP.REQUERIMENTODATA AS DATA_REQUERIMENTO, PP.SALPARTICIPACAO,    ' +
                    '        PP.INSCRICAONUMERO,PF.CODESTADO AS NATURALIDADE,ES.CODESTADO AS ESTADO_PARTICIPANTE, EP.LOGRADOURO,  EP.NUMERO,  EP.COMPLEMENTO,' +
                    '        EP.BAIRRO, CD.NOME AS CIDADE , ES.CODESTADO, EP.CEP,  C.NOME AS NOMECONTRIB, ' +
                    '        CPP.VALORBASE1,  CPP.VALORBASE2,  CPP.VALORBASE3, PF.ESTCIVIL AS ESTADO_CIVIL, ' +
                    '        CP.NOMEVALORBASE1,CP.NOMEVALORBASE2,  CP.NOMEVALORBASE3,            ' +
                    '        PP.SALINSCRICAO AS VALORPROVENTO, CPP.DATAINICIO, CPP.DATAFINAL,    ' +
                    '        HST.VALORESPERADO , PAIS.NOMENACIONALIDADE AS NACIONALIDADE , ' +
                    '        PF.NOMEPAI, PF.NOMEMAE, P.EMAIL,   '+
                    '        DP.NUMDOCUMENTO NUMIDENT, DP.ORGAO, DP.DATAEMISSAO DATAEMISSAOIDENT,  DP.UF UFIDENT,  '+
                    '        FILIAL.NOME AS FILIAL , TELRES.NUMERO NUMTELRES, TELCOM.NUMERO NUMTELCOM '+
                    'FROM    PESSOA P, PESSOA PAT, PESSOAFISICA PF, ENDPESS EP, PESSOA FILIAL,  ' +
                    '        CIDADES CD,ESTADO ES, PATRO, ELEGPATRO EL, PARTPREVPLAN PP,         ' +
                    '        PLANPREV PLP, CONTRIBPREVPARTP CPP, CONTRIBUICAO C,          ' +
                    '        CONTPREV CP  ,  SITPART SP, CONTPREVEVENTO CPE,              ' +
                    '        EVENTOGERADOR EG,   HSTCONTRIBPREV HST, PAIS ,                ' +
                    '        (SELECT   NUMDOCUMENTO, ORGAO, DATAEMISSAO, UF '+
                    '        FROM( '+
                    '        SELECT   TO_CHAR(NUMDOCUMENTO) NUMDOCUMENTO, ORGAO, '+
                    '        TO_CHAR(DATAEMISSAO,''DD/MM/YYYY'') DATAEMISSAO , UF '+
                    '        FROM DOCPESSOA, TIPODOCPESSOA '+
                    '        WHERE  DOCPESSOA.IDPESSOA = '+sIdPessoa+' AND '+
                    '        DOCPESSOA.IDDOCUMENTO = TIPODOCPESSOA.IDDOCUMENTO AND '+
                    '        TIPODOCPESSOA.FISICAJURIDICA = ''F'' AND '+
                    '        TIPODOCPESSOA.NOMEDOCUMENTO LIKE ''%IDENT%'' '+
                    '        UNION ALL  '+
                    '        SELECT  '' '' NUMDOCUMENTO, '' '' ORGAO, '' '' DATAEMISSAO, '' '' UF '+
                    '        FROM DUAL) '+
                    '        WHERE ROWNUM <=1 ) DP , '+
                    '        ( SELECT NUMERO '+
                    '        FROM ( '+
                    '        SELECT TEL.NUMERO '+
                    '        FROM TELENDPESS TEL, PESSOA P '+
                    '        WHERE         P.IDPESSOA = '+sIdPessoa+' '+
                    '        AND TEL.IDENDERECO = P.IDENDRESIDENCIAL '+
                    '        UNION ALL '+
                    '        SELECT '' '' NUMERO FROM DUAL) '+
                    '        WHERE  ROWNUM <=1) TELRES , '+
                    '        ( SELECT NUMERO '+
                    '        FROM ( '+
                    '        SELECT TEL.NUMERO '+
                    '        FROM TELENDPESS TEL, PESSOA P '+
                    '        WHERE         P.IDPESSOA = '+sIdPessoa+' '+
                    '        AND TEL.IDENDERECO = P.IDENDCOMERCIAL '+
                    '        UNION ALL '+
                    '        SELECT '' '' NUMERO FROM DUAL) '+
                    '        WHERE  ROWNUM <=1) TELCOM    '+
                    'WHERE          PP.IDPESSOA         =:piIdPessoa                         ' +
                    '        AND    PP.IDPLANOPREV      =:piIdPlanoPrev                      ' +
                    '        AND    PP.IDPESSJUR        =:piIdPessJur                        ' +
                    '        AND    PP.SEQPROPOSTA      =:piSeqProposta                      ' +
                    '        AND    PP.FLGDESATIVADO    = 0                                  ' +
                    '        AND    EL.IDPESSJUR        = PP.IDPESSJUR                       ' +
                    '        AND    PATRO.IDPESSOA      = EL.IDPESSJUR                       ' + 
                    '        AND    PATRO.IDFUNDACAO    = '+IntToStr(iIdFundacao)              +                                     
                    '        AND    PF.IDPAIS           = PAIS.IDPAIS                        ' +
                    '        AND    EL.IDPESSOA         = PP.IDPESSOA                        ' +
                    '        AND    P.IDPESSOA          = EL.IDPESSOA                        ' +
                    '        AND    PAT.IDPESSOA        = EL.IDPESSJUR                       ' +
                    '        AND    PLP.IDPLANOPREV     = PP.IDPLANOPREV                     ' +
                    '        AND    PF.IDPESSOA         = P.IDPESSOA                         ' +
                    '        AND    SP.IDSITPART        = PP.IDSITPART                       ' +
                    '        AND    EP.IDENDERECO(+)    = P.IDENDRESIDENCIAL                 ' +
                    '        AND    EP.IDPESSOA(+)      = P.IDPESSOA                         ' +
                    '        AND    CD.IDCIDADES(+)     = EP.IDCIDADES                       ' +
                    '        AND    ES.IDESTADO(+)      = CD.IDESTADO                        ' +
                    '        AND    CPP.IDPESSJUR       = PP.IDPESSJUR                       ' +
                    '        AND    CPP.IDPLANOPREV     = PP.IDPLANOPREV                     ' +
                    '        AND    CPP.IDPESSOA        = PP.IDPESSOA                        ' +
                    '        AND    CPP.SEQPROPOSTA     = PP.SEQPROPOSTA                     ' +
                    '        AND    CPP.IDPLANOPREV     = CPE.IDPLANOPREV                    ' +
                    '        AND    CPP.IDCONTRIBUICAO  = CPE.IDCONTRIBUICAO                 ' +
                    '        AND    CPE.IDEVENTOGERADOR = EG.IDEVENTOGERADOR                 ' +
                    '        AND    EG.FLGINTERNO       = ''IP''                             ' +
                    '        AND    CP.IDPLANOPREV      = CPP.IDPLANOPREV                    ' +
                    '        AND    CP.IDCONTRIBUICAO   = CPP.IDCONTRIBUICAO                 ' +
                    '        AND    C.IDCONTRIBUICAO    = CP.IDCONTRIBUICAO                  ' +
                    '        AND    HST.IDPESSJUR(+)     = CPP.IDPESSJUR                     ' +
                    '        AND    HST.IDPLANOPREV(+)   = CPP.IDPLANOPREV                   ' +
                    '        AND    HST.IDPESSOA(+)      = CPP.IDPESSOA                      ' +
                    '        AND    HST.SEQPROPOSTA(+)   = CPP.SEQPROPOSTA                   ' +
                    '        AND    HST.IDCONTRIBUICAO(+) = CPP.IDCONTRIBUICAO               ' +
                    '        AND    HST.MESREFERENCIA(+) = TO_CHAR(CPP.DATAINICIO,''YYYY/MM'') '+
                    '        AND    FILIAL.IDPESSOA(+) = EL.IDESTAB ' ;

       qryCertificado.SQL.Clear;
       qryCertificado.SQL.Add(sSQLFaixa);
       qryCertificado.ParamByName('piIdPessoa').AsInteger;
       qryCertificado.ParamByName('piIdPlanoPrev').AsInteger;
       qryCertificado.ParamByName('piIdPessJur').AsInteger;
       qryCertificado.ParamByName('piSeqProposta').AsInteger;

       qryCertificado.ParamByName('piIdPessoa').AsInteger := strtoint(sIdPessoa);
       qryCertificado.ParamByName('piIdPessJur').AsInteger := strtoint(sIdPessJur);
       qryCertificado.ParamByName('piIdPlanoPrev').AsInteger := strtoint(sIdPlanoPrev);
       qryCertificado.ParamByName('piSeqProposta').AsInteger := strtoint(sIdSeqProposta); 
       qryCertificado.Prepare;
       qryCertificado.Open;

      end;

   end  // participante
  else
  // Por Faixa de Datas de Inscrição
   begin
     if (trim(mebMesIni.Text) = '') or (strtoint(copy(trim(mebMesIni.Text),4,2)) > 12)
                                    or (strtoint(copy(trim(mebMesIni.Text),4,2)) < 1 )then
       begin
         MsgDlg('Data inicial inválida!','Informação',mtInformation,[mbOk,mbHelp],0);
         mebMesIni.SetFocus;
         exit;
       end;
     if (trim(mebMesFim.Text) = '') or (strtoint(copy(trim(mebMesFim.Text),4,2)) > 12)
                                    or (strtoint(copy(trim(mebMesFim.Text),4,2)) < 1 )then
       begin
         MsgDlg('Data final inválida!','Informação',mtInformation,[mbOk,mbHelp],0);
         mebMesFim.SetFocus;
         exit;
       end;
     if (strtodate(mebMesFim.Text) < strtodate(mebMesIni.Text) )then
       begin
         MsgDlg('Data final menor que inicial!','Informação',mtInformation,[mbOk,mbHelp],0);
         mebMesIni.SetFocus;
         exit;
       end;
      with dtmRelatAdmPrev2 do
      begin
       qryCertifDep.Close;

       sSQLFaixa := 'SELECT P.NOME AS NOMEDEP,         ' +
                    'P.NOME AS PARTICIPANTE,PAT.NOME AS NOME_PATROCINADORA, PF.SEXO, PF.DATANASC AS DATA_DE_NASCIMENTO, DEPEN.DESCRICAO AS TIPODEPEN, ' +
                    'CD.NOME AS CIDADE,P.NUMDOCUMENTO AS CPF,ES.CODESTADO AS ESTADO_PARTICIPANTE, EL.MATRICULA AS MATRICULA, PP.REQUERIMENTODATA, PF.CODESTADO AS NATURALIDADE, PAIS.NOMENACIONALIDADE AS NACIONALIDADE, PF.ESTCIVIL AS ESTADO_CIVIL    ' +
                    'FROM   PESSOA PAT, DEPENTIT DP, CIDADES CD, PESSOAFISICA PF, ENDPESS EP, ESTADO ES,PESSOA P, DEPEN , PATRO, PARTPREVPLAN PP, ELEGPATRO EL, PAIS     ' +
                    'WHERE  DP.IDTITULAR = PP.IDPESSOA                    ' +
                    'AND    P.IDPESSOA   = DP.IDPESSOA                   ' +
                    'AND    PF.IDPAIS    = PAIS.IDPAIS                   ' +
                    'AND    CD.IDCIDADES = EP.IDCIDADES                  '+
                    'AND    CD.IDESTADO = ES.IDESTADO                    '+
                    'AND    PF.IDPESSOA  = P.IDPESSOA                    ' +
                    'AND    DP.IDDEPENDENCIA <> ''PRP''                    ' +
                    'AND    DP.IDDEPENDENCIA = DEPEN.IDDEPENDENCIA       ' +
                    'AND    PATRO.IDPESSOA = PP.IDPESSJUR                '+ 
                    'AND    PATRO.IDFUNDACAO = '+IntToStr(iIdFundacao)+     
                    'AND    PP.INSCRICAODATA >= TO_DATE('''+ mebMesIni.text +''',''DD/MM/YYYY'')  '+
                    'AND    PP.INSCRICAODATA <= TO_DATE('''+ mebMesFIM.text +''',''DD/MM/YYYY'')  ' ;


       qryCertifDep.SQL.Clear;
       qryCertifDep.SQL.Add(sSQLFaixa);
       qryCertifDep.Prepare;
       qryCertifDep.Open;

      end;   
    end;  // Por faixa

   inherited;
end;

procedure TfrmParamRelCert.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect1.Executar;
  if (MontaSelect1.ValoresChave.Count > 0) and (MontaSelect1.ValoresChave[0] <> '')
  then begin
     edNomePart.Text      := MontaSelect1.ValoresChave[0];
     sIdNomePart          := MontaSelect1.ValoresChave[0];
     edMatricula.Text     := MontaSelect1.ValoresChave[1];
     edInscricao.Text     := MontaSelect1.ValoresChave[2];
     edPlano.Text         := MontaSelect1.ValoresChave[3];
     sIdPessoa            := MontaSelect1.ValoresChave[4];
     sIdPlanoPrev         := MontaSelect1.ValoresChave[5];
     sIdPessJur           := MontaSelect1.ValoresChave[6];
     sIdSeqProposta       := MontaSelect1.ValoresChave[7];
  end
  else begin
     edNomePart.Text      := '';
     edMatricula.Text     := '';
     edInscricao.Text     := '';
     edPlano.Text         := '';
     sIdPessJur           := '-1';
     sIdPessoa            := '-1';
     sIdPlanoPrev         := '-1';
  end;
end;

procedure TfrmParamRelCert.FormShow(Sender: TObject);
begin
  inherited;
  pgcQuantPart.ActivePage := tbsUmPart;
  MontaSelect1.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
end;

end.
