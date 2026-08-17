unit FgeraTabela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Mask, DBCtrls, StdCtrls, wwdblook, ComCtrls, IvDictio,
  IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery,
  TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Wwtable, wwdbedit,
  CmEventosCadastro, ImgList;

type
  TFrmGeraTabela = class(TfrmCadastroCS)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Soleitura: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    dbeditcriatab: TDBEdit;
    dbeditcodigotab: TDBEdit;
    dbeditplanomassa: TDBEdit;
    qrygrupo: TwwQuery;
    qryCampos: TwwQuery;
    StatusBar1: TStatusBar;
    qrydados: TwwQuery;
    Panel1: TPanel;
    Label9: TLabel;
    QryPartprevplan: TwwQuery;
    Panel2: TPanel;
    Animate1: TAnimate;
    PrgBar1: TProgressBar;
    Label4: TLabel;
    QryPesquisa: TwwQuery;
    qryaux: TwwQuery;
    dbeditaval: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    dbeditgrupo: TwwDBLookupCombo;
    dbedittabelas: TDBEdit;
    Updqrycampos: TUpdateSQL;
    updqrydados: TUpdateSQL;
    qrydadosIDTABELA: TFloatField;
    qrydadosV1: TStringField;
    qrydadosV2: TStringField;
    qrydadosV3: TStringField;
    qrydadosV4: TStringField;
    qrydadosV5: TStringField;
    qrydadosV6: TStringField;
    qrydadosV7: TStringField;
    qrydadosV8: TStringField;
    qrydadosV9: TStringField;
    qrydadosV10: TStringField;
    qrydadosV11: TStringField;
    qrydadosV12: TStringField;
    qrydadosV13: TStringField;
    qrydadosV14: TStringField;
    qrydadosV15: TStringField;
    qrydadosV16: TStringField;
    qrydadosV17: TStringField;
    qrydadosV18: TStringField;
    qrydadosV19: TStringField;
    qrydadosV20: TStringField;
    qrydadosV21: TStringField;
    qrydadosV22: TStringField;
    qrydadosV23: TStringField;
    qrydadosV24: TStringField;
    qrydadosV25: TStringField;
    qrydadosV26: TStringField;
    qrydadosV27: TStringField;
    qrydadosV28: TStringField;
    qrydadosV29: TStringField;
    qrydadosV30: TStringField;
    qrydadosV31: TStringField;
    qrydadosV32: TStringField;
    qrydadosV33: TStringField;
    qrydadosV34: TStringField;
    qrydadosV35: TStringField;
    qrydadosV36: TStringField;
    qrydadosV37: TStringField;
    qrydadosV38: TStringField;
    qrydadosV39: TStringField;
    qrydadosV40: TStringField;
    qrydadosV41: TStringField;
    qrydadosV42: TStringField;
    qrydadosV43: TStringField;
    qrydadosV44: TStringField;
    qrydadosV45: TStringField;
    qrydadosV46: TStringField;
    qrydadosV47: TStringField;
    qrydadosV48: TStringField;
    qrydadosV49: TStringField;
    qrydadosV50: TStringField;
    qrydadosV51: TStringField;
    qrydadosV52: TStringField;
    qrydadosV53: TStringField;
    qrydadosV54: TStringField;
    qrydadosV55: TStringField;
    qrydadosV56: TStringField;
    qrydadosV57: TStringField;
    qrydadosV58: TStringField;
    qrydadosV59: TStringField;
    qrydadosV60: TStringField;
    qrydadosTRGDTINCLUSAO: TDateTimeField;
    qrydadosTRGUSERINCLUSAO: TStringField;
    qrypatrocinadora: TwwQuery;
    procedure FormShow(Sender: TObject);
  private
    procedure Atualizar(const lIdTabela: LongInt);
  public
    function GravaTabCampo(idtab : integer;codigocampo,descricaocampo : string;
			   tipocampo : integer;posicaocampo : string) : boolean;
    function DeletarRegistros(idtabela : integer): boolean;
    function ParticPlanoMetro(descricao,dtavaliacao : string;iIdTabela : integer) : boolean;
    function ParticPlanoRefer(descricao,dtavaliacao : string;iIdTabela : integer) : boolean;
    function DependPlanoRefer(descricao,dtavaliacao : string) : boolean;
    function Gravaerro(nometabela,tipocritica,dataref,descricao : string;
		      idpessoa,idpessjur,idsitplanprev: integer): boolean;
   function  PodeExcluir : boolean;
  end;

