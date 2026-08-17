unit FCriaTabs;

//Definição Propprodutor

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FTelaAut, StdCtrls, Buttons, MAHlpBtn, ExtCtrls, DBCtrls, Db, Wwdatsrc,
  DBTables, Wwquery, Grids, DBGrids, Wwdbigrd, Wwdbgrid, Menus, FSairAjuda,
  TB97, TB97Tlbr, wwdblook, Mask, ComCtrls, Wwtable, IvDictio, IvMulti,
  IvEMulti, wwdbedit, Wwdotdot, Wwdbcomb;

type
  TfrmCriaTabs = class(TfrmSairAjuda)
    qryCampos: TwwQuery;
    LkcTabelas: TwwDBLookupCombo;
    Label1: TLabel;
    QryAux: TwwQuery;
    PgCtrlDetalhe: TPageControl;
    tbshDetalhe: TTabSheet;
    PnlDetalhe: TPanel;
    Label3: TLabel;
    Nome: TDBEdit;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    DtAvaliacao: TDBEdit;
    pnlBarraDetalhe: TPanel;
    BtExcl: TSpeedButton;
    btAlt: TSpeedButton;
    BtIns: TSpeedButton;
    qrydetalhe: TwwQuery;
    dsdet: TwwDataSource;
    qrycmpbd: TwwQuery;
    qrydados: TwwQuery;
    Panel2: TPanel;
    Label4: TLabel;
    PrgBar1: TProgressBar;
    BtMostra: TSpeedButton;
    BarraEstado: TStatusBar;
    QryGrupo: TwwQuery;
    Label7: TLabel;
    QryPartprevplan: TwwQuery;
    painelescolha: TPanel;
    Label8: TLabel;
    DBPlanos: TwwDBLookupCombo;
    plano: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    QryPesquisa: TwwQuery;
    TabErros: TwwTable;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Soleitura: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit2: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure PnlDetalheClick(Sender: TObject);
    procedure btAltClick(Sender: TObject);
    procedure BtExclClick(Sender: TObject);
    procedure BtInsClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure DBEdit4Enter(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnOkDetExit(Sender: TObject);
    procedure BtMostraClick(Sender: TObject);
    procedure LkcTabelasChange(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure LkcTabelasClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBPlanosChange(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    sTpPlano : string;

    { Private declarations }
  public
    { Public declarations }

    function Gravaerro(nometabela,tipocritica,dataref,descricao : string;
                                      idpessoa,idpessjur,idsitplanprev: integer): boolean;
    function GravaTabCampo(idtab : integer;codigocampo,descricaocampo : string;
                           tipocampo : integer;posicaocampo : string) : boolean;
    function DeletarRegistros(idtabela : integer): boolean;
    function ParticPlanoMetro(descricao,dtavaliacao : string) : boolean;
    function ParticPlanoRefer(descricao,dtavaliacao : string) : boolean;
    function DependPlanoRefer(descricao,dtavaliacao : string) : boolean;
  end;

var
  frmCriaTabs: TfrmCriaTabs;

implementation

uses
    UMensErro,UDataBase,UBibliotecaAtuarial,usistema, UGrupoHipotese, RelatErro;

{$R *.DFM}
function   TfrmCriaTabs.Gravaerro(nometabela,tipocritica,dataref,descricao : string;
                                  idpessoa,idpessjur,idsitplanprev: integer): boolean;
begin
    taberros.append;
    taberros['tabela']      := nometabela;
    taberros['dataatual']   := date;
    taberros['dataref']     := dataref;
    taberros['descricao']   := descricao;
    taberros['tipo']        := tipocritica;
    taberros['idpessoa']    := idpessoa;
    taberros['idpessjur']   := idpessjur;
    taberros['situacao']    := idsitplanprev;
    taberros.post;
    GravaErro := true;
end;

function   TfrmCriaTabs.GravaTabCampo(idtab : integer;codigocampo,descricaocampo : string;
                                      tipocampo : integer;posicaocampo : string): boolean;
begin
    qrycampos.append;
    qrycampos['idtabela']  := idtab;
    qrycampos['idcampo']   := codigocampo;
    qrycampos['descricao'] := descricaocampo;
    qrycampos['tipo']      := tipocampo;
    qrycampos['relacao']   := posicaocampo;
    qrycampos.post;
    GravaTabCampo := true;
end;

function TfrmCriaTabs.DeletarRegistros(idtabela : integer): boolean;
begin
 if not ExecutaQuery(QryAux,'DELETE '+sistema.PrefixoServidor+'TBVALPART '+
             'WHERE IDTABELA  = '+IntToStr(IDTABELA)) then begin
              showmessage('Problemas na tabela de valores (participantes)'+#10+#13+
                          'Erro na Tabela de Valores dos Participantes.');
   DeletarRegistros := false;
 end;
 if not ExecutaQuery(QryAux,'DELETE '+sistema.PrefixoServidor+'TBCAMPOPART '+
             'WHERE IDTABELA  = '+IntToStr(IDTABELA)) then begin
              showmessage('Problemas na tabela de campos (participantes)'+#10+#13+
                          'Erro na Tabela de Campos dos Participantes.');
    DeletarRegistros := false;
 end;
 if not ExecutaQuery(QryAux,'DELETE '+sistema.PrefixoServidor+'TBPARTICIP '+
              'WHERE IDTABELA  = '+IntToStr(IDTABELA)) then begin
               showmessage('Problemas na tabela principal (participantes)'+#10+#13+
                           'Erro na Tabela de principal dos Participantes.');
     DeletarRegistros := false;
 end;
 DeletarRegistros := true;

end;

function TfrmCriaTabs.DependPlanoRefer(descricao,dtavaliacao : string) : boolean;
begin
end;


function TfrmCriaTabs.ParticPlanoRefer(descricao,dtavaliacao : string) : boolean;
var
beneficio,
situacao,naogravados,gravados,
anoref,mesref,idadeatual,idadeinscricao,registro,pos,i,j,code : integer;
mesano,JOIA,data ,nomebeneficio,wvalor : string;
datasitfundacao,datasitempresa,datasit : tdatetime;
anoi,mesi,diai,dia,ano,mes : word;

salmin,salario,valor : real;
erro : boolean;
begin
 // CORAÇÃO DA BUSCA : A TABELA BASE SERÁ A PARTPREVPLAN, QUE INDICA TODOS
 // OS PARTICIPANTES DO PLANO (QUE É DEFINIDO TAMBÉM NO PARÂMETRO)

 val(copy(dtavaliacao,1,4),anoref,code);
 if (code <> 0) or (anoref < 1999) then begin
   showmessage('Problemas no ano da data de referência da avaliação');
   ParticPlanoRefer := false;
 end;
 val(copy(dtavaliacao,5,2),mesref,code);
 if (code <> 0) or ((mesref < 1) or (mesref > 12)) then begin
   showmessage('Problemas no mês da data de referência da avaliação');
   ParticPlanoRefer := false;
 end;

 with QryPartprevplan do begin
  close;
  sql.clear;
  sql.add('SELECT    PART.IDPESSOA       , PART.IDPESSJUR       , PART.IDPLANOPREV       ,');
  sql.add('PART.SALMANTIDO     , PART.SALPARTICIPACAO , PART.IDSITPLANOPREV    ,');
  sql.add('PART.IDSITPART      , PART.DATAINICIOMANUT , PART.DATACANCELAMENTO  , PART.DTINICIOINSC AS DATAINSC, ');
  sql.add('ELEG.DATAADMISSAO AS V10, PF.DATANASC AS V11   , PF.ESTCIVIL AS V12     ,');
  sql.add('PF.SEXO AS V13      , PAI.NUMDOCUMENTO AS V14, ELEG.MATRICULA AS V15  ,');
  sql.add('ELEG.IDSITFUNC AS V16, ELEG.DATADEMISSAO AS V17, ELEG.TEMPOSERVANTERIOR AS V18,');
  sql.add('ELEG.SALTOTAL AS V19, RESERVA.V33 ');
  sql.add('FROM    PARTPREVPLAN PART     , PESSOAFISICA PF     , ELEGPATRO ELEG,');
  sql.add('        PESSOA PAI            , SITPART   SIT, ');
  sql.add('        (SELECT C.IDPESSOA ,SUM(VALORRESERVA) AS V33 FROM RESERVAPART A, SITPART B, ');
  sql.add('         PARTPREVPLAN C ');
  sql.add('         WHERE C.IDPLANOPREV = :PLANO AND ');
  sql.add('    	    B.FLGINTERNO <> ''CA'' AND ');
  sql.add('	    C.IDPESSOA = A.IDPESSOA AND ');
  sql.add('	    B.IDSITPART = C.IDSITPART AND ');
  sql.add('	    C.IDPESSJUR= A.IDPESSJUR AND ');
  sql.add('	    C.IDPLANOPREV = A.IDPLANOPREV AND ');
  sql.add('	    C.SEQPROPOSTA = A.SEQPROPOSTA ');
  sql.add('	    GROUP BY C.IDPESSOA) RESERVA ');
  sql.add('   WHERE   (PART.IDPLANOPREV       = :PLANO) ');
  sql.add('   AND     (SIT.FLGINTERNO <> ''CA'') ');
  sql.add('   AND     (PART.IDPESSOA          =  PF.IDPESSOA) ');
  sql.add('   AND     (PART.IDPESSOA          =  ELEG.IDPESSOA) ');
  sql.add('   AND     (PART.IDPESSOA          =  RESERVA.IDPESSOA) ');
  sql.add('   AND     (PART.IDSITPART         =  SIT.IDSITPART) ');
  sql.add('   AND     (PAI.IDPESSOA           =  PART.IDPESSOA)');

  params[0].asinteger := 14; 
  try
   open;
  except begin
   showmessage('Problemas na tabela de participantes do plano - PARTPREVPLAN');
   ParticPlanoRefer := false;
  end;
  end;

  first;
  PrgBar1.Max   := QryPartPrevPlan.recordcount ;
  pos := 0;
  registro    := 0;
  gravados    := 0;
  naogravados := 0;
  while not (QryPartprevplan.EOF) do
  begin
   inc(registro);
   erro := false;

   if QryPartPrevPlan['IDSITPLANOPREV'] <> null then
   begin
       with QryPesquisa do
       begin
            close;
	    sql.clear;
            sql.add('SELECT IDSITPLANOPREV ');
            sql.add('FROM '+sistema.PrefixoServidor+'SITPLANOPREV WHERE ');
	    sql.add('IDSITPLANOPREV = :PARAM0 ');
            params[0].asinteger := QryPartPrevPlan['IDSITPLANOPREV'];
            open;
          if eof then
          begin
              Gravaerro(descricao,'S',dtavaliacao,'Código doParticipante inválido :'+inttostr(QryPartPrevPlan['IDSITPLANOPREV']),
                                  QryPartPrevPlan['IDPESSOA'],
				  QryPartPrevPlan['IDPESSJUR'],4);  // Situacao ignorada
              erro := true;
          end
          else
              situacao := QryPartPrevPlan['IDSITPLANOPREV'];
       end;//Fim do with qrypesquisa
   end//Fim do if qrypartprevplan
   else
   begin
      situacao := 4; // Situacao ignorada
      Gravaerro(descricao,'S',dtavaliacao,'Atenção : Código do Participante nulo',
                                  QryPartPrevPlan['IDPESSOA'],
                                  QryPartPrevPlan['IDPESSJUR'],situacao);
      erro := true;
   end;

   qryDados.append;
   QryDados['idtabela'] := qrydetalhe['idtabela'];
   // CAMPOS DA TABELA PARTPREVPLAN
   if QryPartPrevPlan['DATAINSC'] <> null then
    QryDados['V1'] :=  datetostr(QryPartPrevPlan['DATAINSC'])
   else begin
    QryDados['V1'] := '';
    Gravaerro(descricao,'S',dtavaliacao,'Data de inscrição inválida',
                                  QryPartPrevPlan['IDPESSOA'],
                                  QryPartPrevPlan['IDPESSJUR'],situacao);
    erro := true;
   end;

   if (QryPartPrevPlan['IDPESSOA'] = null) then begin
    Gravaerro(descricao,'S',dtavaliacao,'Identificação de Pessoa inválida',
                                  QryPartPrevPlan['IDPESSOA'],
                                  QryPartPrevPlan['IDPESSJUR'],situacao);
    erro := true;
   end;

   if (QryPartPrevPlan['IDPESSJUR'] = null) then begin
    Gravaerro(descricao,'S',dtavaliacao,'Identificação da Empresa Patrocinadora nula',
				  QryPartPrevPlan['IDPESSOA'],
                                  QryPartPrevPlan['IDPESSJUR'],situacao);
    erro := true;
   end;

   with QryPesquisa do begin
    close;
    sql.clear;
    sql.add('SELECT IDPESSOA ');
    sql.add('FROM '+sistema.PrefixoServidor+'PESSOA WHERE ');
    sql.add('FLGPATROCINADORA = 1 AND ');
    sql.add('IDPESSOA = :PARAM0 ');
    params[0].asinteger := QryPartPrevPlan['IDPESSJUR'];
    open;
    if eof then begin
     Gravaerro(descricao,'S',dtavaliacao,'Código da Empresa Patrocinadora inválido '+inttostr(QryPartPrevPlan['IDPESSJUR']),
                                  QryPartPrevPlan['IDPESSOA'],
                                  QryPartPrevPlan['IDPESSJUR'],situacao);
     erro := true;
    end;
   end;

   if (QryPartPrevPlan['IDPLANOPREV'] = null) then begin
    Gravaerro(descricao,'S',dtavaliacao,'Identificação do Plano nula',
                                  QryPartPrevPlan['IDPESSOA'],
                                  QryPartPrevPlan['IDPESSJUR'],situacao);
    erro := true;
   end;


   with QryPesquisa do begin
    close;
    sql.clear;
    sql.add('SELECT IDPLANOPREV ');
    sql.add('FROM '+sistema.PrefixoServidor+'PLANPREV WHERE ');
    sql.add('IDPLANOPREV = :PARAM0 ');
    params[0].asinteger := QryPartPrevPlan['IDPLANOPREV'];
    open;
    if eof then begin
     Gravaerro(descricao,'S',dtavaliacao,'Código do Plano inválido : '+inttostr(QryPartPrevPlan['IDPLANOPREV']),
                                  QryPartPrevPlan['IDPESSOA'],
                                  QryPartPrevPlan['IDPESSJUR'],situacao);
     erro := true;
    end;
   end;

   if (QryPartPrevPlan['IDSITPART'] = null)  then begin
    Gravaerro(descricao,'S',dtavaliacao,'Código do Participante no plano nulo',
                                  QryPartPrevPlan['IDPESSOA'],
                                  QryPartPrevPlan['IDPESSJUR'],situacao);
    erro := true;
   end;

   with QryPesquisa do begin
    close;
    sql.clear;
    sql.add('SELECT IDSITPART ');
    sql.add('FROM '+sistema.PrefixoServidor+'SITPART WHERE ');
    sql.add('IDSITPART = :PARAM0 ');
    params[0].asinteger := QryPartPrevPlan['IDSITPART'];
    open;
    if eof then begin
     Gravaerro(descricao,'S',dtavaliacao,'Código do Participante no plano inválido : '+inttostr(QryPartPrevPlan['IDSITPART']),
                                  QryPartPrevPlan['IDPESSOA'],
				  QryPartPrevPlan['IDPESSJUR'],situacao);
     erro := true;
    end;
   end;

   QryDados['V2'] := inttostr(QryPartPrevPlan['IDPESSOA']);
   QryDados['V3'] := inttostr(QryPartPrevPlan['IDPESSJUR']);
   QryDados['V4'] := inttostr(QryPartPrevPlan['IDPLANOPREV']);

   if (QryPartPrevPlan['IDSITPLANOPREV'] = 6) or
      (QryPartPrevPlan['IDSITPLANOPREV'] = 7) or
      (QryPartPrevPlan['IDSITPLANOPREV'] = 10) then begin
      // MANTIDO TOTAL ou PARCIAL ou PID/PIA
      wvalor := FrmGrupoHipotese.TrocaVirgulaPonto(Trim(QryPartPrevPlan['SALMANTIDO']));
      val(wvalor,valor,code);
      if code <> 0 then begin
        Gravaerro(descricao,'S',dtavaliacao,'Salário participação de manutenido não numérico',
				  QryPartPrevPlan['IDPESSOA'],
                                  QryPartPrevPlan['IDPESSJUR'],situacao);
        erro := true;
	salario := 0;
      end
      else begin
       salario := QryPartPrevPlan['SALMANTIDO'];
       QryDados['V5'] := FrmGrupoHipotese.TrocaVirgulaPonto(floattostr(QryPartPrevPlan['SALMANTIDO']));
       if QryPartPrevPlan['SALMANTIDO'] = 0 then begin
        Gravaerro(descricao,'S',dtavaliacao,'Salário participação de manutenido zerado',
				  QryPartPrevPlan['IDPESSOA'],
                                  QryPartPrevPlan['IDPESSJUR'],situacao);
        erro := true;
       end;
      end;
   end
   else begin
    if (QryPartPrevPlan['IDSITPLANOPREV'] = 9) then begin
     Gravaerro(descricao,'S',dtavaliacao,'Participante com código de vinculado Metro no plano REFER',
                             QryPartPrevPlan['IDPESSOA'],
                             QryPartPrevPlan['IDPESSJUR'],situacao);
     erro := true;
     salario := 0;
    end
    else begin
     if (QryPartPrevPlan['IDSITPLANOPREV'] = 4) then begin
      Gravaerro(descricao,'S',dtavaliacao,'Participante com código de Situação ignorada',
			      QryPartPrevPlan['IDPESSOA'],
                              QryPartPrevPlan['IDPESSJUR'],situacao);
      erro := true;
      salario := 0;
     end
     else begin
    //  PARTICIPANTES SITUAÇÃO : 1 NORMAL,2 DESLIGADO,3 EM ATRASO, 5 DESLIGADO COM RESERVA PAGA
   //   8 ASSISTIDO
      if QryPartPrevPlan['SALPARTICIPACAO'] <> null then begin
       wvalor := FrmGrupoHipotese.TrocaVirgulaPonto(floattostr(QryPartPrevPlan['SALPARTICIPACAO']));
       val(wvalor,valor,code);
       if QryPartPrevPlan['SALPARTICIPACAO'] = 0 then begin
         Gravaerro(descricao,'S',dtavaliacao,'Salário participação zerado',
                                    QryPartPrevPlan['IDPESSOA'],
                                   QryPartPrevPlan['IDPESSJUR'],situacao);
         erro := true;
         salario := 0;
       end;

       if code <> 0 then begin
         Gravaerro(descricao,'S',dtavaliacao,'Participante com salário de participação não numérico',
                             QryPartPrevPlan['IDPESSOA'],
                             QryPartPrevPlan['IDPESSJUR'],situacao);
	 erro := true;
         salario := 0;
       end
       else begin
	 QryDados['V5'] := FrmGrupoHipotese.TrocaVirgulaPonto(floattostr(QryPartPrevPlan['SALPARTICIPACAO']));
         salario := QryPartPrevPlan['SALPARTICIPACAO'];
       end;
      end
      else begin
       if (QryPartPrevPlan['IDSITPLANOPREV'] = 1) then begin  // normal
         Gravaerro(descricao,'S',dtavaliacao,'Participante situação Normal com salário participação em branco',
                             QryPartPrevPlan['IDPESSOA'],
                             QryPartPrevPlan['IDPESSJUR'],situacao);
         erro := true;
       end;

       QryDados['V5'] := '0';
       salario := 0;
      end;
     end;
    end;
   end;

   QryDados['V6'] := inttostr(situacao); 
   QryDados['V7'] := inttostr(QryPartPrevPlan['IDSITPART']);

   if QryPartPrevPlan['DATAINICIOMANUT'] <> null then  // DATA INICIO DE MANUTENÇÃO
    QryDados['V8'] :=  datetostr(QryPartPrevPlan['DATAINICIOMANUT'])
   else begin
    if (QryPartPrevPlan['IDSITPLANOPREV'] = 6) or
       (QryPartPrevPlan['IDSITPLANOPREV'] = 7) or
       (QryPartPrevPlan['IDSITPLANOPREV'] = 10) then begin
       Gravaerro(descricao,'S',dtavaliacao,'Participante mantido com data de manutenção zerada',
                             QryPartPrevPlan['IDPESSOA'],
			     QryPartPrevPlan['IDPESSJUR'],situacao);
       erro := true;
    end
    else
     QryDados['V8'] := '';
   end;
   IF Qrydados['v8'] <> NULL THEN
    data := Qrydados['v8'];
   if QryPartPrevPlan['DATACANCELAMENTO'] <> null then // DATA DE CANCELAMENTO
    QryDados['V9'] :=  datetostr(QryPartPrevPlan['DATACANCELAMENTO'])
   else
    QryDados['V9'] := '';

   IF Qrydados['v9'] <> NULL THEN
   data := Qrydados['v9'];

    if QryPartprevplan['V11'] <> null then // DATA DE NASCIMENTO
     QryDados['V11'] := datetostr(QryPartprevplan['V11'])
    else begin
     QryDados['V11'] := '';
     Gravaerro(descricao,'S',dtavaliacao,'Data de nascimento zerada',
			     QryPartPrevPlan['IDPESSOA'],
			     QryPartPrevPlan['IDPESSJUR'],situacao);
     erro := true;
    end;

    if QryPartprevplan['V12'] <> null then        // ESTADO CIVIL
     QryDados['V12'] := QryPartprevplan['V12']
    else
     QryDados['V12'] := '';

    if QryPartprevplan['V13'] <> null then        // SEXO
     if(uppercase(QryPartprevplan['V13']) <> 'M') and (uppercase(QryPartprevplan['V13']) <> 'F') then begin
      Gravaerro(descricao,'S',dtavaliacao,'Sexo com código errado',
			     QryPartPrevPlan['IDPESSOA'],
			     QryPartPrevPlan['IDPESSJUR'],situacao);
      erro := true;
     end
     else
     QryDados['V13'] := QryPartprevplan['V13']
    else begin
     Gravaerro(descricao,'S',dtavaliacao,'Sexo em branco',
			     QryPartPrevPlan['IDPESSOA'],
			     QryPartPrevPlan['IDPESSJUR'],situacao);
     erro := true;
    end;
   //end;

    if QryPartprevplan['V14'] <> null then        // CPF -> não é mais essencial
     QryDados['V14'] := QryPartprevplan['V14']
    else
     QryDados['V14'] := '';
   //end;

    if QryPartprevplan['V10'] <> null then        // DATA DE ADMISSAO
     QryDados['V10'] := datetostr(QryPartprevplan['V10'])
    else begin
     Gravaerro(descricao,'S',dtavaliacao,'Data de admissão em branco',
			     QryPartPrevPlan['IDPESSOA'],
			     QryPartPrevPlan['IDPESSJUR'],situacao);
     erro := true;
    end;

    if QryPartprevplan['V15'] <> null then        // MATRICULA
     QryDados['V15'] := QryPartprevplan['V15']
    else begin
     Gravaerro(descricao,'S',dtavaliacao,'Matrícula do participante com erro',
			     QryPartPrevPlan['IDPESSOA'],
			     QryPartPrevPlan['IDPESSJUR'],situacao);
     erro := true;
    end;

    if QryPartprevplan['V16'] <> null then
    begin        // SITUAÇÃO DO EMPREGADO
	with QryPesquisa do
	begin
	  close;
	  sql.clear;
	  sql.add('SELECT IDSITFUNC ');
	  sql.add('FROM '+sistema.PrefixoServidor+'SITFUNC WHERE ');
	  sql.add('IDSITFUNC = :PARAM0 ');
	  params[0].asinteger := QryPartprevplan['V16'];
	  open;
	  if eof then
	  begin
	     Gravaerro(descricao,'S',dtavaliacao,'Código da situação do empregado na Patrocinadora inválido : '+inttostr(QryPartprevplan['V16']),
				  QryPartPrevPlan['IDPESSOA'],
				  QryPartPrevPlan['IDPESSJUR'],situacao);
	     erro := true;
	  end;
	end;
    QryDados['V16'] := inttostr(QryPartprevplan['V16']);
    end
    else
    begin
       Gravaerro(descricao,'S',dtavaliacao,'Código da situação do empregado em branco',
			     QryPartPrevPlan['IDPESSOA'],
			     QryPartPrevPlan['IDPESSJUR'],situacao);
       erro := true;
    end;

    if QryPartprevplan['V17'] <> null then        // DATA DE DEMISSÃO
     QryDados['V17'] := datetostr(QryPartprevplan['V17'])
    else begin
      if (QryPartPrevPlan['IDSITPLANOPREV'] =  2) or  //DESLIGADO
	 (QryPartPrevPlan['IDSITPLANOPREV'] =  5) or  //DESLIGADO COM RP PAGA
	 (QryPartPrevPlan['IDSITPLANOPREV'] =  7) or  //MANTIDO PARCIAL
	 (QryPartPrevPlan['IDSITPLANOPREV'] = 10) or  //MANTIDO POR PID OU PIA
	 (QryPartPrevPlan['IDSITPLANOPREV'] =  8) then begin // ASSISTIDO
	 Gravaerro(descricao,'S',dtavaliacao,'Data de demissão em branco',
			     QryPartPrevPlan['IDPESSOA'],
			     QryPartPrevPlan['IDPESSJUR'],situacao);
	 erro := true;
      end
      else
       QryDados['V17'] := '';

   IF Qrydados['v17'] <> NULL THEN
   data := Qrydados['v17'];

    if QryPartprevplan['V18'] <> null then        // TEMPO DE SERVIÇO ANTERIOR
     QryDados['V18'] := inttostr(QryPartprevplan['V18'])
    else begin
     QryDados['V18'] := '0';
    end;

    if QryPartprevplan['V19'] <> null then        // SALÁRIO TOTAL - não é mais essencial
     QryDados['V19'] := FrmGrupoHipotese.TrocaVirgulaPonto(floattostr(QryPartprevplan['V19']))
    else
     QryDados['V19'] := '0';
    end;

    with QryAux do begin
     close;
     sql.clear;
     sql.add('SELECT G.NOME  AS V20 ');
     sql.add('FROM '+sistema.PrefixoServidor+'PARTPREVPLAN A, ');
     sql.add('(SELECT NOME,IDGRUPO,IDPESSOA FROM PESSOA WHERE FLGPATROCINADORA = 1) G ');
     sql.add('WHERE G.IDPESSOA = A.IDPESSJUR AND ');  // GRUPO AO QUAL A EMPRESA PERTENCE
     sql.add('A.IDPESSOA = :PARAM0 ');
     params[0].asinteger := QryPartPrevPlan['IDPESSOA'];
     try
      open;
     except begin
      showmessage('Problemas na pesquisa do grupo da empresa : PESSOA e PARTPREVPLAN');
      ParticPlanoRefer := false;
     end;
     end;
    end;
    if QryAux['V20'] <> null then        // GRUPO DA EMPRESA
      QryDados['V20'] := QryAux['V20']
    else begin
      Gravaerro(descricao,'S',dtavaliacao,'Grupo da empresa em branco',
                             QryPartPrevPlan['IDPESSOA'],
                             QryPartPrevPlan['IDPESSJUR'],situacao);
      erro := true;
    end;

   if (QryPartPrevPlan['IDSITPLANOPREV'] =  8) then begin // ASSISTIDO
    with QryAux do begin
     close;
     sql.clear;
     sql.add('SELECT DATAINICIOINSS AS V21,DATAINICIO AS V22,DATAFINAL AS V23, ');
     sql.add('ULTVALORATUALREAJ AS V24, VLRCALCINSS AS V25, ');
     sql.add('IDBENEFICIO AS V26, IDSITBENEFICIO AS V27 ');
     sql.add('FROM '+sistema.PrefixoServidor+'BENEFBFCIARIO WHERE ');
     sql.add('IDPESSOA = :PARAM0 ');
     sql.add('ORDER BY IDPESSOA');
     params[0].asinteger := QryPartPrevPlan['IDPESSOA'];
     try
      open;
     except begin
      showmessage('Problemas na Tabela da Elegibilidade da Pessoa : BENEFBFCIARIO');
      ParticPlanoRefer := false;
     end;
     end;
     if QryAux['V21'] <> null then        // DATA DA DIB INSS
      QryDados['V21'] := datetostr(QryAux['V21'])
     else begin
      Gravaerro(descricao,'S',dtavaliacao,'DATA DA DIB INSS em branco',
                             QryPartPrevPlan['IDPESSOA'],
                             QryPartPrevPlan['IDPESSJUR'],situacao);
      erro := true;
     end;

     if QryAux['V22'] <> null then        // DATA DA DIB REFER
      QryDados['V22'] := datetostr(QryAux['V22'])
     else begin
      Gravaerro(descricao,'S',dtavaliacao,'DATA DA DIB REFER em branco',
                             QryPartPrevPlan['IDPESSOA'],
                             QryPartPrevPlan['IDPESSJUR'],situacao);
      erro := true;
     end;

     if QryAux['V23'] <> null then        // DATA FIM DE BENEFICIO REFER
      QryDados['V23'] := datetostr(QryAux['V23'])
     else begin
      if QryAux['V27'] = 3 then begin // BENEFICIO ENCERRADO
       Gravaerro(descricao,'S',dtavaliacao,'DATA FIM DA DIB REFER em branco',
                             QryPartPrevPlan['IDPESSOA'],
                             QryPartPrevPlan['IDPESSJUR'],situacao);
       erro := true;
      end
      else
       QryDados['V23'] := '';
     end;

     if QryAux['V24'] <> null then        // BENEFICIO REFER
      QryDados['V24'] := FrmGrupoHipotese.TrocaVirgulaPonto(floattostr(QryAux['V24']))
     else begin
      Gravaerro(descricao,'S',dtavaliacao,'Benefício REFER em branco',
                             QryPartPrevPlan['IDPESSOA'],
			     QryPartPrevPlan['IDPESSJUR'],situacao);
      erro := true;
     end;

     if QryAux['V25'] <> null then        // BENEFICIO INSS
      QryDados['V25'] := FrmGrupoHipotese.TrocaVirgulaPonto(floattostr(QryAux['V25']))
     else begin
      Gravaerro(descricao,'S',dtavaliacao,'Benefício INSS em branco',
                             QryPartPrevPlan['IDPESSOA'],
                             QryPartPrevPlan['IDPESSJUR'],situacao);
      erro := true;
     end;

     if QryAux['V26'] <> null then begin       // TIPO DE BENEFICIO
      with QryPesquisa do begin
       close;
       sql.clear;
       sql.add('SELECT IDBENEFICIO,NOME ');
       sql.add('FROM '+sistema.PrefixoServidor+'BENEFICIO WHERE ');
       sql.add('IDBENEFICIO = :PARAM0 ');
       params[0].asinteger := QryAux['V26'];
       open;
       if eof then begin
        Gravaerro(descricao,'S',dtavaliacao,'Código de benefício inválido'+inttostr(QryAux['V26']),
                                     QryPartPrevPlan['IDPESSOA'],
                                     QryPartPrevPlan['IDPESSJUR'],situacao);
        erro := true;
       end
       else begin
        QryDados['V26'] := inttostr(QryAux['V26']);
        beneficio := QryAux['V26'];
        nomebeneficio :=  QryPesquisa['NOME'];
       end;
      end;
     end
     else begin
      Gravaerro(descricao,'S',dtavaliacao,'Código de benefício está em branco',
                             QryPartPrevPlan['IDPESSOA'],
                             QryPartPrevPlan['IDPESSJUR'],situacao);
      erro := true;
     end;

     if QryAux['V27'] <> null then begin        // SITUACAO DO BENEFICIO
      with QryPesquisa do begin
       close;
       sql.clear;
       sql.add('SELECT IDSITBENEFICIO ');
       sql.add('FROM '+sistema.PrefixoServidor+'SITBENEFICIO WHERE ');
       sql.add('IDSITBENEFICIO = :PARAM0 ');
       params[0].asinteger := QryAux['V27'];
       open;
       if eof then begin
        Gravaerro(descricao,'S',dtavaliacao,'Código do tipo de benefício inválido :'+inttostr(QryAux['V27']),
                                     QryPartPrevPlan['IDPESSOA'],
				     QryPartPrevPlan['IDPESSJUR'],situacao);
        erro := true;
       end
       else
        QryDados['V27'] := inttostr(QryAux['V27']);
      end;
     end
     else begin
      Gravaerro(descricao,'S',dtavaliacao,'Código da situação do benefício está em branco',
                             QryPartPrevPlan['IDPESSOA'],
                             QryPartPrevPlan['IDPESSJUR'],situacao);
      erro := true;
     end;
    end;
   end     // relativo aos assistidos
   else begin
    QryDados['V21'] := '';
    QryDados['V22'] := '';
    QryDados['V23'] := '';
    QryDados['V24'] := '0';
    QryDados['V25'] := '0';
    QryDados['V26'] := '0';
    QryDados['V27'] := '0';
   end;

    QryDados['V28'] := '0';

    QryDados['V29'] := '0';

// CONTRIBUICAO DO PARTICIPANTE
    with QryAux do begin
     close;
     sql.clear;
     sql.add('SELECT VALORRECEBIDO  AS V30 ');
     sql.add('FROM '+sistema.PrefixoServidor+'HSTCONTRIBPREV WHERE ');
     sql.add('IDCONTRIBUICAO = 1 AND ');  // CONTRIBUICAO NORMAL
     sql.add('IDPESSOA = :PARAM0 AND ');
     sql.add('MESREFERENCIA = :PARAM1 ');
     params[0].asinteger := QryPartPrevPlan['IDPESSOA'];
     params[1].asstring  := dtavaliacao;
     try
      open;
     except begin
      showmessage('Problemas na Tabela de Histórico de Contribuição : HSTCONTRIBPREV');
      ParticPlanoRefer := false;
     end;
     end;
    end;
    if QryAux['V30'] <> null then begin        // CONTRIBUICAO DO PARTICIPANTE
      if ((situacao = 2) or (situacao = 5)) then begin
	Gravaerro(descricao,'S',dtavaliacao,'Contribuição REFER com valor, em situação indevida ',
			       QryPartPrevPlan['IDPESSOA'],
			       QryPartPrevPlan['IDPESSJUR'],situacao);
	erro := true;
      end;
      if ((beneficio = 37) or (beneficio = 38) or (beneficio = 40) or
	  (beneficio = 41) or (beneficio = 46) or (beneficio = 48) or
	  (beneficio = 51) or (beneficio = 52) or (beneficio = 50) or
	  (beneficio = 53)) and (QryAux['V30'] <> 0)  then begin
	Gravaerro(descricao,'S',dtavaliacao,'Contribuição REFER com valor, em beneficio indevido : '+nomebeneficio,
			       QryPartPrevPlan['IDPESSOA'],
			       QryPartPrevPlan['IDPESSJUR'],situacao);
	erro := true;
      end;

      QryDados['V30'] := FrmGrupoHipotese.TrocaVirgulaPonto(floattostr(QryPartprevplan['V30']))
    end
    else begin
      if ((beneficio = 37) or (beneficio = 38) or (beneficio = 40) or
	  (beneficio = 41) or (beneficio = 46) or (beneficio = 48) or
	  (beneficio = 51) or (beneficio = 52) or (beneficio = 50) or
	  (beneficio = 53)) or ((situacao = 2) or (situacao = 5)) then begin
	   QryDados['V30'] := '0';
      end
      else begin
       Gravaerro(descricao,'S',dtavaliacao,'Contribuição REFER em branco',
			     QryPartPrevPlan['IDPESSOA'],
			     QryPartPrevPlan['IDPESSJUR'],situacao);
       erro := true;
      end;
    end;

// JOIA DO PARTICIPANTE
    with QryAux do begin
     close;
     sql.clear;
     sql.add('SELECT A.VALORRECEBIDO  AS V31, B.VALORBASE1 ');
     sql.add('FROM '+sistema.PrefixoServidor+'HSTCONTRIBPREV A, CONTRIBPREVPARTP B WHERE ');
     sql.add('A.IDCONTRIBUICAO = 2 AND ');  // JOIA
     sql.add('A.IDPESSOA = :PARAM0 AND ');
     sql.add('A.IDPESSOA = B.IDPESSOA AND ');
     sql.add('MESREFERENCIA = :PARAM1 ');
     params[0].asinteger := QryPartPrevPlan['IDPESSOA'];
     params[1].asstring  := dtavaliacao;
     try
      open;
     except begin
      showmessage('Problemas na Tabela de Histórico de Joia : HSTCONTRIBPREV');
      ParticPlanoRefer := false;
     end;
     end;
    end;

    if QryAux['V31'] <> null then
     JOIA := FLOATTOSTR(QryAux['V31'] );

    if QryAux['V31'] <> null then begin      // joia
      if ((situacao = 2) or (situacao = 5)) then begin
        Gravaerro(descricao,'S',dtavaliacao,'Jóia REFER com valor, em situação indevida ',
                               QryPartPrevPlan['IDPESSOA'],
                               QryPartPrevPlan['IDPESSJUR'],situacao);
        erro := true;
      end;
      if ((beneficio = 37) or (beneficio = 38) or (beneficio = 40) or
          (beneficio = 41) or (beneficio = 46) or (beneficio = 48) or
          (beneficio = 51) or (beneficio = 52) or (beneficio = 50) or
          (beneficio = 53)) and (QryAux['V31'] <> 0)  then begin
        Gravaerro(descricao,'S',dtavaliacao,'Jóia REFER com valor, em beneficio indevido : '+nomebeneficio,
                               QryPartPrevPlan['IDPESSOA'],
                               QryPartPrevPlan['IDPESSJUR'],situacao);
	erro := true;
      end;
      if (QryAux['VALORBASE1'] <> 0) and (QryAux['V31'] = 0) then begin
       Gravaerro(descricao,'S',dtavaliacao,'Jóia REFER zerada com percentual',
                               QryPartPrevPlan['IDPESSOA'],
                               QryPartPrevPlan['IDPESSJUR'],situacao);
       erro := true;
      end;
      if (QryAux['VALORBASE1'] = 0) and (QryAux['V31'] <> 0) then begin
       Gravaerro(descricao,'S',dtavaliacao,'Jóia REFER com valor e percentual zerado',
			       QryPartPrevPlan['IDPESSOA'],
			       QryPartPrevPlan['IDPESSJUR'],situacao);
       erro := true;
      end;

      QryDados['V31'] := FrmGrupoHipotese.TrocaVirgulaPonto(floattostr(QryAux['V31']));

    end
    else begin
      if ((beneficio = 37) or (beneficio = 38) or (beneficio = 40) or
	  (beneficio = 41) or (beneficio = 46) or (beneficio = 48) or
	  (beneficio = 51) or (beneficio = 52) or (beneficio = 50) or
	  (beneficio = 53)) or ((situacao = 2) or (situacao = 5)) then begin
	   QryDados['V31'] := '0';
      end
      else begin
       if (QryAux['VALORBASE1'] = 0) or (QryAux['VALORBASE1'] = null)  then
	   QryDados['V31'] := '0'
       else begin
	Gravaerro(descricao,'S',dtavaliacao,'Jóia REFER em branco',
			       QryPartPrevPlan['IDPESSOA'],
			       QryPartPrevPlan['IDPESSJUR'],situacao);
	erro := true;
       end;
      end;
    end;

// CONTRIBUICAO DA PATROCINADORA
    QryDados['V32'] := '0';

    if QryPartprevplan['V33'] <> null then        // RESERVA DE POUPANÇA
      QryDados['V33'] := FrmGrupoHipotese.TrocaVirgulaPonto(floattostr(QryPartprevplan['V33']))
    else begin
      if situacao = 5 then  //RP PAGA
       QryDados['V33'] := '0'
      else begin
       Gravaerro(descricao,'S',dtavaliacao,'Reserva de Poupança em branco',
			      QryPartPrevPlan['IDPESSOA'],
			      QryPartPrevPlan['IDPESSJUR'],situacao);
       erro := true;
      end;
    end;

   // CRIAR A BUSCA DA DATA DE SITUACAO ANTERIOR

   // BATIMENTO DE DATAS E IDADES
   // IDADE ATUAL
   if QryDados['V11'] <> null then begin  // DATA DE NASCIMENTO
    decodedate(strtodate(QryDados['V11']),ano,mes,dia);
    idadeatual := trunc(((anoref - ano) * 12 + (mesref - mes))/12);
    if (idadeatual < 14) or (idadeatual > 65) then begin
      Gravaerro(descricao,'S',dtavaliacao,'Idade atual : '+inttostr(idadeatual)+' anos',
			     QryPartPrevPlan['IDPESSOA'],
			     QryPartPrevPlan['IDPESSJUR'],situacao);
      erro := true;
    end;
   end;

   if (QryDados['V1'] <> null) and (QryDados['V11'] <> null) then begin
    //DATA DE INSCRICAO E NASCIMENTO
    decodedate(strtodate(QryDados['V11']),ano,mes,dia);
    decodedate(strtodate(QryDados['V1']) ,anoI,mesI,diaI);
    idadeinscricao := trunc(((anoI - ano) * 12 + (mesI - mes))/12);
    if (idadeatual < 14) or (idadeatual > 55) then begin
      Gravaerro(descricao,'S',dtavaliacao,'Idade na inscrição : '+inttostr(idadeinscricao)+' anos',
                             QryPartPrevPlan['IDPESSOA'],
			     QryPartPrevPlan['IDPESSJUR'],situacao);
      erro := true;
    end;
   end;

   if (QryDados['V1'] <> null) and (QryDados['V10'] <> null) then begin
    // DATA DE INSCRICAO E DE ADMISSAO
    if strtodate(QryDados['V10']) > strtodate(QryDados['V1']) then begin
      Gravaerro(descricao,'S',dtavaliacao,'Data de inscrição menor que a data de admissão',
                             QryPartPrevPlan['IDPESSOA'],
                             QryPartPrevPlan['IDPESSJUR'],situacao);
      erro := true;
    end;
   end;

   if (QryDados['V10'] <> null) and (QryDados['V11'] <> null) then begin
    // DATA DE ADMISSAO E NASCIMENTO
    if strtodate(QryDados['V10']) < strtodate(QryDados['V11']) then begin
      Gravaerro(descricao,'S',dtavaliacao,'Data de nascimento maior que data de admissão',
                             QryPartPrevPlan['IDPESSOA'],
                             QryPartPrevPlan['IDPESSJUR'],situacao);
      erro := true;
    end;
   end;

   // RELATIVO A DATA DA SITUAÇÃO NA FUNDAÇÃO
   DatasitFundacao := strtodate('01/01/1901'); // DATA PARAMETRO INICIAL
   with QryAux do begin
     close;
     sql.clear;
     sql.add('SELECT MAX(DATAEVENTO)  AS DATASITFUND ');
     sql.add('FROM '+sistema.PrefixoServidor+'EVENTOSPREV  WHERE ');
     sql.add('FLGSITPARTIMED = 1 AND ');  // RESERVA DE POUPANÇA
     sql.add('IDPESSOA = :PARAM0 ');
     params[0].asinteger := QryPartPrevPlan['IDPESSOA'];
     try
      open;
     except begin
      showmessage('Problemas na Tabela de EVENTOS PREVIDENCIÁRIOS : EVENTOSPREV');
      ParticPlanoRefer := false;
     end;
     end;
     if QryAux.EOF then
       DatasitFundacao := strtodate(QryDados['V1'])
       // ASSUMIR QUE SE NÃO TIVER NENHUM EVENTO EM EVENTOSPREV A DATA DA SITUAÇÃO
       // É A PRÓPRIA DATA DE INSCRIÇÃO
     else begin
       if QryAux['DATASITFUND'] <> null then
        DatasitFundacao := QryAux['DATASITFUND']
       else begin
	Gravaerro(descricao,'S',dtavaliacao,'Histórico : Data de situação na REFER em branco',
                               QryPartPrevPlan['IDPESSOA'],
                               QryPartPrevPlan['IDPESSJUR'],situacao);
        erro := true;
       end;
     end;
   end;

   if (QryDados['V11'] <> null) and (DatasitFundacao <> null) and (DatasitFundacao <> strtodate('01/01/1901')) then begin
    // DATA DE NASCIMENTO E SITUACAO NA FUNDACAO
    if strtodate(QryDados['V11']) > DatasitFundacao then begin
      Gravaerro(descricao,'S',dtavaliacao,'Data de nascimento maior que data de situação na REFER',
			     QryPartPrevPlan['IDPESSOA'],
			     QryPartPrevPlan['IDPESSJUR'],situacao);
      erro := true;
    end;
   end;

   if (QryDados['V10'] <> null) and (DatasitFundacao <> null) and (DatasitFundacao <> strtodate('01/01/1901')) then begin
    // DATA DE ADMISSAO E SITUACAO NA FUNDACAO
    if strtodate(QryDados['V10']) > DatasitFundacao then begin
      Gravaerro(descricao,'S',dtavaliacao,'Data de admissão maior que data de situação na REFER',
			     QryPartPrevPlan['IDPESSOA'],
			     QryPartPrevPlan['IDPESSJUR'],situacao);
      erro := true;
    end;
   end;

   if (QryDados['V1'] <> null) and (DatasitFundacao <> null) and (DatasitFundacao <> strtodate('01/01/1901')) then begin
    // DATA DE INSCRICAO E SITUACAO NA FUNDACAO
    if strtodate(QryDados['V1']) > DatasitFundacao then begin
      Gravaerro(descricao,'S',dtavaliacao,'Data de inscrição maior que data de situação na REFER',
			     QryPartPrevPlan['IDPESSOA'],
			     QryPartPrevPlan['IDPESSJUR'],situacao);
      erro := true;
    end;
   end;


   // RELATIVO A DATA DA SITUAÇÃO NA EMPRESA
   DatasitEmpresa := strtodate('01/01/1901'); // DATA PARAMETRO INICIAL
   with QryAux do begin
     close;
     sql.clear;
     sql.add('SELECT MAX(DATAEVENTO)  AS DATASITEMP ');
     sql.add('FROM '+sistema.PrefixoServidor+'EVENTOSPREV  WHERE ');
     sql.add('FLGSITFUNCIMED = 1 AND ');  // RESERVA DE POUPANÇA
     sql.add('IDPESSOA = :PARAM0 ');
     params[0].asinteger := QryPartPrevPlan['IDPESSOA'];
     try
      open;
     except begin
      showmessage('Problemas na Tabela de EVENTOS PREVIDENCIÁRIOS : EVENTOSPREV');
      ParticPlanoRefer := false;
     end;
     end;
     if QryAux.EOF then
       DatasitEmpresa := strtodate(QryDados['V10'])
       // ASSUMIR QUE SE NÃO TIVER NENHUM EVENTO EM EVENTOSPREV A DATA DA SITUAÇÃO
       // É A PRÓPRIA DATA DE ADMISSÃO
     else begin
       if QryAux['DATASITEMP'] <> null then
	DatasitEmpresa := QryAux['DATASITEMP']
       else begin
	Gravaerro(descricao,'S',dtavaliacao,'Histórico : Data de situação na Empresa em branco',
                               QryPartPrevPlan['IDPESSOA'],
                               QryPartPrevPlan['IDPESSJUR'],situacao);
        erro := true;
       end;
     end
   end;

   if (QryDados['V11'] <> null) and (DatasitEmpresa <> null) and (DatasitEmpresa <> strtodate('01/01/1901')) then begin
    // DATA DE NASCIMENTO E SITUACAO NA EMPRESA
    if strtodate(QryDados['V11']) > DatasitEmpresa then begin
      Gravaerro(descricao,'S',dtavaliacao,'Data de nascimento maior que data de situação na Empresa',
                             QryPartPrevPlan['IDPESSOA'],
                             QryPartPrevPlan['IDPESSJUR'],situacao);
      erro := true;
    end;
   end;

   if (QryDados['V10'] <> null) and (DatasitEmpresa <> null)and (DatasitEmpresa <> strtodate('01/01/1901')) then begin
    // DATA DE ADMISSAO E SITUACAO NA EMPRESA
    if strtodate(QryDados['V10']) > DatasitEmpresa then begin
      Gravaerro(descricao,'S',dtavaliacao,'Data de admissão maior que data de situação na Empresa',
			     QryPartPrevPlan['IDPESSOA'],
			     QryPartPrevPlan['IDPESSJUR'],situacao);
      erro := true;
    end;
   end;

   if (QryDados['V1'] <> null) and (DatasitEmpresa <> null) and (DatasitEmpresa <> strtodate('01/01/1901')) then begin
    // DATA DE INSCRICAO E SITUACAO NA EMPRESA
    if strtodate(QryDados['V1']) > DatasitEmpresa then begin
      Gravaerro(descricao,'S',dtavaliacao,'Data de inscrição maior que data de situação na REFER',
                             QryPartPrevPlan['IDPESSOA'],
                             QryPartPrevPlan['IDPESSJUR'],situacao);
      erro := true;
    end;
   end;

   // CRITICA SOBRE O SALARIO MINIMO
   mesano := copy(dtavaliacao,5,2)+copy(dtavaliacao,1,4);
   with QryAux do begin
     close;
     sql.clear;
     sql.add('SELECT COTVALOR  AS SALMIN ');
     sql.add('FROM '+sistema.PrefixoServidor+'COTACAOMOEDA WHERE ');
     sql.add('MOECODIGO = 10 AND ');  // SALARIO MINIMO
     sql.add('COTMESREF = :PARAM0 ');
     params[0].asstring := mesano;
     try
      open;
     except begin
      showmessage('Problemas na Tabela de Salário Mínimo : COTACAOMOEDA');
      ParticPlanoRefer := false;
     end;
     end;
     if QryAux.EOF then begin
       showmessage('Salário Mínimo não encontrado para a data : ' + mesano);
       ParticPlanoRefer := false;
     end
     else begin
      salmin := QryAux['SALMIN'];
      if (salmin > salario) and (salario > 0) then begin  // SALARIO DE PARTICIPACAO
       Gravaerro(descricao,'S',dtavaliacao,'Salário mínimo maior que salário de participação',
                             QryPartPrevPlan['IDPESSOA'],
                             QryPartPrevPlan['IDPESSJUR'],situacao);
       erro := true;
      end;
      if salario > 60 * salmin  then begin  // SALARIO DE PARTICIPACAO
       Gravaerro(descricao,'S',dtavaliacao,'Salário de participação > 60 sa~lários mínimos',
                             QryPartPrevPlan['IDPESSOA'],
                             QryPartPrevPlan['IDPESSJUR'],situacao);
       erro := true;
      end;

     end;
   end;

   // GRAVA NA TABELA DE DADOS TBVALPART
   if not erro then begin
    QryDados.post;
    inc(gravados);
   end
   else begin
    inc(naogravados);
    QryDados.Delete;
   end;
   // Atenção : Observar a ordem dos campos lidos do TBCAMPOPART
   // a gravação DOS DADOS terá que ocorrer na mesma order em que foram gravados
   // na tabela TBCAMPOPART (V1,V2 ...)
   // OS CAMPOS QryDados['Vn'] = xsss, serão montados direto no código
   // SE ERRAR A ORDEM, CAUSARÁ ERRO NA LEITURA DOS DADOS POSTERIORMENTE
   QryPartprevplan.next;
   inc(pos);
   PrgBar1.Position:= pos;
  end;

 end;
 taberros.close;
 ParticPlanoRefer := true;
 showmessage('Total de registros lidos : '+inttostr(registro)+#10+#13+
             'Total de registros gravados : '+inttostr(gravados)+#10+#13+
             'Total de registros não gravados : '+inttostr(naogravados)+#10+#13);

end;


function TfrmCriaTabs.ParticPlanoMetro(descricao,dtavaliacao : string) : boolean;
var
registro,pos,i,j,code : integer;
wvalor : string;
valor : real;
begin
 with QryPartprevplan do begin
  close;
  sql.clear;
  sql.add('SELECT IDPESSJUR ,IDPESSOA,IDPLANOPREV,IDSITPART,IDSITPLANOPREV,SALPARTICIPACAO,');
  sql.add('SALVINCULADO,SALMANTIDO,DTINICIOINSC AS DATAINSC, DATAINICIOMANUT,');
  sql.add('DATACANCELAMENTO,DATAINICIOASSIST FROM '+sistema.PrefixoServidor+'PARTPREVPLAN ');
  sql.add('WHERE IDPLANOPREV = :PLANO ORDER BY IDPESSOA');
  params[0].asinteger := 14; 
  try
   open;
  except begin
   showmessage('Problemas na tabela de participantes do plano - PARTPREVPLAN');
   ParticPlanoMetro := false;
  end;
  end;

  first;
  PrgBar1.Max   := QryPartPrevPlan.recordcount ;
  pos := 0;
  registro := 0;
  while not(QryPartprevplan.EOF) do begin
   inc(registro);

   qryDados.append;
   QryDados['idtabela'] := qrydetalhe['idtabela'];
   // CAMPOS DA TABELA PARTPREVPLAN
   if QryPartPrevPlan['DATAINSC'] <> null then
    QryDados['V1'] :=  datetostr(QryPartPrevPlan['DATAINSC'])
   else begin
    QryDados['V1'] := '';
    showmessage('Erro no registro ' +INTTOSTR(QryPartPrevPlan['IDPESSOA']));
    showmessage('Atenção : Data de inscrição inválida');
    ParticPlanoMetro := false;
   end;

   if (QryPartPrevPlan['IDPESSOA'] = null) or (QryPartPrevPlan['IDPESSJUR'] = null) or
      (QryPartPrevPlan['IDPLANOPREV'] = null) or (QryPartPrevPlan['IDSITPLANOPREV'] = null) or
      (QryPartPrevPlan['IDSITPART'] = null)  then begin
      showmessage('Erro no registro ' +INTTOSTR(QryPartPrevPlan['IDPESSOA']));
      showmessage('Atenção : Identificador de pessoa, plano, empresa, situação com erro');
      ParticPlanoMetro := false;
   end;
   QryDados['V2'] := inttostr(QryPartPrevPlan['IDPESSOA']);
   QryDados['V3'] := inttostr(QryPartPrevPlan['IDPESSJUR']);
   QryDados['V4'] := inttostr(QryPartPrevPlan['IDPLANOPREV']);

   if (QryPartPrevPlan['IDSITPLANOPREV'] = 6) or
      (QryPartPrevPlan['IDSITPLANOPREV'] = 7) or
      (QryPartPrevPlan['IDSITPLANOPREV'] = 10) then begin
      // MANTIDO TOTAL ou PARCIAL ou PID/PIA
      wvalor := FrmGrupoHipotese.TrocaVirgulaPonto(Trim(QryPartPrevPlan['SALMANTIDO']));
      val(wvalor,valor,code);
      if code <> 0 then begin
       showmessage('Erro no registro ' +INTTOSTR(QryPartPrevPlan['IDPESSOA']));
       showmessage('Erro : salário mantido não numérico');
       ParticPlanoMetro := false;
      end;
      if QryPartPrevPlan['SALMANTIDO'] = 0 then begin
        showmessage('Erro no registro ' +INTTOSTR(QryPartPrevPlan['IDPESSOA']));
        showmessage('Erro : salário de mantido está zerado');
        ParticPlanoMetro := false;
      end;
      QryDados['V5'] := FrmGrupoHipotese.TrocaVirgulaPonto(floattostr(QryPartPrevPlan['SALMANTIDO']));
   end
   else begin
    if (QryPartPrevPlan['IDSITPLANOPREV'] = 9) then begin
     showmessage('Erro no registro ' +INTTOSTR(QryPartPrevPlan['IDPESSOA']));
     showmessage('Erro : participante ativo vinculado Metro no plano REFER');
     ParticPlanoMetro := false;
    end
    else begin
     if (QryPartPrevPlan['IDSITPLANOPREV'] = 4) then begin
      showmessage('Erro no registro ' +INTTOSTR(QryPartPrevPlan['IDPESSOA']));
      showmessage('Erro : participante com situação ignorada');
      ParticPlanoMetro := false;
     end
     else begin
    //  PARTICIPANTES SITUAÇÃO : 1 NORMAL,2 DESLIGADO,3 EM ATRASO, 5 DESLIGADO COM RESERVA PAGA
    //  8 ASSISTIDO
     wvalor := FrmGrupoHipotese.TrocaVirgulaPonto(Trim(QryPartPrevPlan['SALPARTICIPACAO']));
     val(wvalor,valor,code);
      if code <> 0 then begin
       showmessage('Erro no registro ' +INTTOSTR(QryPartPrevPlan['IDPESSOA']));
       showmessage('Erro : salário participação não numérico');
       ParticPlanoMetro := false;
      end;
     QryDados['V5'] := FrmGrupoHipotese.TrocaVirgulaPonto(floattostr(QryPartPrevPlan['SALPARTICIPACAO']));
     end;
    end;
   end;

   QryDados['V6'] := inttostr(QryPartPrevPlan['IDSITPLANOPREV']);
   QryDados['V7'] := inttostr(QryPartPrevPlan['IDSITPART']);

   if QryPartPrevPlan['DATAINICIOMANUT'] <> null then  // DATA INICIO DE MANUTENÇÃO
    QryDados['V8'] :=  datetostr(QryPartPrevPlan['DATAINICIOMANUT'])
   else begin
    if (QryPartPrevPlan['IDSITPLANOPREV'] = 6) or
       (QryPartPrevPlan['IDSITPLANOPREV'] = 7) or
       (QryPartPrevPlan['IDSITPLANOPREV'] = 10) then begin
       showmessage('Erro no registro ' +INTTOSTR(QryPartPrevPlan['IDPESSOA']));
       showmessage('Erro : Mantido com data início de manutenção zerada');
       ParticPlanoMetro := false;
    end
    else
     QryDados['V8'] := '';
   end;

   if QryPartPrevPlan['DATACANCELAMENTO'] <> null then // DATA DE CANCELAMENTO
    QryDados['V9'] :=  datetostr(QryPartPrevPlan['DATACANCELAMENTO'])
   else
    QryDados['V9'] := '';

   // CAMPOS DA TABELA PESSOAFISICA
   with QryAux do begin
    close;
    sql.clear;
    sql.add('SELECT TO_CHAR(DATAADMISSAO,'+'''DD/MM/YYYY'''+') AS V10, ');
    sql.add('TO_CHAR(DATANASC,'+'''DD/MM/YYYY'''+') AS V11, ESTCIVIL AS V12, ');
    sql.add('SEXO AS V13 ');
    sql.add('FROM '+sistema.PrefixoServidor+'PESSOAFISICA WHERE ');
    sql.add('IDPESSOA = :PARAM0 ');
    sql.add('ORDER BY IDPESSOA');
    params[0].asinteger := QryPartPrevPlan['IDPESSOA'];
    try
     open;
    except begin
     showmessage('Problemas na Tabela da Pessoa Física : PESSOAFISICA');
     ParticPlanoMetro := false;
    end;
    end;
    if QryAux['V10'] <> null then        // DATA DE ADMISSAO
     QryDados['V10'] := QryAux['V10']
    else begin
     showmessage('Erro no registro ' +INTTOSTR(QryPartPrevPlan['IDPESSOA']));
     showmessage('Erro : data de admissão zerada');
     ParticPlanoMetro := false;
    end;

    if QryAux['V11'] <> null then // DATA DE NASCIMENTO
     QryDados['V11'] := QryAux['V11']
    else begin
     showmessage('Erro no registro ' +INTTOSTR(QryPartPrevPlan['IDPESSOA']));
     showmessage('Erro : data de nascimento zerada');
     ParticPlanoMetro := false;
    end;

    if QryAux['V12'] <> null then        // ESTADO CIVIL
     QryDados['V12'] := QryAux['V12']
    else
     QryDados['V12'] := '';

    if QryAux['V13'] <> null then        // SEXO
     QryDados['V13'] := QryAux['V13']
    else begin
     showmessage('Erro no registro :'+inttostr(QryPartPrevPlan['IDPESSOA']));
     showmessage('Erro no código do SEXO do participante ');
     ParticPlanoMetro := false;
    end;
   end;

   // CAMPOS DA TABELA PESSOA
   with QryAux do begin
    close;
    sql.clear;
    sql.add('NUMDOCUMENTO AS V14 ');
    sql.add('FROM '+sistema.PrefixoServidor+'PESSOA WHERE ');
    sql.add('IDPESSOA = :PARAM0 ');
    sql.add('ORDER BY IDPESSOA');
    params[0].asinteger := QryPartPrevPlan['IDPESSOA'];
    try
     open;
    except begin
     showmessage('Problemas na Tabela da Pessoa : PESSOA');
     ParticPlanoMetro := false;
    end;
    end;
    if QryAux['V14'] <> null then        // CPF
     QryDados['V14'] := QryAux['V14']
    else begin
     showmessage('Erro no registro :'+inttostr(QryPartPrevPlan['IDPESSOA']));
     showmessage('Erro no CPF do participante ');
     ParticPlanoMetro := false;
    end;
   end;

   // CAMPOS DA TABELA ELEGPATRO
   with QryAux do begin
    close;
    sql.clear;
    sql.add('MATRICULA AS V15,IDSITFUNC AS V16,DATADEMISSAO AS V17,');
    sql.add('TEMPOSERVANTERIOR AS V18,SALTOTAL AS V19 ');
    sql.add('FROM '+sistema.PrefixoServidor+'ELEGPATRO WHERE ');
    sql.add('IDPESSOA = :PARAM0 ');
    sql.add('ORDER BY IDPESSOA');
    params[0].asinteger := QryPartPrevPlan['IDPESSOA'];
    try
     open;
    except begin
     showmessage('Problemas na Tabela da Elegibilidade da Pessoa : ELEGPATRO');
     ParticPlanoMetro := false;
    end;
    end;
    if QryAux['V15'] <> null then        // MATRICULA
     QryDados['V15'] := QryAux['V15']
    else begin
     showmessage('Erro no registro :'+inttostr(QryPartPrevPlan['IDPESSOA']));
     showmessage('Erro na MATRÍCULA do funcionário ');
     ParticPlanoMetro := false;
    end;
    if QryAux['V16'] <> null then        // SITUAÇÃO DO EMPREGADO
     QryDados['V16'] := inttostr(QryAux['V16'])
    else begin
     showmessage('Erro no registro :'+inttostr(QryPartPrevPlan['IDPESSOA']));
     showmessage('Erro na SITUAÇÃO do funcionário ');
     ParticPlanoMetro := false;
    end;
    if QryAux['V17'] <> null then        // DATA DE DEMISSÃO
     QryDados['V17'] := datetostr(QryAux['V17'])
    else begin
      if (QryPartPrevPlan['IDSITPLANOPREV'] =  2) or
         (QryPartPrevPlan['IDSITPLANOPREV'] =  5) or
         (QryPartPrevPlan['IDSITPLANOPREV'] =  6) or
         (QryPartPrevPlan['IDSITPLANOPREV'] = 10) or
         (QryPartPrevPlan['IDSITPLANOPREV'] =  8) then begin
         showmessage('Erro no registro :'+inttostr(QryPartPrevPlan['IDPESSOA']));
         showmessage('Erro : DATA DE DEMISSÃO em branco');
         ParticPlanoMetro := false;
      end
      else
       QryDados['V17'] := '';
    end;

    if QryAux['V18'] <> null then        // TEMPO DE SERVIÇO ANTERIOR
     QryDados['V18'] := inttostr(QryAux['V18'])
    else begin
     QryDados['V18'] := '0';
    end;

    if QryAux['V19'] <> null then        // SALÁRIO TOTAL
     QryDados['V19'] := FrmGrupoHipotese.TrocaVirgulaPonto(floattostr(QryAux['V19']))
    else begin
      showmessage('Erro no registro :'+inttostr(QryPartPrevPlan['IDPESSOA']));
      showmessage('Erro : Salário integral zerado');
      ParticPlanoMetro := false;
    end;
   end;

   if (QryPartPrevPlan['IDSITPLANOPREV'] =  8) then begin // ASSISTIDO
    with QryAux do begin
     close;
     sql.clear;
     sql.add('DATAINICIOINSS AS V21,DATAINICIO AS V22,DATAFINAL AS V23 ');
     sql.add('ULTVALORATUALREAJ AS V24, VLRCALCINSS AS V25 ');
     sql.add('IDBENEFICIO AS V26, IDSITBENEFICIO AS V27 ');
     sql.add('FROM '+sistema.PrefixoServidor+'BENEFBFCIARIO WHERE ');
     sql.add('IDPESSOA = :PARAM0 ');
     sql.add('ORDER BY IDPESSOA');
     params[0].asinteger := QryPartPrevPlan['IDPESSOA'];
     try
      open;
     except begin
      showmessage('Problemas na Tabela da Elegibilidade da Pessoa : ELEGPATRO');
      ParticPlanoMetro := false;
     end;
     end;
     if QryAux['V21'] <> null then        // DATA DA DIB INSS
      QryDados['V21'] := datetostr(QryAux['V21'])
     else begin
      showmessage('Erro no registro :'+inttostr(QryPartPrevPlan['IDPESSOA']));
      showmessage('Erro : DATA DA DIB INSS em branco');
      ParticPlanoMetro := false;
     end;
     if QryAux['V22'] <> null then        // DATA DA DIB 
      QryDados['V22'] := datetostr(QryAux['V22'])
     else begin
      showmessage('Erro no registro :'+inttostr(QryPartPrevPlan['IDPESSOA']));
      showmessage('Erro : DATA DA DIB REFER em branco');
      ParticPlanoMetro := false;
     end;
     if QryAux['V23'] <> null then        // DATA FIM DE BENEFICIO 
      QryDados['V23'] := datetostr(QryAux['V23'])
     else begin
      showmessage('Erro no registro :'+inttostr(QryPartPrevPlan['IDPESSOA']));
      showmessage('Erro : DATA DA DIB REFER em branco');
      ParticPlanoMetro := false;
     end;
     if QryAux['V24'] <> null then        // BENEFICIO 
      QryDados['V24'] := FrmGrupoHipotese.TrocaVirgulaPonto(floattostr(QryAux['V24']))
     else begin
      showmessage('Erro no registro :'+inttostr(QryPartPrevPlan['IDPESSOA']));
      showmessage('Erro : Benefício REFER zerado');
      ParticPlanoMetro := false;
     end;
     if QryAux['V25'] <> null then        // BENEFICIO INSS
      QryDados['V25'] := FrmGrupoHipotese.TrocaVirgulaPonto(floattostr(QryAux['V25']))
     else begin
      showmessage('Erro no registro :'+inttostr(QryPartPrevPlan['IDPESSOA']));
      showmessage('Erro : Benefício INSS zerado');
      ParticPlanoMetro := false;
     end;
     if QryAux['V26'] <> null then        // TIPO DE BENEFICIO
      QryDados['V26'] := inttostr(QryAux['V26'])
     else begin
      showmessage('Erro no registro :'+inttostr(QryPartPrevPlan['IDPESSOA']));
      showmessage('Erro : código do tipo de benefício está zerado');
      ParticPlanoMetro := false;
     end;
     if QryAux['V27'] <> null then        // SITUACAO DO BENEFICIO
      QryDados['V27'] := inttostr(QryAux['V27'])
     else begin
      showmessage('Erro no registro :'+inttostr(QryPartPrevPlan['IDPESSOA']));
      showmessage('Erro : código da situação do benefício está zerado');
      ParticPlanoMetro := false;
     end;
    end;
   end;     // relativo aos assistidos


   // GRAVA NA TABELA DE DADOS TBVALPART
   QryDados.post;
   // Atenção : Observar a ordem dos campos lidos do TBCAMPOPART
   // a gravação DOS DADOS terá que ocorrer na mesma order em que foram gravados
   // na tabela TBCAMPOPART (V1,V2 ...)
   // OS CAMPOS QryDados['Vn'] = xsss, serão montados direto no código
   // SE ERRAR A ORDEM, CAUSARÁ ERRO NA LEITURA DOS DADOS POSTERIORMENTE
   QryPartprevplan.next;
   inc(pos);
   PrgBar1.Position:= pos;
  end;

 end;
 ParticPlanoMetro := true;

end;

procedure TfrmCriaTabs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryCampos.close;
  QryDetalhe.close;
  Qrydados.close;
  Qrycmpbd.close;
  Qryaux.close;
 end;

procedure TfrmCriaTabs.FormShow(Sender: TObject);
begin
  inherited;
  painelescolha.visible :=False;
  BtAlt.visible    :=False;
  BtExcl.visible   :=False;
  BtMostra.visible := False;
  Panel2.Visible:=false;
  PnlDetalhe.Visible:=false;
  qrydetalhe.open;
  With QryGrupo do begin
   close;
   sql.Clear;
   sql.Add('SELECT CODGRUPOARQUIVO,DESCGRUPOARQUIVO FROM '+sistema.PrefixoServidor+'GRPARQUIVO ');
   sql.Add('WHERE SETORGRUPOS = :GRUPO ORDER BY DESCGRUPOARQUIVO');
   params[0].asstring := 'ASSDES';
   try
    open;
   except
    showmessage('Tabela de tipos de planos com problema');
    exit;
   end;
   if eof then begin
    showmessage('Não existe nenhum plano cadastrado');
    exit;
   end;
  end;

end;

procedure TfrmCriaTabs.PnlDetalheClick(Sender: TObject);
 Var
  wNumLinha:String;
begin
  inherited;
end;

procedure TfrmCriaTabs.btAltClick(Sender: TObject);
begin
  inherited;
// Se Nao Houverem Registros de Detalhe, Sai
  If qryDetalhe.RecordCount=0 then begin
    BtAlt.Down    :=False;
    Exit;
  End;

  TbshDetalhe.Caption := 'Informações da Tabela a ser Alterada';

// Habilita botão cancelar
  bbtncancelardet.visible := true;
  BtIns.visible  :=False;
  BtExcl.visible :=False;
  BtMostra.visible := False;

// Esconde Grid Mostra Painel
  PnlDetalhe.Visible:=True;
  Nome.SetFocus;

// Alterar Registro
  DBedit4.ReadOnly := true;
  QryDetalhe.Edit;
end;

procedure TfrmCriaTabs.BtExclClick(Sender: TObject);
Var
  wNumLinha:Integer;
begin
if qryDetalhe.RecordCount=0 then begin
  BtExcl.Down    :=False;
  Exit;
End;
  TbshDetalhe.Caption := 'Informações da Tabela a ser Deletada';

// Inabilita Botoes de Detalhe
  BtIns.visible    :=False;
  BtAlt.visible    :=False;
  BtMostra.visible := False;

// Esconde Grid Mostra Painel
  PnlDetalhe.Visible:=True;
  Nome.SetFocus;
end;

procedure TfrmCriaTabs.BtInsClick(Sender: TObject);
Var
  J : integer;
begin
  inherited;
   painelescolha.visible    :=True;
   if qrygrupo['DESCGRUPOARQUIVO'] = null then begin
    showmessage('Não foi criado tipo de massa de participantes');
    exit;
   end;
   plano.caption := ' ';

  tbshDetalhe.Caption := 'Informações da Tabela Criada';

// Habilita botão cancelar
  bbtncancelardet.visible := true;

// Inabilita Botoes de Detalhe
  BtAlt.visible    :=False;
  BtExcl.visible   :=False;
  BtMostra.visible := False;
  QryDetalhe.Append;
  QryGrupo.First;
  qrydetalhe['DATACRIACAO'] := date;
  With QryAux Do Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT MAX(IDTABELA) AS IDATUAL FROM '+sistema.PrefixoServidor+'TBPARTICIP');
    Open;
  End;
  if QryAux.eof then
    j:= 1
  else
    j := QryAux.FieldByName('IDATUAL').AsInteger+1;
  QryDetalhe['IDTABELA'] := J;

// Mostra Painel
  PnlDetalhe.Visible:=True;
  Nome.SetFocus;
end;

procedure TfrmCriaTabs.bbtnOkDetClick(Sender: TObject);
var
reg,pos,campo,i : integer;
Grupodedados,pesquisa : string;
begin
inherited;
// Caso Campos Obrigatórios Não Preen....
  If (QryDetalhe.FieldByName('AVALIACAO').AsString='') Or
     (QryDetalhe.FieldByName('DESCRICAO').AsString='') Then Begin
    ShowMessage('Campos Obrigátorios não Preencidos !!!');
    Exit;
  End;
  // se foi só para mostrar recupera a propriedade de edição dos campos e sai
  if BtMostra.Down then begin
   nome.readonly := false;
   dtavaliacao.readonly := false;
   BarraEstado.visible := false;
   bbtnokdet.Caption := '&Confirma';
  end
  else begin
   // caso de inclusão de nova tabela : inclusão de dados em 3 tabelas
   If BtIns.Down=True Then Begin
    FazQuery(QryAux,'SELECT DESCRICAO FROM '+sistema.PrefixoServidor+'TBPARTICIP WHERE DESCRICAO = '''+
	     QryDetalhe.FieldByName('DESCRICAO').AsString+'''');
    // Caso Já Existe da Erro
    If Not QryAux.IsEmpty Then Begin
      ShowMessage('Descrição de tabela  já existe .....');
      // Sob os Botoes
      BtIns.Down    := false;
      BtAlt.Down    := false;
      BtExcl.Down    := false;
      BtMostra.Down    := false;
      // Habilita Botoes de Detalhe
      BtAlt.visible    :=true;
      BtExcl.visible   :=true;
      BtIns.visible    :=true;
      BtMostra.visible := true;
      Nome.SetFocus;
      Exit;
    End;

// a idéia é só deixar alterar o nome da descrição da tabela
// e a data da avaliacao  dentro
// do arquivo TBPARTICIP. As outras tabelas permanescem
// com seus dados originados na criação

  // primeiro grava na tabela TBPARTIC -> 1 registro-mãe

  QryDetalhe.Post;

  with qrycampos do begin
   close;
   sql.clear;
   sql.add('SELECT * FROM '+sistema.PrefixoServidor+'TBCAMPOPART');
   sql.add('WHERE IDTABELA = :IDTABELA');
   params[0].asinteger := QryDetalhe['idtabela'];
   try
    open;
   except
   begin
    showmessage('Problemas na tabela de campos dos participantes');
    exit;
   end;
   end;
  end;


  if QryGrupo['CODGRUPOARQUIVO'] = 'ADPREF' then begin // PARTICIPANTES PLANO REFER
   GravaTabCampo(qrydetalhe['IDTABELA'],'DATAINSC','Data de início de inscrição',3,'V1');
   GravaTabCampo(qrydetalhe['IDTABELA'],'IDPESSOA','Identificação do participante no sistema',1,'V2');
   GravaTabCampo(qrydetalhe['IDTABELA'],'IDPESSJUR','Código da patrocinadora',1,'V3');
   GravaTabCampo(qrydetalhe['IDTABELA'],'IDPLANOPREV','Identifição do plano previdenciário',1,'V4');
   GravaTabCampo(qrydetalhe['IDTABELA'],'SALPARTIC','Salário de participação',1,'V5');
   GravaTabCampo(qrydetalhe['IDTABELA'],'SITPARDESC','Código da situação do participante',1,'V6');
   GravaTabCampo(qrydetalhe['IDTABELA'],'IDSITPART','Código da situação do participante no plano',1,'V7');
   GravaTabCampo(qrydetalhe['IDTABELA'],'DATAMANUT','Data de início de manutenção',3,'V8');
   GravaTabCampo(qrydetalhe['IDTABELA'],'DATACANCELA','Data de cancelamento',3,'V9');
   GravaTabCampo(qrydetalhe['IDTABELA'],'DATAADMISSAO','Data de admissão na patrocinadora',3,'V10');
   GravaTabCampo(qrydetalhe['IDTABELA'],'DATANASC','Data de nascimento do participante',3,'V11');
   GravaTabCampo(qrydetalhe['IDTABELA'],'ESTCIVIL','Estado civil',2,'V12');
   GravaTabCampo(qrydetalhe['IDTABELA'],'SEXO','Sexo',2,'V13');
   GravaTabCampo(qrydetalhe['IDTABELA'],'CPF','CPF do participante',2,'V14');
   GravaTabCampo(qrydetalhe['IDTABELA'],'MATRICULA','Matrícula do participante na fundação',1,'V15');
   GravaTabCampo(qrydetalhe['IDTABELA'],'IDSITFUNC','Código de situação na patrocinadora',1,'V16');
   GravaTabCampo(qrydetalhe['IDTABELA'],'DATADEMISSAO','Data de demissão na patrocinadora',3,'V17');
   GravaTabCampo(qrydetalhe['IDTABELA'],'TEMPOSERVANT','Tempo de serviço anterior a patrocinadora',1,'V18');
   GravaTabCampo(qrydetalhe['IDTABELA'],'SALTOTAL','Salário do participante na patrocinadora',1,'V19');
   GravaTabCampo(qrydetalhe['IDTABELA'],'IDGRUPO','Grupo da empresa patrocinadora',2,'V20');
   GravaTabCampo(qrydetalhe['IDTABELA'],'DIBINSS','Data de início de benefício pelo INSS',3,'V21');
   GravaTabCampo(qrydetalhe['IDTABELA'],'DIBREFER','Data de início de benefício pela REFER',3,'V22');
   GravaTabCampo(qrydetalhe['IDTABELA'],'DATAFIMBENE','Data fim de benefício',3,'V23');
   GravaTabCampo(qrydetalhe['IDTABELA'],'BENEREFER','Valor do benefício REFER',1,'V24');
   GravaTabCampo(qrydetalhe['IDTABELA'],'BENEINSS','Valor do benefício INSS',1,'V25');
   GravaTabCampo(qrydetalhe['IDTABELA'],'IDBENEFICIO','Código do tipo de benefício concedido',1,'V26');
   GravaTabCampo(qrydetalhe['IDTABELA'],'IDSITBENEF','Código da situação do benefício',1,'V27');
   GravaTabCampo(qrydetalhe['IDTABELA'],'SALPARLIM','Salário de participação sem limite',1,'V28');
   GravaTabCampo(qrydetalhe['IDTABELA'],'SALREALB','Salário Real de Benefício',1,'V29');
   GravaTabCampo(qrydetalhe['IDTABELA'],'CONTRIBD','Valor da contribuição do participante',1,'V30');
   GravaTabCampo(qrydetalhe['IDTABELA'],'JOIAD','Valor da jóia do participante',1,'V31');
   GravaTabCampo(qrydetalhe['IDTABELA'],'PCONTRIBD','Valor da contribuição da patrocinadora',1,'V32');
   GravaTabCampo(qrydetalhe['IDTABELA'],'RESERVAP','Reserva de poupança do participante',1,'V33');
  end; {ativos e assistidos}

  if QryGrupo['CODGRUPOARQUIVO'] = 'ADDREF' then begin // DEPENDENTES PLANO 
   GravaTabCampo(qrydetalhe['IDTABELA'],'DRMATTIT','Matrícula do participante titular',1,'V1');
   GravaTabCampo(qrydetalhe['IDTABELA'],'DRMATDEP','Matrícula do dependente',1,'V2');
   GravaTabCampo(qrydetalhe['IDTABELA'],'DRNASC','Data de nascimento do dependente',3,'V3');
   GravaTabCampo(qrydetalhe['IDTABELA'],'DRSEXO','Sexo do dependente',2,'V4');
   GravaTabCampo(qrydetalhe['IDTABELA'],'DRVINC','Código do vínculo do dependente com o participante',1,'V5');
   GravaTabCampo(qrydetalhe['IDTABELA'],'DRTIPO','Código do tipo de dependente',1,'V6');
   GravaTabCampo(qrydetalhe['IDTABELA'],'DRPATRO','Código da patrocinadora',1,'V7');
  end; {DEPENDENTES DO PLANO }

   label4.caption := 'Gravando as informações nas tabelas ' ;
   label4.update;
   BarraEstado.visible    := true;
  // por último : grava na tabela de dados
  with qrydados do begin
   close;
   sql.clear;
   sql.add('SELECT * FROM '+sistema.PrefixoServidor+'TBVALPART');
   sql.add('WHERE IDTABELA = :IDTABELA');
   params[0].asinteger := QryDetalhe['idtabela'];
   try
    open;
   except
   begin
    showmessage('Problema na tabela de dados dos participantes');
    exit;
   end;
   end;
  end;
  if qrydados.IsEmpty then begin
   //PARTE DE CARREGAR OS DADOS
   // GRUPOS SÃO PRÉ-ESTABELECIDOS PELO USUÁRIO NA CRIAÇÃO NO DICIONÁRIO DE DADOS
   Panel2.Visible:=True;
   label4.caption := 'Aguarde, gravando as informações';
   label4.update;
   if QryGrupo['CODGRUPOARQUIVO'] = 'ADPREF' then begin // PARTICIPANTES PLANO
    // CHAMA ROTINA MONTA DADOS PARTICIPANTES PLANO
      if not(ParticPlanoREFER(QryDetalhe.FieldbyName('descricao').asstring,
                              QryDetalhe.FieldbyName('avaliacao').asstring)) then begin
       Panel2.Visible:=false;
       showmessage('Problemas na gravação dos dados dos participantes : Plano REFER');
       //Deleta registros tabelas
       if not DeletarRegistros(qrydetalhe['IDTABELA']) then
        showmessage('Favor eliminar a atual tabela');
       exit;
      end;
   end
   else
    if QryGrupo['CODGRUPOARQUIVO'] = 'ADPMET' then begin // PARTICIPANTES PLANO 
      if not(ParticPlanoMetro(QryDetalhe.FieldbyName('descricao').asstring,
                              QryDetalhe.FieldbyName('avaliacao').asstring)) then begin
       Panel2.Visible:=false;
       showmessage('Problemas na gravação dos dados dos participantes : Plano Metrô');
       //Deleta registros tabelas
       if not DeletarRegistros(qrydetalhe['IDTABELA']) then
        showmessage('Favor eliminar a atual tabela');
       exit;
      end;
    end
    else
     if QryGrupo['CODGRUPOARQUIVO'] = 'ADDREF' then begin// DEPENDENTES PLANO
        if not(DependPlanoRefer(QryDetalhe.FieldbyName('descricao').asstring,
                              QryDetalhe.FieldbyName('avaliacao').asstring)) then begin
         Panel2.Visible:=false;
         showmessage('Problemas na gravação dos dados dos dependentes : Plano Metrô');
         //Deleta registros tabelas
         if not DeletarRegistros(qrydetalhe['IDTABELA']) then
          showmessage('Favor eliminar a atual tabela');
         exit;
        end;
     end
     else
      if QryGrupo['CODGRUPOARQUIVO'] = 'ADDMET' then // DEPENDENTES PLANO 
        // CHAMA ROTINA MONTA DADOS DEPENDENTES PLANO 
      else
      if QryGrupo['CODGRUPOARQUIVO'] = 'ADEREF' then // PATROCINADORAS PLANO 
        // CHAMA ROTINA MONTA DADOS PATROCINADORAS PLANO 
      else
       if QryGrupo['CODGRUPOARQUIVO'] = 'ADEMET' then // PATROCINADORAS PLANO 
	// CHAMA ROTINA MONTA DADOS PATROCINADORAS PLANO 
       else begin
        showmessage('Grupo selecionado não foi cadastrado no dicionário de dados');
        // colocar rotina para deletar os registros da TBCAMPOPART e da TBPARTICIP
        // referentes ao IDTABELA criado
        exit;
       end;
  end
  else begin
   showmessage('Código de tabela já existe, verifique.');
   exit;
  end;
//FIM PARTE CARREGAR OS DADOS

  // Esconde PgragressBar
  PrgBar1.Position :=0;
  Panel2.Visible   :=False;
  thousandseparator := '.';
  FazQuery(QryAux,'SELECT IDTABELA FROM '+sistema.PrefixoServidor+'TBVALPART '+
         'WHERE IDTABELA  = '+IntToStr(qrydetalhe['IDTABELA']));
  BarraEstado.SimpleText := Format('Criados %d registros em '+qrydetalhe['DESCRICAO'],
  [qryaux.RecordCount]);

  showmessage('Processo encerrado com exito');
  // atualiza query detalhe
  qrydetalhe.close;
  qrydetalhe.open;
  End  // se o botão de insere foi "apertado"
  else begin
  // altera registro
   if BtAlt.Down then begin
    // como os botões são mutuamente exclusivos

    qrydetalhe.post;
    showmessage('Registro alterado');
   end
   else begin

    // apaga registros relacionados a tabela criada : 3 tabelas
    // e a suas  seleções :  tabela TABFILTROSQL
    if BtExcl.Down then begin
     pesquisa := 'SELECT A.IDSIMULACAO,A.PUBLICADA,A.IDFILTRO FROM '+
               sistema.PrefixoServidor+'SIMULACOES A, '+
               sistema.PrefixoServidor+'TABFILTROSQL B, '+
               sistema.PrefixoServidor+'TBPARTICIP C '+
              'WHERE C.IDTABELA  = '+IntToStr(qrydetalhe['IDTABELA'])+' AND '+
              'C.IDTABELA = B.IDTABELA AND B.IDFILTRO = A.IDFILTRO';
     FazQuery(QryAux,pesquisa);
     if not QryAux.eof then begin
       showmessage('Este arquivo é usado pela simulação de número : '+inttostr(QryAux['IDSIMULACAO']));
       if QryAux['PUBLICADA'] = 'S' then begin
        showmessage('Este arquivo não pode ser excluído, pois é usado'+ #10+#13+ 'pela simulação PUBLICADA de número : '+inttostr(QryAux['IDSIMULACAO']));
        exit;
       end;
     end;

     If MessageBox(0,'Confirma deleção da tabela?','Mensagem do Sistema ',1) = IdOk Then Begin
      BarraEstado.SimpleText := 'O processo pode ser lento. Aguarde aviso do sistema';
      BarraEstado.visible := true;
      BarraEstado.Update;
      PrgBar1.Max := 60;
      panel2.visible := true;
      label4.caption := 'Deletando registros..';
      label4.update;
      PrgBar1.Position:= 10;
      // aponta para o registro selecionado
      reg := QryDetalhe['IDTABELA'];
      // APAGA PRIMEIRO, SE TIVER OS FILTROS
      with QryAux do begin
       close;
       sql.Clear;
       sql.add('SELECT IDFILTRO FROM '+sistema.PrefixoServidor+'TABFILTROSQL ');
       sql.add('WHERE IDTABELA = :PAR1');
       params[0].asinteger := reg;
       open;
       if not(QryAux.EOF) then begin
        if not ExecutaQuery(QryAux,'DELETE '+sistema.PrefixoServidor+'FILTROSATUARIAIS '+
          'WHERE IDFILTRO  = '+IntToStr(QryAux['IDFILTRO'])) then begin
          showmessage('Processo interrompido : Problema na tabela de filtros');
          panel2.visible := false;
          exit;
       end;
        qryaux.next;
       end;
      end;

      if not ExecutaQuery(QryAux,'DELETE '+sistema.PrefixoServidor+'TABFILTROSQL '+
          'WHERE IDTABELA  = '+IntToStr(reg)) then begin
          showmessage('Processo interrompido : Problema na tabela de filtros');
          panel2.visible := false;
          exit;
      end;

      // apaga agora as informações da tabela de dados : TBVALPART
      if not ExecutaQuery(QryAux,'DELETE '+sistema.PrefixoServidor+'TBVALPART '+
          'WHERE IDTABELA  = '+IntToStr(reg)) then begin
          showmessage('Processo interrompido : Problema na tabela principal');
          panel2.visible := false;
          exit;
      end;

      // apaga primeiro as informações da tabela de dados : TBVALPART
      if not ExecutaQuery(QryAux,'DELETE '+sistema.PrefixoServidor+'TBVALPART '+
          'WHERE IDTABELA  = '+IntToStr(reg)) then begin
          showmessage('Processo interrompido : Problema na tabela principal');
          panel2.visible := false;
          exit;
      end;
      PrgBar1.Position:= 40;
      PrgBar1.Update;
      // apaga registros da tabela de descrição de campos : TBCAMPOPART
      if not ExecutaQuery(QryAux,'DELETE '+sistema.PrefixoServidor+'TBCAMPOPART '+
         'WHERE IDTABELA  = '+IntToStr(reg)) then begin
          showmessage('Processo interrompido : Problema nos campos');
          panel2.visible := false;
          exit;
      end;
      label4.caption := 'Processo terminando..';
      label4.update;
      PrgBar1.Position:= 50;
      PrgBar1.Update;
      // apaga o registro da tabela-mãe : TBPARTICIP
      if not ExecutaQuery(QryAux,'DELETE '+sistema.PrefixoServidor+'TBPARTICIP '+
         'WHERE IDTABELA  = '+IntToStr(reg)) then begin
          showmessage('Processo interrompido : Problema dos dados');
          exit;
      end;
      // apaga registros da tabela TABFILTROSQL
            if not ExecutaQuery(QryAux,'DELETE '+sistema.PrefixoServidor+'TABFILTROSQL '+
         'WHERE IDTABELA  = '+IntToStr(reg)) then begin
          showmessage('Processo interrompido : Problema nos filtros ');
          exit;
      end;

      panel2.visible := false;
      PrgBar1.Position:= 0;
      showmessage('Tabela foi deletada com sucesso');
      qrydetalhe.Close;
      qrydetalhe.open;
     end
     else
      Showmessage('Exclusão cancelada');
    end;
   end;
  end;
 end;

 BarraEstado.visible := false;
 PnlDetalhe.visible := false;
// Sob os Botoes
 BtIns.Down    := false;
 BtAlt.Down    := false;
 BtExcl.Down    := false;
 BtMostra.Down  := false;
 // Habilita Botoes de Detalhe
 BtIns.visible    :=true;
 // Desabilita
 BtAlt.visible    :=False;
 BtExcl.visible   :=False;
 BtMostra.visible := False;

 // Habilita botão cancelar
 bbtncancelardet.visible := true;
end;

procedure TfrmCriaTabs.DBEdit4Enter(Sender: TObject);
begin
  inherited;
end;

procedure TfrmCriaTabs.bbtnCancelarDetClick(Sender: TObject);
var
i : integer;
begin
 inherited;
 if btIns.down then begin
  i := QryDetalhe['IDTABELA'];
  With QryDetalhe Do Begin
   ExecutaQuery(QryAux,'DELETE '+sistema.PrefixoServidor+'TBPARTICIP '+
        'WHERE IDTABELA  = '+IntToStr(i));
   Delete;
   Close;
   Open;
  end;
 end;

 if btAlt.down then begin
  showmessage('Alteração cancelada');
  With QryDetalhe Do Begin
   Close;
   Open;
  end;
 end;
 PnlDetalhe.visible := false;
 // Sob os Botoes
 BtIns.Down    := false;
 BtAlt.Down    := false;
 BtExcl.Down    := false;
 BtMostra.Down  := false;
 // Habilita Botoes de Detalhe
 BtIns.visible    :=true;
 // Desabilita
 BtAlt.visible    :=False;
 BtExcl.visible   :=False;
 BtMostra.visible := False;
end;

procedure TfrmCriaTabs.bbtnOkDetExit(Sender: TObject);
begin
  inherited;
 panel2.visible := false;
end;

procedure TfrmCriaTabs.BtMostraClick(Sender: TObject);
begin
  inherited;
 bbtncancelardet.visible := false;
 bbtnokdet.Caption := '&Sair';
 if qryDetalhe.RecordCount=0 then begin
  BtMostra.Down    :=False;
  Exit;
 end;

 TbshDetalhe.Caption := 'Informações da Tabela Selecionada';
 thousandseparator := '.';
 FazQuery(QryAux,'SELECT IDTABELA FROM '+sistema.PrefixoServidor+'TBVALPART '+
         'WHERE IDTABELA  = '+IntToStr(qrydetalhe['IDTABELA']));
 BarraEstado.visible := true;
 BarraEstado.SimpleText := Format('Existem %d registros em '+qrydetalhe['DESCRICAO'],
 [qryaux.RecordCount]);
  nome.readonly := true;
  dtavaliacao.readonly := true;
// Inabilita Botoes de Detalhe
  BtIns.visible :=False;
  BtAlt.visible :=False;
  BtExcl.visible := False;
// Esconde Grid Mostra Painel
  PnlDetalhe.Visible:=True;
end;

procedure TfrmCriaTabs.LkcTabelasChange(Sender: TObject);
begin
  inherited;
  BtAlt.visible    :=true;
  BtExcl.visible   :=true;
  BtMostra.visible := true;
end;

procedure TfrmCriaTabs.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
 PnlDetalhe.visible := false;
 // Sob os Botoes
 BtIns.Down    := false;
 BtAlt.Down    := false;
 BtExcl.Down    := false;
 BtMostra.Down  := false;
 // Habilita Botoes de Detalhe
 BtIns.visible    :=true;
 // Desabilita
 BtAlt.visible    :=False;
 BtExcl.visible   :=False;
 BtMostra.visible := False;
end;

procedure TfrmCriaTabs.LkcTabelasClick(Sender: TObject);
begin
  inherited;
  BtAlt.visible    :=true;
  BtExcl.visible   :=true;
  BtMostra.visible := true;
end;

procedure TfrmCriaTabs.BitBtn2Click(Sender: TObject);
begin
  inherited;
  painelescolha.visible := False;
  pnldetalhe.visible    := False;
  BtIns.Down            := false;
  close;
end;

procedure TfrmCriaTabs.BitBtn1Click(Sender: TObject);
var
tipo : integer;
begin
  inherited;
  painelescolha.visible    :=False;
  qrydetalhe['massaplano'] := qrygrupo['DESCGRUPOARQUIVO'];
end;

procedure TfrmCriaTabs.DBPlanosChange(Sender: TObject);
begin
  inherited;
  plano.caption := qrygrupo['DESCGRUPOARQUIVO'];
end;

procedure TfrmCriaTabs.BitBtn4Click(Sender: TObject);
begin
  inherited;
  RelatorioErro.QryErro.open;
  RelatorioErro.preview;
  RelatorioErro.QryErro.close;
end;

procedure TfrmCriaTabs.BitBtn3Click(Sender: TObject);
begin
  inherited;
  RelatorioErro.QryErro.open;
  RelatorioErro.print;
  RelatorioErro.QryErro.close;
end;

procedure TfrmCriaTabs.FormCreate(Sender: TObject);
begin
  inherited;
end;

end.

