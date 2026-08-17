{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit fcontrachequetrimestral;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Spin, Db,
     DBTables, Wwquery, ComCtrls, checklst, Gauges, TB97Tlbr, Grids, Wwdbigrd,
     Wwdbgrid, Wwdatsrc, IvDictio, IvMulti, IvEMulti, UFuncoesUteis, MontaSelect,
     DBGrids, Mask, wwdblook, TREdit, UMensErro, dbaseDados, fcButton, fcImgBtn,
     fcShapeBtn, UObjFolha, JclStrings, ShellAPI, uString;

type
  Tfrmcontrachequetrimestral = class(TfrmOkCancelar)
    qryHist: TwwQuery;
    qryHistHISTORICO: TStringField;
    qryHistIDHSTFOLHABENEF: TFloatField;
    qryHist1: TwwQuery;
    qryHist2: TwwQuery;
    qryHist2IDHSTFOLHABENEF: TFloatField;
    qryHist2HISTORICO: TStringField;
    qryHist1IDHSTFOLHABENEF: TFloatField;
    qryHist1HISTORICO: TStringField;
    qrycontracheque: TwwQuery;
    qrycontrachequeBENEFICIARIO: TStringField;
    qrycontrachequeMATRICULA: TStringField;
    qrycontrachequeNUMDOCUMENTO: TStringField;
    qrycontrachequeBANCO: TStringField;
    qrycontrachequeAGENCIA: TStringField;
    qrycontrachequeCONTACORRENTE: TStringField;
    qrycontrachequeDESCRPROVDESC: TStringField;
    qrycontrachequeMESREFERENCIA: TStringField;
    qrycontrachequeVALOR: TFloatField;
    qrycontrachequeFLGDESCONTO: TFloatField;
    qrycontrachequeLOGRADOURO: TStringField;
    qrycontrachequeNUMERO: TStringField;
    qrycontrachequeCOMPLEMENTO: TStringField;
    qrycontrachequeBAIRRO: TStringField;
    qrycontrachequeCIDADE: TStringField;
    qrycontrachequeCODESTADO: TStringField;
    qrycontrachequeCEP: TStringField;
    qrycontrachequeIDRESPONSAVEL: TFloatField;
    qrycontrachequeIDHSTFOLHABENEF: TFloatField;
    qrycontrachequeNUMDEPIRRF: TFloatField;
    qrycontrachequeNUMSEQUENCIA: TFloatField;
    qrycontrachequeSEQRUBRICA: TFloatField;
    gbMensagem: TGroupBox;
    gbVersao: TGroupBox;
    Label1: TLabel;
    dblkprimeiromes: TwwDBLookupCombo;
    Label2: TLabel;
    dblksegundomes: TwwDBLookupCombo;
    Label3: TLabel;
    dblkterceiromes: TwwDBLookupCombo;
    MaskMENSAGEM4: TMaskEdit;
    MaskMENSAGEM3: TMaskEdit;
    MaskMENSAGEM2: TMaskEdit;
    MaskMENSAGEM1: TMaskEdit;
    gbRecebedor: TGroupBox;
    edNome: TEdit;
    edTipoPessoa: TEdit;
    fcsbtnProcurar: TfcShapeBtn;
    fcsbtnLimpa: TfcShapeBtn;
    msRecebedor: TMontaSelect;
    qryAux: TwwQuery;
    dlgArquivo: TSaveDialog;
    gbSalva: TGroupBox;
    lblSalvar: TLabel;
    Bevel1: TBevel;
    SpeedButton4: TSpeedButton;
    RdoTipoContraCheque: TRadioGroup;
    dblkquartomes: TwwDBLookupCombo;
    Label4: TLabel;
    qryHist3: TwwQuery;
    qryHist3IDHSTFOLHABENEF: TFloatField;
    qryHist3HISTORICO: TStringField;
    qrycontrachequeFLGESPECIAL: TFloatField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fcsbtnProcurarClick(Sender: TObject);
    procedure fcsbtnLimpaClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure RdoTipoContraChequeClick(Sender: TObject);
  private
     // Carlos 17/07/2001: Sequencial.
     iSeq: Integer;
    { Private declarations }
     function  Completa82 (Texto : String) : String;
     function  gravapart(contprovdesc:integer;contpart:integer;contcontracheque:integer;idresponsavelant:integer;
       totdesconto:double; totprovento:double; liquido:double;flgprimeiro:integer ):boolean;
     function  gravadetalhecheio(contprovdesc:integer;contpart:integer;contcontracheque:integer;idresponsavelant:integer;
       totdesconto:double; totprovento:double; liquido:double;flgprimeiro:integer ):boolean;
     function  gravadetalhevazio(contprovdesc:integer;contpart:integer;contcontracheque:integer;idresponsavelant:integer;
       totdesconto:double; totprovento:double; liquido:double;flgprimeiro:integer ):boolean;
     function  totalcontracheque(contprovdesc:integer;contpart:integer;contcontracheque:integer;idresponsavelant:integer;
       totdesconto:double; totprovento:double; liquido:double;flgprimeiro:integer ):boolean;
     function  gravaendereco(nome,logradouro,numero,complemento,bairro,codestado,
       cidade,cep,nome1,logradouro1,numero1,complemento1,bairro1,codestado1,
       cidade1,cep1: string):boolean;
     procedure gravamensagem;
     procedure gravapartvazio;
     function AbreMontaQueryContraCheque: boolean;
  public
    { Public declarations }
    {contracheque : reg_contracheque;}
    arqcontracheque: textfile;
    arqexcecao: textfile; //P.RAMOS-22.04.2004-PEND 16651
    smatricula: string;
    sinscricao: string;
    snometitular: string;
    snomerecebedor: string;
    snomeplano: string;
    ctipopessoa: char;
    lidTitular: longint;
    lidRecebedor: longint;
    lidPatro: longint;
    lidPlanoPrev: longint;

    //Bruno  Bastos 16/04/02
    flgquartomes : integer; { 0 - Trimestral // 1 - Quadrimestral }
  end;

var
  FrmContraChequeTrimestral: TFrmContraChequeTrimestral;

implementation

{$R *.DFM}

Function Tfrmcontrachequetrimestral.Completa82 (Texto : String) : String;
Begin
  Result:=copy(texto
  +'                                                                                      ',1,82);
end;

function Tfrmcontrachequetrimestral.AbreMontaQueryContraCheque: boolean;
 var ssql : Widestring;

 function RetornaSubQuery(sHist : string) : string;
  Var
    GuardaSQL : String;

  begin
   GuardaSQL:= '';
   GuardaSQL:=' SELECT PES.NOME AS BENEFICIARIO, ELEG.MATRICULA, PES.NUMDOCUMENTO, '+
           ' PESB.NOME AS BANCO, PESA.NOME AS AGENCIA, HIST.CONTACORRENTE, ';
   // FERNANDO - 11/09/2002
{
   If SistemaFolha.FlgUsaCodRubExt = 0 then
     GuardaSql:=GuardaSql+' PROV.DESCRICAO AS DESCRPROVDESC, '
   else GuardaSql:=GuardaSql+' PROV.DESCRPROVDESC, ';
}

   If SistemaFolha.RUBRICACONTRACHEQUE = 0 then
     GuardaSql:=GuardaSql+' PROV.DESCRICAO AS DESCRPROVDESC, '
   else GuardaSql:=GuardaSql+' PROV.DESCRPROVDESC, ';

   // FIM - FERNANDO - 11/09/2002

  GuardaSql:=GuardaSql+
           ' HIST.MES AS MESREFERENCIA, HIST.VALORPROVENTO AS VALOR, '+
           ' HIST.FLGDESCONTO, HIST.FLGESPECIAL, ENDP.LOGRADOURO, ENDP.NUMERO, ENDP.COMPLEMENTO, '+
           ' ENDP.BAIRRO, CID.NOME AS CIDADE, EST.CODESTADO, ENDP.CEP, HIST.IDRESPONSAVEL, '+
           ' HIST.IDHSTFOLHABENEF, PF.NUMDEPIRRF, '+
           ' NVL(DT.NUMSEQUENCIA-1,0) AS NUMSEQUENCIA, HIST.SEQRUBRICA '+
    ' FROM HISTRUBSAL HIST, PESSOA PES, ELEGPATRO ELEG, CONTABANCARIA BAN, '+
         ' AGENCIABANCARIA AG, PESSOA PESB, PESSOA PESA, '+
         ' PROVDESC PROV, ENDPESS ENDP, PESSOAFISICA PF, CIDADES CID, '+
         ' ESTADO EST, DEPENTIT DT, BANCO B '+
    ' WHERE HIST.IDHSTFOLHABENEF = '+sHist;
    if (lidTitular>0) and (lidRecebedor>0) and (lidPatro>0) and (lidPlanoPrev>0) then
      GuardaSQL:=GuardaSQL+
        ' AND HIST.IDTITULAR = '+inttostr(lidTitular)+
        ' AND HIST.IDRESPONSAVEL = '+inttostr(lidRecebedor)+
        ' AND HIST.IDPATRO = '+inttostr(lidPatro)+
        ' AND HIST.IDPLANOPREV =  '+inttostr(lidPlanoPrev);
    GuardaSQL:=GuardaSQL+
    //Teste ' AND HIST.IDTITULAR IN (1251121, 1268959, 1215002, 1215006)'+
    ' AND PES.IDPESSOA = HIST.IDRESPONSAVEL '+
    ' AND ELEG.IDPESSOA = HIST.IDTITULAR '+
    ' AND ELEG.IDPESSJUR = HIST.IDPATRO '+
    ' AND BAN.IDPESSOA (+) = HIST.IDRESPONSAVEL '+
 //   ' AND BAN.FLGCONTAPREF(+) = ''1'' '+   //Ricardo Vigorito - 02/02/2004 Pendência 15135
   ' AND B.NUMBANCO   = HIST.NUMBANCO ' + // Ricardo Vigorito - 02/02/2004 Pendência 15135
    ' AND AG.NUMAGENCIA  = HIST.NUMAGENCIA '+ // Ricardo Vigorito = 02/02/2004 Pendência 15135
    ' AND AG.IDPESSOA(+) = BAN.IDAGENCIA '+
    ' AND B.IDPESSOA    = AG.IDBANCO  ' +  //Ricardo Vigorito - 02/02/2004 Pendencia 15135
    ' AND PESB.IDPESSOA(+) = AG.IDBANCO '+
    ' AND PESA.IDPESSOA(+) = AG.IDPESSOA '+
    ' AND PROV.IDPROVENTO = HIST.IDRUBRICA '+
    ' AND HIST.FLGESPECIAL IN (0,1) '+
    ' AND ENDP.IDENDERECO = PES.IDENDRESIDENCIAL '+
    ' AND PF.IDPESSOA = HIST.IDRESPONSAVEL '+
    ' AND CID.IDCIDADES(+) = ENDP.IDCIDADES '+
    ' AND EST.IDESTADO(+) = CID.IDESTADO '+
    //P.RAMOS-12.05.2004-PEND.16771
    //' AND DT.IDTITULAR = HIST.IDTITULAR '+
    ' AND DT.IDTITULAR(+) = HIST.IDTITULAR '+
    ' AND DT.IDPESSOA(+) = HIST.IDRESPONSAVEL ';
    RetornaSubQuery := GuardaSQL;
 end;

begin
  ssql   := '';
  result := false;
  if dblkprimeiromes.Text <> '' Then
  begin
    try
      ssql:=
        'SELECT /*+RULE */ G.BENEFICIARIO, G.MATRICULA, G.NUMDOCUMENTO, G.BANCO, G.AGENCIA, G.CONTACORRENTE, '+
          ' G.DESCRPROVDESC, G.MESREFERENCIA, G.VALOR, G.FLGDESCONTO, G.FLGESPECIAL, G.LOGRADOURO, G.NUMERO, '+
          ' G.COMPLEMENTO, G.BAIRRO, G.CIDADE, G.CODESTADO, G.CEP, G.IDRESPONSAVEL, '+
          ' G.IDHSTFOLHABENEF, G.NUMDEPIRRF, G.NUMSEQUENCIA, G.SEQRUBRICA '+
        'FROM ( ';
      ssql:=ssql+RetornaSubQuery(inttostr(qryhistidhstfolhabenef.asinteger));
      if dblksegundomes.Text <> '' Then
      begin
        ssql:=ssql+' UNION '+RetornaSubQuery(inttostr(qryhist1idhstfolhabenef.asinteger));
        if dblkterceiromes.Text <> '' Then
        begin
          ssql:=ssql+' UNION '+RetornaSubQuery(inttostr(qryhist2idhstfolhabenef.asinteger));

          //Bruno Bastos 16/04/2002 Início
          If Flgquartomes = 1 Then
          Begin
            if dblkquartomes.Text <> '' Then
            begin
              ssql:=ssql+' UNION '+RetornaSubQuery(inttostr(qryhist3idhstfolhabenef.asinteger));
            End;
          End;
          //Bruno Bastos 16/04/2002 Fim

        end;
      end;

      ssql:=ssql+' ) G ORDER BY G.CEP, G.IDRESPONSAVEL, G.IDHSTFOLHABENEF, '+
                    'G.FLGDESCONTO, G.SEQRUBRICA';

      qrycontracheque.close;
      qrycontracheque.sql.clear;
      qrycontracheque.sql.add(ssql);
      qrycontracheque.open;
      result:=true;
    except
      raise;
    end;
  end;
end;

procedure Tfrmcontrachequetrimestral.bbtnConfirmarClick(Sender: TObject);
 var logradouro, numero, complemento, nome, bairro, codestado, cidade,
     cep, logradouro1, numero1, complemento1, nome1, bairro1, codestado1,
     cidade1, cep1, DETALHE1, sinal: string;
     contprovdesc, contpart, contcontracheque, idresponsavelant,
     flgprimeiro: integer;
     totdesconto, totprovento, liquido: Double;
     snomeexcecao: string; //P.RAMOS-22.04.2004-PEND 16651
     smatriculaant: string; //P.RAMOS-22.04.2004-PEND 16651
     btemh1, btemh2, btemh3, btemh4: boolean; //P.RAMOS-22.04.2004-PEND 16651
     ss: string; //P.RAMOS-22.04.2004-PEND 16651
     ret: integer; //P.RAMOS-22.04.2004-PEND 16651
     btemexcecao: boolean; //P.RAMOS-22.04.2004
begin
  inherited;
  iSeq:=0;

  If RdoTipoContraCheque.ItemIndex = -1 Then
  Begin
    MsgDlg('Escolha o tipo de Contracheque! ','Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  End
  Else
  Begin
    if dblkprimeiromes.Text = '' Then
    begin
      MsgDlg('Escolha o primeiro mês! ','Erro',mtError,[mbOk,mbHelp],0);
      dblkprimeiromes.SetFocus;
      Exit;
    end;
  End;
  if dblksegundomes.Text <> '' Then
  begin
    if (qryhistidhstfolhabenef.Asinteger >= qryhist1idhstfolhabenef.Asinteger  ) Then
    begin
      MsgDlg('O primeiro mês não pode ser maior ou igual ao segundo! ','Erro',mtError,[mbOk,mbHelp],0);
      dblkprimeiromes.SetFocus;
      Exit;
    end;
  end;
  //P.RAMOS-22.04.2004-PEND 16651
  //if (dblksegundomes.Text <> '') and (dblkterceiromes.Text = '') Then
  if (dblksegundomes.Text <> '') and (dblkterceiromes.Text <> '') Then
  //P.RAMOS-22.04.2004-PEND 16651 - ATÉ AQUI
  begin
    if (qryhist1idhstfolhabenef.Asinteger >= qryhist2idhstfolhabenef.Asinteger ) Then
    begin
      MsgDlg('O segundo mês não pode ser maior ou igual ao terceiro! ','Erro',mtError,[mbOk,mbHelp],0);
      dblkprimeiromes.SetFocus;
      Exit;
    end;
  end;

  //Bruno Bastos 16/04/2002 Início
  If flgquartomes = 1 Then
  Begin
    //P.RAMOS-22.04.2004-PEND 16651
    //If (dblkterceiromes.Text <> '') And (dblkquartomes.Text = '') Then
    If (dblkterceiromes.Text <> '') And (dblkquartomes.Text <> '') Then
    //P.RAMOS-22.04.2004-PEND 16651 - ATÉ AQUI
    Begin
      if (qryhist2idhstfolhabenef.Asinteger  >= qryhist3idhstfolhabenef.Asinteger ) Then
      begin
        MsgDlg('O Terceiro mês não pode ser maior ou igual ao quarto! ','Erro',mtError,[mbOk,mbHelp],0);
        dblkprimeiromes.SetFocus;
        Exit;
      end;
    End;
  End;
  //Bruno Bastos 16/04/2002 Fim

  AssignFile(arqcontracheque,lblSalvar.caption);
  rewrite(arqcontracheque);
  //bbtnConfirmar.Enabled:=false;
  sinal:='+';

  //P.RAMOS-22.04.2004-PEND 16651
  snomeexcecao:=IncludeTrailingBackslash(ExtractFilePath(lblSalvar.caption))+
    'EXCECAO_'+ExtractFileName(lblSalvar.caption);
  AssignFile(arqexcecao, snomeexcecao);
  rewrite(arqexcecao);
  //P.RAMOS-22.04.2004-PEND 16651-até aqui

  //Bruno Bastos 18/04/2002 Início
  If flgquartomes = 1 Then
  Begin
    detalhe1:=Completa82('+ DJDE JDE=JOB29A,JDL=REFPDL,END;');
    writeln(arqcontracheque,detalhe1);
  End
  Else
  Begin
    detalhe1:=Completa82('+ DJDE JDE=JOB029,JDL=REFPDL,END;');
    writeln(arqcontracheque,detalhe1);
  End;
  //Bruno Bastos 18/04/2002 Fim

  btemexcecao:=false; //P.RAMOS-22.04.2004

  if AbreMontaQueryContraCheque then
  begin
    contprovdesc    :=0;
    contpart        :=0;
    contcontracheque:=0;
    idresponsavelant:=0;
    smatriculaant   :=''; //P.RAMOS-22.04.2004-PEND 16651
    btemh1:=false; btemh2:=false; btemh3:=false; btemh4:=false; //P.RAMOS-22.04.2004-PEND 16651
    flgprimeiro     :=0;
    While Not qrycontracheque.Eof Do
    begin
      if (idresponsavelant <> qrycontrachequeidresponsavel.Asinteger) and
        (flgprimeiro = 0)   then
      begin
        gravapart(contprovdesc,contpart,contcontracheque,idresponsavelant,
            totdesconto, totprovento, liquido,flgprimeiro );
        idresponsavelant:=qrycontrachequeidresponsavel.Asinteger;
        smatriculaant   :=qrycontrachequeMATRICULA.asstring; //P.RAMOS-22.04.2004-PEND 16651
        flgprimeiro:=1;
      end;

      if (idresponsavelant <> qrycontrachequeidresponsavel.Asinteger)  then
      begin
        //P.RAMOS-22.04.2004-PEND 16651
        if not btemh1 and (trim(dblkprimeiromes.text) <> '') then
        begin
          if not btemexcecao then
            writeln(arqexcecao,'=== Matrículas com pagamento zerado ===');
          btemexcecao:=true;
          writeln(arqexcecao,'Matrícula:'+smatriculaant+
                  '  Versão:'+inttostr(qryhistidhstfolhabenef.Asinteger));
        end;
        if not btemh2 and (trim(dblksegundomes.text) <> '') then
        begin
          if not btemexcecao then
            writeln(arqexcecao,'=== Matrículas com pagamento zerado ===');
          btemexcecao:=true;
          writeln(arqexcecao,'Matrícula:'+smatriculaant+
                  '  Versão:'+inttostr(qryhist1idhstfolhabenef.Asinteger));
        end;
        if not btemh3 and (trim(dblkterceiromes.text) <> '') then
        begin
          if not btemexcecao then
            writeln(arqexcecao,'=== Matrículas com pagamento zerado ===');
          btemexcecao:=true;
          writeln(arqexcecao,'Matrícula:'+smatriculaant+
                  '  Versão:'+inttostr(qryhist2idhstfolhabenef.Asinteger));
        end;
        if not btemh4 and (trim(dblkquartomes.text) <> '') then
        begin
          if not btemexcecao then
            writeln(arqexcecao,'=== Matrículas com pagamento zerado ===');
          btemexcecao:=true;
          writeln(arqexcecao,'Matrícula:'+smatriculaant+
                  '  Versão:'+inttostr(qryhist3idhstfolhabenef.Asinteger));
        end;
        btemh1:=false; btemh2:=false; btemh3:=false; btemh4:=false;
        //P.RAMOS-22.04.2004-PEND 16651-até aqui

        idresponsavelant:=qrycontrachequeidresponsavel.Asinteger;
        smatriculaant   :=qrycontrachequeMATRICULA.asstring; //P.RAMOS-22.04.2004-PEND 16651
        if contcontracheque = 0 then
        begin
          gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
          totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
          totdesconto:=0;
          totprovento:=0;
          liquido:=0;
          contprovdesc:=0;
          contcontracheque:=1;
          gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
          totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
          totdesconto:=0;
          totprovento:=0;
          liquido:=0;
          contprovdesc:=0;
          contcontracheque:=2;
          gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
          totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
          totdesconto:=0;
          totprovento:=0;
          liquido:=0;
          contprovdesc:=0;
          //P.RAMOS-22.04.2004-NO QUADRIMESTRAL NÃO SAÍA 4 MESES SE SELECIONASSE APENAS UMA VERSÃO
          If flgquartomes = 1 Then
          begin
            contcontracheque:=3;
            gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
               totdesconto, totprovento, liquido,flgprimeiro );
            totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
               totdesconto, totprovento, liquido,flgprimeiro );
            totdesconto:=0;
            totprovento:=0;
            liquido:=0;
            contprovdesc:=0;
          end;
          //P.RAMOS-22.04.2004-ATÉ AQUI
          contcontracheque:=0;
        end;
        if contcontracheque = 1 then
        begin
          gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
          totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
          totdesconto:=0;
          totprovento:=0;
          liquido:=0;
          contprovdesc:=0;
          contcontracheque:=2;
          gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
          totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
          totdesconto:=0;
          totprovento:=0;
          liquido:=0;
          contprovdesc:=0;
          //P.RAMOS-22.04.2004-NO QUADRIMESTRAL NÃO SAÍA 4 MESES SE SELECIONASSE APENAS UMA VERSÃO
          If flgquartomes = 1 Then
          begin
            contcontracheque:=3;
            gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
               totdesconto, totprovento, liquido,flgprimeiro );
            totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
               totdesconto, totprovento, liquido,flgprimeiro );
            totdesconto:=0;
            totprovento:=0;
            liquido:=0;
            contprovdesc:=0;
          end;
          //P.RAMOS-22.04.2004-ATÉ AQUI
          contcontracheque:=0;
        end;

        //Bruno Bastos 18/04/2002 Início
        If flgquartomes = 1 Then
        Begin
          if contcontracheque = 2 then
          begin
            gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
               totdesconto, totprovento, liquido,flgprimeiro );
            totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
               totdesconto, totprovento, liquido,flgprimeiro );
            totdesconto:=0;
            totprovento:=0;
            liquido:=0;
            contprovdesc:=0;
            contcontracheque:=3;
            gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
               totdesconto, totprovento, liquido,flgprimeiro );
            totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
               totdesconto, totprovento, liquido,flgprimeiro );
            totdesconto:=0;
            totprovento:=0;
            liquido:=0;
            contprovdesc:=0;
            contcontracheque:=0;
          end;
          if contcontracheque = 3 then
          begin
            gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
               totdesconto, totprovento, liquido,flgprimeiro );
            liquido:=totprovento - totdesconto;
            totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
               totdesconto, totprovento, liquido,flgprimeiro );
            totdesconto:=0;
            totprovento:=0;
            liquido:=0;
            contprovdesc:=0;
            contcontracheque:=0;
          end;
        End
        Else
        Begin
          if contcontracheque = 2 then
          begin
            gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
               totdesconto, totprovento, liquido,flgprimeiro );
            liquido:=totprovento - totdesconto;
            totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
               totdesconto, totprovento, liquido,flgprimeiro );
            totdesconto:=0;
            totprovento:=0;
            liquido:=0;
            contprovdesc:=0;
            contcontracheque:=0;
          end;
        End;
        //Bruno Bastos 18/04/2002 Fim

        gravamensagem;
        contpart:=contpart + 1;
        if contpart = 2  then
        begin
          gravaendereco(nome,logradouro,numero,complemento,bairro,codestado,cidade,
            cep,nome1,logradouro1,numero1,complemento1,bairro1,codestado1,cidade1,cep1);
          contpart:=0;
        end;
        gravapart(contprovdesc,contpart,contcontracheque,idresponsavelant,
            totdesconto, totprovento, liquido,flgprimeiro );
      end;

      if contpart = 0  then
      begin
        logradouro:=qrycontrachequelogradouro.Asstring;
        numero    :=qrycontrachequeNUMERO.Asstring;
        complemento:= qrycontrachequeCOMPLEMENTO.Asstring;
        nome      :=qrycontrachequebeneficiario.Asstring;
        bairro    :=qrycontrachequebairro.Asstring;
        codestado :=qrycontrachequecodestado.Asstring;
        cidade    :=qrycontrachequecidade.Asstring;
        cep       :=qrycontrachequecep.Asstring;
        logradouro1:='';
        numero1    :='';
        complemento1:='';
        nome1      :='';
        bairro1    :='';
        codestado1 :='';
        cidade1    :='';
        cep1       :='';
      end;
      if contpart = 1  then
      begin
        logradouro1:=qrycontrachequelogradouro.Asstring;
        numero1    :=qrycontrachequeNUMERO.Asstring;
        complemento1:= qrycontrachequeCOMPLEMENTO.Asstring;
        nome1      :=qrycontrachequebeneficiario.Asstring;
        bairro1    :=qrycontrachequebairro.Asstring;
        codestado1 :=qrycontrachequecodestado.Asstring;
        cidade1    :=qrycontrachequecidade.Asstring;
        cep1       :=qrycontrachequecep.Asstring;
      end;

      if (qryhistidhstfolhabenef.Asinteger = qrycontrachequeidhstfolhabenef.Asinteger) and
        (contcontracheque = 0)  then
      begin
        btemh1:=true;
        gravadetalhecheio(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
        contprovdesc:=contprovdesc + 1;
      end;

      if (qryhistidhstfolhabenef.Asinteger <> qrycontrachequeidhstfolhabenef.Asinteger) and
            (contcontracheque = 0)  then
      begin
        gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
        contprovdesc:=0;
        liquido:=totprovento - totdesconto;
        totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
        contcontracheque:=1;
        liquido:=0;
        totprovento:=0;
        totdesconto:=0;
      end;
      if (qryhist1idhstfolhabenef.Asinteger = qrycontrachequeidhstfolhabenef.Asinteger) and
            (contcontracheque = 1)  then
      begin
        btemh2:=true;
        gravadetalhecheio(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
        contprovdesc:=contprovdesc + 1;
      end;

      if (qryhist1idhstfolhabenef.Asinteger <> qrycontrachequeidhstfolhabenef.Asinteger) and
            (contcontracheque = 1)  then
      begin
        gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
        contprovdesc:=0;
        liquido:=totprovento - totdesconto;
        totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
          totdesconto, totprovento, liquido,flgprimeiro );
        contcontracheque:=2;
        liquido:=0;
        totprovento:=0;
        totdesconto:=0;
      end;

      if (qryhist2idhstfolhabenef.Asinteger = qrycontrachequeidhstfolhabenef.Asinteger) and
            (contcontracheque = 2)  then
      begin
        btemh3:=true;
        gravadetalhecheio(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
        contprovdesc:=contprovdesc + 1;
      end;

      //Bruno Bastos 16/04/2002 Início
      If Flgquartomes = 1 Then
      Begin
        if (qryhist2idhstfolhabenef.Asinteger <> qrycontrachequeidhstfolhabenef.Asinteger) and
              (contcontracheque = 2)  then
        begin
          gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
               totdesconto, totprovento, liquido,flgprimeiro );
          contprovdesc:=0;
          liquido:=totprovento - totdesconto;
          totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
            totdesconto, totprovento, liquido,flgprimeiro );
          contcontracheque:=3;
          liquido:=0;
          totprovento:=0;
          totdesconto:=0;
        end;

        if (qryhist3idhstfolhabenef.Asinteger = qrycontrachequeidhstfolhabenef.Asinteger) and
              (contcontracheque = 3)  then
        begin
          btemh4:=true;
          gravadetalhecheio(contprovdesc,contpart,contcontracheque,idresponsavelant,
               totdesconto, totprovento, liquido,flgprimeiro );
          contprovdesc:=contprovdesc + 1;
        end;
      End;
      //Bruno Bastos 16/04/2002 Fim


      If qrycontrachequeFLGESPECIAL.AsInteger = 0 Then //Bruno Bastos 14/05/2002
      Begin
        if qrycontrachequeflgdesconto.AsInteger = 0 then
          totprovento:=totprovento +  qrycontrachequevalor.Asfloat;
        if qrycontrachequeflgdesconto.AsInteger = 1 then
          totdesconto:=totdesconto +  qrycontrachequevalor.Asfloat;
      End;
      qrycontracheque.next;

    end; { While }
    {--------------------------------------------------------------------------}

    //P.RAMOS-22.04.2004-PEND 16651
    if not btemh1 and (trim(dblkprimeiromes.text) <> '') then
    begin
      if not btemexcecao then
        writeln(arqexcecao,'=== Matrículas com pagamento zerado ===');
      btemexcecao:=true;
      writeln(arqexcecao,'Matrícula:'+smatriculaant+
              '  Versão:'+inttostr(qryhistidhstfolhabenef.Asinteger));
    end;
    if not btemh2 and (trim(dblksegundomes.text) <> '') then
    begin
      if not btemexcecao then
        writeln(arqexcecao,'=== Matrículas com pagamento zerado ===');
      btemexcecao:=true;
      writeln(arqexcecao,'Matrícula:'+smatriculaant+
              '  Versão:'+inttostr(qryhist1idhstfolhabenef.Asinteger));
    end;
    if not btemh3 and (trim(dblkterceiromes.text) <> '') then
    begin
      if not btemexcecao then
        writeln(arqexcecao,'=== Matrículas com pagamento zerado ===');
      btemexcecao:=true;
      writeln(arqexcecao,'Matrícula:'+smatriculaant+
              '  Versão:'+inttostr(qryhist2idhstfolhabenef.Asinteger));
    end;
    if not btemh4 and (trim(dblkquartomes.text) <> '') then
    begin
      if not btemexcecao then
        writeln(arqexcecao,'=== Matrículas com pagamento zerado ===');
      btemexcecao:=true;
      writeln(arqexcecao,'Matrícula:'+smatriculaant+
              '  Versão:'+inttostr(qryhist3idhstfolhabenef.Asinteger));
    end;
    if not btemexcecao then
      writeln(arqexcecao,'=== Sem ocorrências de Matrículas com pagamento zerado ===');
    //P.RAMOS-22.04.2004-PEND 16651-até aqui

    if contcontracheque = 0 then
    begin
      gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
      totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
      totdesconto:=0;
      totprovento:=0;
      liquido:=0;
      contprovdesc:=0;
      contcontracheque:=1;
      gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
      totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
      totdesconto:=0;
      totprovento:=0;
      liquido:=0;
      contprovdesc:=0;
      contcontracheque:=2;
      gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
      totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
      //P.RAMOS-07.05.2004-PEND.16746-colocar este código apenas no quadrimestral
      if Flgquartomes = 1 then
      begin
        totdesconto:=0;
        totprovento:=0;
        liquido:=0;
        contprovdesc:=0;
        contcontracheque:=3;//Bruno Bastos - 05/04/2004
        //Bruno Bastos - 05/04/2004 - Início
        gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
               totdesconto, totprovento, liquido,flgprimeiro );
        totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
               totdesconto, totprovento, liquido,flgprimeiro );
      end;
      //P.RAMOS-07.05.2004-PEND.16746-colocar este código apenas no quadrimestral-até aqui
      totdesconto:=0;
      totprovento:=0;
      liquido:=0;
      contprovdesc:=0;
      contcontracheque:=0;
      //Bruno Bastos - 05/04/2004 - Fim
    end;

    if contcontracheque = 1 then
    begin
      gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
      totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
      totdesconto:=0;
      totprovento:=0;
      liquido:=0;
      contprovdesc:=0;
      contcontracheque:=2;
      //P.RAMOS-07.05.2004-PEND.16746-colocar este código apenas no quadrimestral
      if Flgquartomes = 1 then
        If logradouro1 <> '' Then
        Begin
          gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
                 totdesconto, totprovento, liquido,flgprimeiro );
          totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
                 totdesconto, totprovento, liquido,flgprimeiro );
          totdesconto:=0;
          totprovento:=0;
          liquido:=0;
          contprovdesc:=0;
          contcontracheque:=3;
        End;
    end;

    //Bruno Bastos 16/04/2002 Início
    If flgquartomes = 1 Then
    Begin
      if contcontracheque = 2 then
      begin
        gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
               totdesconto, totprovento, liquido,flgprimeiro );
        totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
               totdesconto, totprovento, liquido,flgprimeiro );
        totdesconto:=0;
        totprovento:=0;
        liquido:=0;
        contprovdesc:=0;
        contcontracheque:=3;
        gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
               totdesconto, totprovento, liquido,flgprimeiro );
        totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
               totdesconto, totprovento, liquido,flgprimeiro );
        totdesconto:=0;
        totprovento:=0;
        liquido:=0;
        contprovdesc:=0;
        contcontracheque:=0;
      end;

      if contcontracheque = 3 then
      begin
        gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
               totdesconto, totprovento, liquido,flgprimeiro );
        liquido:=totprovento - totdesconto;
        totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
               totdesconto, totprovento, liquido,flgprimeiro );
        totdesconto:=0;
        totprovento:=0;
        liquido:=0;
        contprovdesc:=0;
        contcontracheque:=0;
      end
    End
    Else
    Begin
      if contcontracheque = 2 then
      begin
        gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
               totdesconto, totprovento, liquido,flgprimeiro );
        totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
               totdesconto, totprovento, liquido,flgprimeiro );
        totdesconto:=0;
        totprovento:=0;
        liquido:=0;
        contprovdesc:=0;
        contcontracheque:=0;
      end;
    end;
    //Bruno Bastos 16/04/2002 Fim

    {if contcontracheque = 2 then
    begin
      gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
      liquido:=totprovento - totdesconto;
      totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
             totdesconto, totprovento, liquido,flgprimeiro );
      totdesconto:=0;
      totprovento:=0;
      liquido:=0;
      contprovdesc:=0;
      contcontracheque:=0;
    end;}

    gravamensagem;

    //P.RAMOS-22.04.2004-GRAVANDO INDEVIDAMENTE ESTAS INFORMAÇÃO
    //Bruno Bastos - 05/04/2004 - Início