var
    FrmGeraTabela: TFrmGeraTabela;
    procurou , achou, inserir,visualizar : boolean; {Procurou é a variável que verificará se o botão procurar foi acionado
						   achou indicará se retornou algum registro após a ação de procura
						   Inserir verifica se pode inserir}


implementation
uses  UMensErro,UDataBase ,UBibliotecaAtuarial,usistema, UGrupoHipotese,
      RelatErro,DBaseDados, uAutorizacao,faguarde;

{$R *.DFM}

function TfrmgeraTabela.PodeExcluir : boolean;
var
  reg,pos,campo,i : integer;
  Grupodedados,pesquisa : string;
begin
  Result:=true;
  if sbtnapagar.Down then
  begin
	 pesquisa := 'SELECT A.IDSIMULACAO,A.PUBLICADA,A.IDFILTRO FROM '+
	 sistema.PrefixoServidor+'SIMULACOES A, '+
	 sistema.PrefixoServidor+'TABFILTROSQL B, '+
	 sistema.PrefixoServidor+'TBPARTICIP C '+
	 'WHERE C.IDTABELA  = '+IntToStr(qry['IDTABELA'])+' AND '+
	 'C.IDTABELA = B.IDTABELA AND B.IDFILTRO = A.IDFILTRO';
	 FazQuery(QryAux,pesquisa);
	 if not QryAux.eof then
	 begin
	    showmessage('Este arquivo é usado pela simulação de número : '+inttostr(QryAux['IDSIMULACAO']));
	    if QryAux['PUBLICADA'] = 'S' then
	    begin
	      showmessage('Este arquivo não pode ser excluído, pois é usado'+ #10+#13+ 'pela simulação PUBLICADA de número : '+inttostr(QryAux['IDSIMULACAO']));
	      exit;
	    end;
	 end;

	 If MessageBox(0,'Confirma deleção da tabela?','Mensagem do Sistema ',1) = IdOk Then
	 Begin
	    statusbar1.panels[0].text := 'O processo pode ser lento. Aguarde aviso do sistema';
	    PrgBar1.Max := 60;
	    panel2.visible := true;
            Panel2.Refresh;
	    label4.caption := 'Deletando registros..';
	    label4.update;
	    PrgBar1.Position:= 10;
	   // aponta para o registro selecionado
	    reg := Qry['IDTABELA'];
	   // APAGA PRIMEIRO, SE TIVER OS FILTROS
	    with QryAux do
	    begin
	      close;
	      sql.Clear;
	      sql.add('SELECT IDFILTRO FROM '+sistema.PrefixoServidor+'TABFILTROSQL ');
	      sql.add('WHERE IDTABELA = :PAR1');
	      params[0].asinteger := reg;
	      open;
	      if not(QryAux.EOF) then
	      begin
		 if not ExecutaQuery(QryAux,'DELETE '+sistema.PrefixoServidor+'FILTROSATUARIAIS '+
					    'WHERE IDFILTRO  = '+IntToStr(QryAux['IDFILTRO'])) then
		 begin
		   showmessage('Processo interrompido : Problema na tabela de filtros');
		   panel2.visible := false;
		   exit;
		 end;
		   qryaux.next;
	      end;
	    end;

	    if not ExecutaQuery(QryAux,'DELETE '+sistema.PrefixoServidor+'TABFILTROSQL '+
				       'WHERE IDTABELA  = '+IntToStr(reg)) then
	    begin
	      showmessage('Processo interrompido : Problema na tabela de filtros');
	      panel2.visible := false;
	      exit;
	    end;

			     // apaga agora as informações da tabela de dados : TBVALPART
	    if not ExecutaQuery(QryAux,'DELETE '+sistema.PrefixoServidor+'TBVALPART '+
				       'WHERE IDTABELA  = '+IntToStr(reg)) then
	    begin
	      showmessage('Processo interrompido : Problema na tabela principal');
	      panel2.visible := false;
	      exit;
	    end;

			// apaga primeiro as informações da tabela de dados : TBVALPART
	    if not ExecutaQuery(QryAux,'DELETE '+sistema.PrefixoServidor+'TBVALPART '+
				       'WHERE IDTABELA  = '+IntToStr(reg)) then
	    begin
	      showmessage('Processo interrompido : Problema na tabela principal');
	      panel2.visible := false;
	      exit;
	    end;
	      PrgBar1.Position:= 40;
	      PrgBar1.Update;
	      // apaga registros da tabela de descrição de campos : TBCAMPOPART
	      if not ExecutaQuery(QryAux,'DELETE '+sistema.PrefixoServidor+'TBCAMPOPART '+
					 'WHERE IDTABELA  = '+IntToStr(reg)) then
	      begin
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
				    'WHERE IDTABELA  = '+IntToStr(reg)) then
		begin
		  showmessage('Processo interrompido : Problema dos dados');
		  exit;
		end;
		// apaga registros da tabela TABFILTROSQL
		if not ExecutaQuery(QryAux,'DELETE '+sistema.PrefixoServidor+'TABFILTROSQL '+
					   'WHERE IDTABELA  = '+IntToStr(reg)) then
		begin
		  showmessage('Processo interrompido : Problema nos filtros ');
		  exit;
		end;
		panel2.visible := false;
		PrgBar1.Position:= 0;
		showmessage('Tabela foi deletada com sucesso');
	 end
	 else
	    Result:=false;

    end;
end;

function   Tfrmgeratabela.GravaTabCampo(idtab : integer;codigocampo,descricaocampo : string;
				      tipocampo : integer;posicaocampo : string): boolean;

begin
    qrycampos.insert;
    qrycampos.fieldbyname('IDCAMPO').asstring   := codigocampo;
    qrycampos.fieldbyname('IDTABELA').asinteger  := idtab;
    qrycampos.fieldbyname('DESCRICAO').asstring := descricaocampo;
    qrycampos.fieldbyname('TIPO').asinteger     := tipocampo;
    qrycampos.fieldbyname('RELACAO').asstring   := posicaocampo;

    try
      AplicaAlteracoes([qrycampos]);
    except
      raise;
    end;
    GravaTabCampo := true;
end;

procedure Tfrmgeratabela.Atualizar(const lIdTabela: LongInt);
begin
  with qry do
  begin
    Close;
    ParamByName('pIDTABELA').AsInteger := lIdTabela;
    Open;
  end;

  with qrycampos do
  begin
     close;
     parambyname('codtab').asinteger:=lIdtabela;
     open;
  end;

end;

function   Tfrmgeratabela.Gravaerro(nometabela,tipocritica,dataref,descricao : string;
				  idpessoa,idpessjur,idsitplanprev: integer): boolean;