//p.ramos-07.05.2004-pend.16746-tirei idtitular
    //If ((ContPart = 0) And (lidTitular <> 0) Or (qryContraCheque.Eof)) Then
    If (ContPart = 0) and (qryContraCheque.Eof) Then
      gravapartvazio;
    //Bruno Bastos - 05/04/2004 - Fim
    //P.RAMOS-22.04.2004- até aqui

    //P.RAMOS-22.04.2004-QUANDO É QUADRIMESTRAL ESTÁ COLOCANDO 3 DETALHES NA ULTIMA FOLHA
//    if ((logradouro1 = '')  And (contContraCheque = 0) And (FlgQuartoMes = 0)) Or //Bruno Bastos - 06/04/2004
//       ((logradouro1 = '')  And (contContraCheque = 0) And (FlgQuartoMes = 1)) Or //Bruno Bastos - 06/04/2004
//       ((logradouro1 <> '') And (contContraCheque = 0) And (FlgQuartoMes = 1)) then //Bruno Bastos - 06/04/2004
    if (logradouro1 = '')  And (contContraCheque = 0) THEN
    //P.RAMOS-22.04.2004-ATÉ AQUI
    begin
      gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
         totdesconto, totprovento, liquido,flgprimeiro );
      totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
         totdesconto, totprovento, liquido,flgprimeiro );
      totdesconto:=0;
      totprovento:=0;
      liquido:=0;
      contprovdesc:=0;
      contcontracheque:=1;
      gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
         totdesconto, totprovento, liquido,flgprimeiro );
      totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
         totdesconto, totprovento, liquido,flgprimeiro );
      totdesconto:=0;
      totprovento:=0;
      liquido:=0;
      contprovdesc:=0;
      contcontracheque:=2;

      //Bruno Bastos 16/04/2002 Início
      gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
         totdesconto, totprovento, liquido,flgprimeiro );
      totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
         totdesconto, totprovento, liquido,flgprimeiro );
      totdesconto:=0;
      totprovento:=0;
      liquido:=0;
      contprovdesc:=0;
      contcontracheque:=3;
      //Bruno Bastos 16/04/2002 Fim

      If ((flgquartomes = 0) And (lidTitular <> 0)) Or ((qryContraCheque.Eof) And (flgquartomes = 0)) Then //Bruno Bastos - 05/04/2004
        gravamensagem //Bruno Bastos - 05/04/2004
      Else
      Begin
        gravadetalhevazio(contprovdesc,contpart,contcontracheque,idresponsavelant,
           totdesconto, totprovento, liquido,flgprimeiro );
        totalcontracheque(contprovdesc,contpart,contcontracheque,idresponsavelant,
           totdesconto, totprovento, liquido,flgprimeiro );
        totdesconto:=0;
        totprovento:=0;
        liquido:=0;
        contprovdesc:=0;
        contcontracheque:=0;
        gravamensagem; //Bruno Bastos - 06/04/2004
      End;
    end;

    //P.RAMOS - 17.08.2001 - COLOQUEI A VARIAVEL CIDADE1 NO PARAMETRO 11. ESTAVA
    //  SENDO, USADA A VARIAVEL CIDADE O QUE ACARRETAVA ERRO NA GRAVAÇAO DO
    //  SEGUNDO ENDERECO NA FOLHA IMPRESSA
    gravaendereco(nome, logradouro, numero, complemento, bairro, codestado, cidade, cep,
                  nome1, logradouro1, numero1, complemento1, bairro1,codestado1,cidade1,cep1);

    //Bruno Bastos - 05/04/2004 - Início
//p.ramos-07.05.2004-pend.16746
//    If lIdTitular <> 0 Then
      writeln(arqcontracheque, '+1');
    //Bruno Bastos - 05/04/2004 - Fim

    closefile(arqcontracheque);
    closefile(arqexcecao); //P.RAMOS-22.04.2004

    //P.RAMOS-22.04.2004
    //ShowMessage('Contracheque gerado com sucesso.');
    ret:=MsgDlg('Contracheque gerado com sucesso. '+#13#10#13#10+
                'Favor verificar arquivo de exceções a ser exibido.'+#13#10#13#10+
                'Deseja também visualizar agora o arquivo de contracheque gerado ?',
                'Atenção', mtWarning, [mbYes, mbNo], 0);
    fillchar(ss,sizeof(ss),#0);
    ss:=snomeexcecao;
    ShellExecute(handle, 'open', Pchar(@ss[1]), nil, nil, SW_SHOWNORMAL);

    if ret = mrYes then
    begin
      fillchar(ss,sizeof(ss),#0);
      ss:=lblSalvar.caption;
      ShellExecute(handle, 'open', Pchar(@ss[1]), nil, nil, SW_SHOWNORMAL);
    end;
    //P.RAMOS-22.04.2004- até aqui
  end
  else
    ShowMessage('Nenhum Contracheque para ser gerado.');
end;

function Tfrmcontrachequetrimestral.gravapart(contprovdesc, contpart,
  contcontracheque, idresponsavelant: integer; totdesconto, totprovento,
  liquido: double; flgprimeiro: integer): boolean;
 var documento, detalhe1, banco, agencia, NumDepIRRF, NumSeq: string;
begin
  if flgprimeiro = 1  then
  begin
    detalhe1 :=Completa82 ('+1');
    writeln(arqcontracheque,detalhe1);
  end;
  detalhe1:='11'+qrycontrachequebeneficiario.AsString ;
  detalhe1 :=Completa82(detalhe1);
  writeln(arqcontracheque,detalhe1);
  documento:=AD(qrycontrachequenumdocumento.AsString,11);
  NumDepIRRF:=ZD(Trim(qrycontracheque.FieldByName('NUMDEPIRRF').AsString),2);
  NumSeq:=ZD(Trim(qrycontracheque.FieldByName('NUMSEQUENCIA').AsString),2);
  // CARLOS 22/06/2001
  detalhe1:='-1 '+qrycontrachequematricula.AsString+'                 '+// +2 ESPAÇOS ...15=>17
    NumSeq+'  '+copy(documento,1,9)+'/'+copy(documento,10,2)+ // +2 ESPAÇOS ...1=>3 (APÓS '00')
    '                '+NumDepIRRF;
  detalhe1 :=Completa82(detalhe1);
  writeln(arqcontracheque,detalhe1);
  banco:=qrycontrachequebanco.AsString;
  agencia:=qrycontrachequeagencia.AsString;
  //AD(copy(banco,1,30),30)
  //ZD(copy(banco,1,30),30)
  // CARLOS 22/06/2001
  detalhe1:='-1'+Ae(copy(banco,1,30),30)+''+
            ae(copy(agencia,1,21),21)+''+
            ae(qrycontrachequecontacorrente.AsString,14);//ERA 16
  //detalhe1:=MascaraAlfa(AE(detalhe1,82));
  detalhe1 :=Completa82(detalhe1);
  writeln(arqcontracheque,detalhe1);
end;

function  Tfrmcontrachequetrimestral.gravadetalhecheio(contprovdesc:integer;contpart:integer;contcontracheque:integer;idresponsavelant:integer;
       totdesconto:double; totprovento:double; liquido:double;flgprimeiro:integer ):boolean;
 var detalhe1, mesref, espaco, descricao, svalor : string;
begin
  descricao:=qrycontrachequedescrprovdesc.AsString;
  if (contcontracheque = 0 ) and (contprovdesc = 0 ) then
  begin
    mesref:=qrycontrachequemesreferencia.AsString;
    svalor:=formatfloat('#0.00',qrycontrachequevalor.AsFloat);
    detalhe1:=AE('22',2)+Ae(descricao,38)+
              AD(copy(mesref,6,2),2)+'/'+
              Ae(copy(mesref,3,2),14)+AD(svalor,10);
    detalhe1:=Completa82(detalhe1);
    writeln(arqcontracheque,detalhe1);
  end;
  if (contcontracheque = 1 ) and (contprovdesc = 0 ) then
  begin
    mesref:=qrycontrachequemesreferencia.AsString;
    svalor:=formatfloat('#0.00',qrycontrachequevalor.AsFloat);
    detalhe1:=AE('42',2)+Ae(descricao,38)+
              AD(copy(mesref,6,2),2)+'/'+
              Ae(copy(mesref,3,2),14)+AD(svalor,10);
    detalhe1:=Completa82(detalhe1);
    writeln(arqcontracheque,detalhe1);
  end;
  if (contcontracheque = 2) and (contprovdesc = 0 ) then
  begin
    mesref:=qrycontrachequemesreferencia.AsString;
    svalor:=formatfloat('#0.00',qrycontrachequevalor.AsFloat);
    detalhe1:=AE('62',2)+Ae(descricao,38)+
              AD(copy(mesref,6,2),2)+'/'+
              Ae(copy(mesref,3,2),14)+AD(svalor,10);
    detalhe1:=Completa82(detalhe1);
    writeln(arqcontracheque,detalhe1);
  end;

  //Bruno Bastos 16/04/2002 Início
  If Flgquartomes = 1 Then
  Begin
    if (contcontracheque = 3) and (contprovdesc = 0 ) then
    begin
      mesref:=qrycontrachequemesreferencia.AsString;
      svalor:=formatfloat('#0.00',qrycontrachequevalor.AsFloat);
      detalhe1:=AE('82',2)+Ae(descricao,38)+
                AD(copy(mesref,6,2),2)+'/'+
                Ae(copy(mesref,3,2),14)+AD(svalor,10);
      detalhe1:=Completa82(detalhe1);
      writeln(arqcontracheque,detalhe1);
    end;
  End;
  //Bruno Bastos 16/04/2002 Fim

  //Bruno Bastos 08/05/2002 Início
  If flgquartomes = 1 Then // Se contracheque for quadrimestral
  Begin
    if (contprovdesc > 0) and (contprovdesc < 11) then
    Begin
      mesref:=qrycontrachequemesreferencia.AsString;
      svalor:=formatfloat('#0.00',qrycontrachequevalor.AsFloat);
      espaco:=' ';
      detalhe1:=espaco+'2'+Ae(descricao,38)+
                AD(copy(mesref,6,2),2)+'/'+
                Ae(copy(mesref,3,2),14)+AD(svalor,10);
      detalhe1:=Completa82(detalhe1);
      writeln(arqcontracheque,detalhe1);
    End
  End
  Else
  Begin
    if (contprovdesc > 0 ) then
    begin
      mesref:=qrycontrachequemesreferencia.AsString;
      svalor:=formatfloat('#0.00',qrycontrachequevalor.AsFloat);
      espaco:=' ';
      detalhe1:=espaco+'2'+Ae(descricao,38)+
                AD(copy(mesref,6,2),2)+'/'+
                Ae(copy(mesref,3,2),14)+AD(svalor,10);
      detalhe1:=Completa82(detalhe1);
      writeln(arqcontracheque,detalhe1);
    end;
  end;
  //Bruno Bastos 08/05/2002 Fim
end;

function  Tfrmcontrachequetrimestral.gravadetalhevazio(contprovdesc:integer;contpart:integer;contcontracheque:integer;idresponsavelant:integer;
       totdesconto:double; totprovento:double; liquido:double;flgprimeiro:integer ):boolean;
 var detalhe1, mesref : string;
begin
  while contprovdesc < 15 do
  begin
    if (contcontracheque = 0 ) and (contprovdesc = 0 ) then
    begin
      detalhe1:=Completa82('22');
      writeln(arqcontracheque,DETALHE1);
    end;
    if (contcontracheque = 1 ) and (contprovdesc = 0 ) then
    begin
      detalhe1:=AE('42',82);
      writeln(arqcontracheque,detalhe1);
    end;
    if (contcontracheque = 2) and (contprovdesc = 0 ) then
    begin
      detalhe1:=AE('62',82);
      writeln(arqcontracheque,detalhe1);
    end;

    //Bruno Bastos 16/04/2002 Início
    If flgquartomes = 1 Then
    Begin
      if (contcontracheque = 3) and (contprovdesc = 0 ) then
      begin
        detalhe1:=AE('82',82);
        writeln(arqcontracheque,detalhe1);
      end;
    End;
    //Bruno Bastos 16/04/2002 Fim

//P.RAMOS-04.11.2004-PEND.18048
    if (contprovdesc = 0) then
      inc(contprovdesc);
//P.RAMOS-04.11.2004-PEND.18048-ATÉ AQUI

    //Bruno Bastos 07/05/2002 Início
//P.RAMOS-04.11.2004-PEND.18048-DESCOMENTADO CÓDIGO PARA GERAR APENAS 11 LINHAS
//  NO CONTRACHEQUE QUADRIMESTRAL. HAVIA SIDO ALTERADO A PEDIDO ANTERIOR DA REFER
    If flgquartomes = 1 Then
    Begin
      If (contprovdesc > 11) Then Break;
      detalhe1:=(' 2');
      detalhe1:=Completa82(detalhe1);
      writeln(arqcontracheque,detalhe1);
    End
    Else
    Begin
//P.RAMOS-04.11.2004-PEND.18048-DESCOMENTADO CÓDIGO PARA GERAR APENAS 11 LINHAS
//  NO CONTRACHEQUE QUADRIMESTRAL-ATÉ AQUI
      if (contprovdesc > 0) then
      begin
        detalhe1:=(' 2');
        detalhe1:=Completa82(detalhe1);
        writeln(arqcontracheque,detalhe1);
      end;
    end;
    //Bruno Bastos 07/05/2002 Fim
    contprovdesc:=contprovdesc + 1;
  end;
end;

function  Tfrmcontrachequetrimestral.totalcontracheque(contprovdesc:integer;contpart:integer;contcontracheque:integer;idresponsavelant:integer;
       totdesconto:double; totprovento:double; liquido:double;flgprimeiro:integer ):boolean;
 var svalor, detalhe1, desconto, provento, liquido1 : string;
begin
  liquido:=totprovento - totdesconto;
  svalor:=formatfloat('#0.00',totdesconto);
  desconto:=svalor;
  svalor:=formatfloat('#0.00',totprovento);
  provento:=svalor;
  svalor:=formatfloat('#0.00',liquido);
  liquido1:=svalor;
  if contcontracheque = 0 then
  begin
    detalhe1:=AD('33',2)+AD(provento,14)+AD(desconto,17)+
                AD(liquido1,32);
    detalhe1:=Completa82(detalhe1);
    writeln(arqcontracheque,detalhe1);
  end;
  if contcontracheque = 1 then
  begin
    detalhe1:=AD('53',2)+AD(provento,14)+AD(desconto,17)+
                AD(liquido1,32);
    detalhe1:=Completa82(detalhe1);
    writeln(arqcontracheque,detalhe1);
  end;
  if contcontracheque = 2 then
  begin
    detalhe1:=AD('73',2)+AD(provento,14)+AD(desconto,17)+
                AD(liquido1,32);
    detalhe1:=Completa82(detalhe1);
    writeln(arqcontracheque,detalhe1);
  end;

  //Bruno Bastos 16/04/2002 Início
  If Flgquartomes = 1 Then
  Begin
    if contcontracheque = 3 then
    begin
      detalhe1:=AD('93',2)+AD(provento,14)+AD(desconto,17)+
                  AD(liquido1,32);
      detalhe1:=Completa82(detalhe1);
      writeln(arqcontracheque,detalhe1);
    end;
  End;
  //Bruno Bastos 16/04/2002 Fim
end;

procedure  Tfrmcontrachequetrimestral.gravamensagem;
 var texto1, texto2, texto3, texto4, detalhe1: string;
begin
  //Bruno Bastos 16/04/2002 Início
  If Flgquartomes = 0 Then
    detalhe1:=AE('84',82)
  Else
    detalhe1:=AE('A4',82);
  //Bruno Bastos 16/04/2002 Fim

  writeln(arqcontracheque,DETALHE1);
  texto1:=maskmensagem1.text;
  texto2:=maskmensagem2.text;
  texto3:=maskmensagem3.text;
  texto4:=maskmensagem4.text;

  //Bruno Bastos 16/04/2002 Início
  If Flgquartomes = 1 Then
  Begin
    detalhe1:=Completa82('B5'+texto1);
    writeln(arqcontracheque,detalhe1);
    detalhe1:=Completa82(' 5'+texto2);
    writeln(arqcontracheque,detalhe1);
    detalhe1:=Completa82(' 5'+texto3);
    writeln(arqcontracheque,detalhe1);
  End
  //Bruno Bastos 16/04/2002 Fim
  Else
  Begin
    detalhe1:=Completa82('95'+texto1);
    writeln(arqcontracheque,DETALHE1);
    detalhe1 :=Completa82(' 5'+texto2);
    writeln(arqcontracheque,DETALHE1);
    detalhe1 :=Completa82(' 5'+texto3);
    writeln(arqcontracheque,detalhe1);
    detalhe1:=Completa82(' 5'+texto4);
    writeln(arqcontracheque,detalhe1);
    detalhe1:=Completa82(' 5');
    writeln(arqcontracheque,detalhe1);
    detalhe1:=Completa82(' 5');
    writeln(arqcontracheque,detalhe1);
    detalhe1:=Completa82(' 5');
    writeln(arqcontracheque,detalhe1);
    detalhe1:=Completa82(' 5');
    writeln(arqcontracheque,detalhe1);
    detalhe1:=Completa82(' 5');
    writeln(arqcontracheque,detalhe1);
    detalhe1:=Completa82(' 5');
    writeln(arqcontracheque,detalhe1);
    detalhe1:=Completa82(' 5');
    writeln(arqcontracheque,detalhe1);
  End;
end;

function Tfrmcontrachequetrimestral.gravaendereco(nome,logradouro,numero,complemento,
  bairro,codestado,cidade,cep,nome1,logradouro1,numero1,complemento1,bairro1,
  codestado1,cidade1,cep1: string): boolean;
 var detalhe1: string;
begin
  //Bruno Bastos 16/04/2002 Início
  If Flgquartomes <> 1 Then
  Begin
    detalhe1:=Ae('A4',8)+Ae(nome,76);
    writeln(arqcontracheque,detalhe1);
  End
  Else
  Begin
    detalhe1:=Ae('C4',8)+Ae(nome,76);
    writeln(arqcontracheque,detalhe1);
  End;
  //Bruno Bastos 16/04/2002 Fim

  detalhe1:=' 4      '+Ae(logradouro,76);
  writeln(arqcontracheque,detalhe1);
  detalhe1:=' 4      '+Ae(trim(numero)+' '+trim(complemento)+' '+trim(bairro),76);
  writeln(arqcontracheque,detalhe1);
  detalhe1:=' 4      '+Ae(cidade,17)+Ae(codestado,10);
  detalhe1 :=Completa82(detalhe1);
  writeln(arqcontracheque,detalhe1);
  detalhe1:=' 4      '+Ad(copy(cep,1,5),5)+'-'+Ad(copy(cep,6,3),3);
  detalhe1:=Completa82(detalhe1);
  writeln(arqcontracheque,detalhe1);
  // Carlos 17/07/2001: inserir sequencial
  Inc(iSeq);
  detalhe1:=' 6                                '+ZD(IntToStr(iSeq),7);
  detalhe1:=Completa82(detalhe1);
  writeln(arqcontracheque,detalhe1);

  //Bruno Bastos 16/04/2002 Início
  If Flgquartomes <> 1 Then
  Begin
    detalhe1:=Ae('A4',8)+Ae(nome1,76);
    writeln(arqcontracheque,detalhe1);
  End
  Else
  Begin
    detalhe1:=Ae('C4',8)+Ae(nome1,76);
    writeln(arqcontracheque,detalhe1);
  End;
  //Bruno Bastos 16/04/2002 Fim

  detalhe1:=' 4      '+Ae(logradouro1,76);
  writeln(arqcontracheque,detalhe1);
  detalhe1:=' 4      '+Ae(trim(numero1)+' '+trim(complemento1)+' '+trim(bairro1),76);
  writeln(arqcontracheque,detalhe1);
  detalhe1:=' 4      '+Ae(cidade1,17)+Ae(codestado1,10);
  detalhe1:=Completa82(detalhe1);
  writeln(arqcontracheque,detalhe1);
  detalhe1:=' 4      '+Ad(copy(cep1,1,5),5)+'-'+Ad(copy(cep1,6,3),3);
  detalhe1:=Completa82(detalhe1);
  writeln(arqcontracheque,detalhe1);
  // Carlos: inserir sequencial
  // Carlos 17/07/2001: inserir sequencial
    Inc(iSeq);
  detalhe1:=' 6                                '+ZD(IntToStr(iSeq),7);
  detalhe1:=Completa82(detalhe1);
  writeln(arqcontracheque,detalhe1);
end;

procedure Tfrmcontrachequetrimestral.FormCreate(Sender: TObject);
begin
  inherited;
  flgquartomes := 0;//Bruno Bastos - 05/04/2004
  qryhist.open;
  qryhist1.open;
  qryhist2.open;
  qryhist3.open; //Bruno Bastos 16/04/2002
end;

procedure Tfrmcontrachequetrimestral.fcsbtnProcurarClick(Sender: TObject);
 var lst: tstringlist;
begin
  inherited;
  lst:=tstringlist.create;
  try
    lst.addstrings(msRecebedor.filtro);
    msRecebedor.filtro.insert(0,'IDHSTFOLHABENEF = '+
      inttostr(qryhistidhstfolhabenef.asinteger));
    msRecebedor.Executar;
    if msRecebedor.RetornouValor then
    begin
      sinscricao:=msRecebedor.ValoresChave[0];
      smatricula:=msRecebedor.ValoresChave[1];
      snomerecebedor:=msRecebedor.ValoresChave[3];
      lidTitular:=StrtoInt(msRecebedor.ValoresChave[4]);
      lidRecebedor:=StrtoInt(msRecebedor.ValoresChave[5]);
      lidPatro:=StrtoInt(msRecebedor.ValoresChave[8]);
      lidPlanoPrev:=StrtoInt(msRecebedor.ValoresChave[9]);
      snomeplano:=msRecebedor.ValoresChave[11];
      ctipopessoa:=SistemaFolha.IdentificaTipoPessoa(qryAux, lidTitular, lidRecebedor);
      case ctipopessoa of
        'P': edTipoPessoa.text:='Titular';
        'B': edTipoPessoa.text:='Beneficiário';
        'T': edTipoPessoa.text:='Tutor Responsável';
        'C': edTipoPessoa.text:='Consignatário';
        'N': edTipoPessoa.text:='Não Identificado';
      end;
      edNome.Text:=msRecebedor.ValoresChave[3];
    end;
  finally
    msRecebedor.filtro.clear;
    msRecebedor.filtro.addstrings(lst);
    lst.free;
  end;
end;

procedure Tfrmcontrachequetrimestral.fcsbtnLimpaClick(Sender: TObject);
begin
  inherited;
  smatricula:='';
  sinscricao:='';
  snomerecebedor:='';
  ctipopessoa:=#0;
  lidTitular:=0;
  lidRecebedor:=0;
  lidPatro:=0;
  lidPlanoPrev:=0;
  edNome.text:='';
  edTipoPessoa.text:='';
end;

procedure Tfrmcontrachequetrimestral.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  dlgArquivo.filename:=lblSalvar.caption;
  dlgArquivo.InitialDir:=ExtractFilePath(lblSalvar.caption);
  if dlgArquivo.execute then
    lblSalvar.caption:=dlgArquivo.filename;
end;


//Bruno Bastos 16/04/2002 Início
procedure Tfrmcontrachequetrimestral.RdoTipoContraChequeClick(
  Sender: TObject);
begin
  inherited;
  If RdoTipoContraCheque.ItemIndex = 0 Then Begin
    gbVersao.Enabled      := True;
    gbRecebedor.Enabled   := True;
    gbMensagem.enabled    := True;
    gbSalva.Enabled       := True;
    Label4.Enabled        := False;
    dblkquartomes.enabled := False;
    flgquartomes          := 0;//Bruno Bastos - 05/04/2004
  End
  Else
  Begin
    gbVersao.Enabled      := True;
    gbRecebedor.Enabled   := True;
    gbMensagem.enabled    := True;
    gbSalva.Enabled       := True;
    Label4.Enabled        := True;
    dblkquartomes.enabled := True;
    flgquartomes          := 1;
  End; { If }
end;
//Bruno Bastos 16/04/2002 Fim

procedure Tfrmcontrachequetrimestral.gravapartvazio;
Var
  detalhe1 : String;
begin
  detalhe1 := Completa82('+1');
  writeln(arqcontracheque,detalhe1);
  detalhe1 := '11';
  detalhe1 := Completa82(detalhe1);
  writeln(arqcontracheque,detalhe1);

  detalhe1:='-1 '+
  '          '+'                 '+'  '+'  '+'         '+'/  '+'  '+
  '                '+'  ';
  detalhe1 :=Completa82(detalhe1);
  writeln(arqcontracheque,detalhe1);

  detalhe1:='-1'+StrPadLeft(' ', 30, ' ')+''+
            StrPadLeft(' ', 21, ' ')+''+
            StrPadLeft(' ', 14, ' ');//ERA 16

  detalhe1 :=Completa82(detalhe1);
  writeln(arqcontracheque,detalhe1);
end;

end.
{==============================================================================|
| UNIT: FCONTRACHEQUETRIMESTRAL                                                |
| DESCRIÇÃO FUNCIONAL: GERAR DEMONSTRATIVO DE PAGAMENTO                        |
|                                                                              |
===============================================================================|
|                                                                              |
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/08/2001 A 17/08/2001                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12                                               |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   ALTERACAO NA QUERY QRYCONTRACHEQUE PARA INCLUI JOIN COM A TABELA ESTADO    |
| PARA PEGAR O CODIGO DO ESTADO                                                |
|                                                                              |
|------------------------------------------------------------------------------|
|                                                                              |
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 16/04/2002 A 18/04/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12                                               |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   GERAR UM ARQUIVO QUE PERMITA IMPRIMIR POR TRIMESTRE OU POR QUADRIMESTRE    |
|                                                                              |
|------------------------------------------------------------------------------|
|                                                                              |
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/05/2002 A 08/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12                                               |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|     ALTERAÇÃO DE LAYOUT DE 15 PARA 12 LINHAS O ESPAÇO PARA AS RUBRICAS,      |
|   QUANDO O CONTRACHEQUE FOR QUADRIMESTRAL                                    |
|                                                                              |
|------------------------------------------------------------------------------|
|                                                                              |
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 14/05/2002 A 14/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12                                               |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|     ALTERAÇÃO DO TÍTULO DO CONTRACHEQUE QUADRIMESTRAL, TESTAR SE RUBRICA     |
|   SERÁ NORMAL, ESPECIAL VISÍVEL OU ESPECIAL INVISÍVEL, RESPECTIVAMENTE       |
|   0 (ZERO), 1 (UM) E 2 (DOIS). SE NORMAL, IMPRIMIR NO CONTRACHEQUE E TESTAR  |
|   SE É DESCONTO OU NÃO ATRAVÉS DO FLGDESCONTO, QUE SE FOR 0 (ZERO) É UM      |
|   PROVENTO, ENTÃO SOMA, SE FOR 1 (UM) É UM DESCONTO, ENTÃO DIMINUI, SE       |
|   FLGDESCONTO FOR IGUAL A 2 (DOIS), ENTÃO NADA SERÁ FEITO. SE FLGESPECIAL    |
|   FOR ESPECIAL VISÍVEL, IMPRIME NO CONTRACHEQUE, MAS NÃO SOMA NEM DIMINUI    |
|   E CASO FLGESPECIAL SEJA IGUAL A 2 (DOIS), NÃO FAZ ABSOLUTAMENTE NADA       |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei B Marins.                                              |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/07/2002 A 18/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF  - Pendencia 7664.                                           |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Modificação para exibir código/descrição externa |                                                                              |
|  conforme a parametrização na tabela PARAMAPREV.                             |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 28/08/2004 A 28/08/2004                         |
| PENDÊNCIA: 17803                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Não utilizar mais CMINTBANCO em 2 camadas e substituir a unit uString pela   |
| uBiblioteca.                                                                 |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------}