begin

    Result := true;
    with TwwQuery.Create(Self) do
    begin
      DataBaseName := qry.DataBaseName;

      Sql.Add('INSERT INTO ERROATUARIALTAB (TABELA, DATAATUAL, DATAREF, ');
      Sql.Add('DESCRICAO, TIPO, IDPESSOA, IDPESSJUR, SITUACAO) ');
      Sql.Add('VALUES ('''+ nometabela + ''', ''' + datetostr(date) + ''', ');
      Sql.Add('''' + dataref + ''', ''' + descricao + ''', ');
      Sql.Add('''' + tipocritica + ''', ' + inttostr(idpessoa) );
      Sql.Add(', ' + inttostr(idpessjur) + ', ' + inttostr(idsitplanprev) + ')');
      try
       ExecSQL;
       except
	Result := False;
      end;

      Free;
    end;

end;

function Tfrmgeratabela.DeletarRegistros(idtabela : integer): boolean;
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

 DeletarRegistros := true;

end;

function Tfrmgeratabela.DependPlanoRefer(descricao,dtavaliacao : string) : boolean;
//var
begin
  {-----}
end;


function Tfrmgeratabela.ParticPlanoMetro(descricao,dtavaliacao : string;iIdTabela : integer) : boolean;
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
  params[0].asinteger := 14; //plano REFER
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

   qryDados.insert;
   QryDados['idtabela'] := qry['idtabela'];
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
     if QryAux['V22'] <> null then        // DATA DA DIB REFER
      QryDados['V22'] := datetostr(QryAux['V22'])
     else begin
      showmessage('Erro no registro :'+inttostr(QryPartPrevPlan['IDPESSOA']));
      showmessage('Erro : DATA DA DIB REFER em branco');
      ParticPlanoMetro := false;
     end;
     if QryAux['V23'] <> null then        // DATA FIM DE BENEFICIO REFER
      QryDados['V23'] := datetostr(QryAux['V23'])
     else begin
      showmessage('Erro no registro :'+inttostr(QryPartPrevPlan['IDPESSOA']));
      showmessage('Erro : DATA DA DIB REFER em branco');
      ParticPlanoMetro := false;
     end;
     if QryAux['V24'] <> null then        // BENEFICIO REFER
      QryDados['V24'] := FrmGrupoHipotese.TrocaVirgulaPonto(floattostr(QryAux['V24']))
     else begin
      showmessage('Erro no registro :'+inttostr(QryPartPrevPlan['IDPESSOA']));
      showmessage('Erro : Benefício REFER zerado');
      ParticPlanoMetro := false;
//     QryDados['V24'] := '0';
     end;
     if QryAux['V25'] <> null then        // BENEFICIO INSS
      QryDados['V25'] := FrmGrupoHipotese.TrocaVirgulaPonto(floattostr(QryAux['V25']))
     else begin
      showmessage('Erro no registro :'+inttostr(QryPartPrevPlan['IDPESSOA']));
      showmessage('Erro : Benefício INSS zerado');
      ParticPlanoMetro := false;
//     QryDados['V25'] := '0';
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
   panel2.Visible:=true;
   Panel2.Refresh;
   animate1.Active:=true;
   PrgBar1.Position:= pos;
  end;

 end;
 ParticPlanoMetro := true;

end;

function TfrmGeraTabela.ParticPlanoRefer(descricao,dtavaliacao : string;iIdTabela : integer) : boolean;
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
  sql.add('   AND     (PAI.IDPESSOA          <  1300033) ');   // LINHA PARA DIMINUIR A EXECUÇÃO DO PROGRAMA
  sql.add('   AND     (PART.IDPESSOA          =  PF.IDPESSOA) ');
  sql.add('   AND     (PART.IDPESSOA          =  ELEG.IDPESSOA) ');
  sql.add('   AND     (PART.IDPESSOA          =  RESERVA.IDPESSOA) ');
  sql.add('   AND     (PART.IDSITPART         =  SIT.IDSITPART) ');
  sql.add('   AND     (PAI.IDPESSOA           =  PART.IDPESSOA)');

  params[0].asinteger := 14; //plano 
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
	  if (qryPesquisa.eof) then
	  begin
	      Gravaerro(descricao,'S',dtavaliacao,'Código do Participante inválido :'+inttostr(QryPartPrevPlan['IDSITPLANOPREV']),
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
   QryDados['idtabela'] := qry['idtabela'];
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
    if (QryPesquisa.eof) then begin
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
    if (QryPesquisa.eof) then begin
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
    if (QryPesquisa.eof) then begin
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
	  if (QryPesquisa.eof) then
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
   //end;

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

    // V28 - SALPARTLIM
    QryDados['V28'] := '0';

    // V29 - SRB
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
   panel2.Visible:=true;
   Panel2.Refresh;
   animate1.Active:=true;
   PrgBar1.Position:= pos;
  end;

 end;

 ParticPlanoRefer := true;
 showmessage('Total de registros lidos : '+inttostr(registro)+#10+#13+
	     'Total de registros gravados : '+inttostr(gravados)+#10+#13+
	     'Total de registros não gravados : '+inttostr(naogravados)+#10+#13);

end;

procedure TFrmGeraTabela.FormShow(Sender: TObject);
begin
  inherited;
  Atualizar(-1);
  qryGrupo.Open;
end;


end.
