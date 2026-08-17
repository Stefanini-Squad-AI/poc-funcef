unit FGeraValores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, ComCtrls,
  Mask, wwdbedit, Wwdatsrc;

type
  TfrmGeraValores = class(TfrmSairAjuda)
    GroupBox1: TGroupBox;
    MemoMensagens: TMemo;
    GroupBox2: TGroupBox;
    PrgBar1: TProgressBar;
    lblStatus: TLabel;
    dblTabelas: TwwDBLookupCombo;
    qryTabelas: TwwQuery;
    Label1: TLabel;
    Toolbar971: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    Panel1: TPanel;
    dbeGrupo: TwwDBEdit;
    dbeMassaPlano: TwwDBEdit;
    dbeAvaliacao: TwwDBEdit;
    dbeDataCriacao: TwwDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    qryDadosTabela: TwwQuery;
    ckbGerados: TCheckBox;
    dsDadosTabela: TwwDataSource;
    bbtnGera: TBitBtn;
    QryPartprevplan: TwwQuery;
    qryaux: TwwQuery;
    QryPesquisa: TwwQuery;
    qrypatrocinadora: TwwQuery;
    qrydados: TwwQuery;
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
    bbtnApaga: TBitBtn;
    procedure dblTabelasChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnGeraClick(Sender: TObject);
    procedure bbtnApagaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Gravaerro(nometabela,tipocritica,dataref,descricao : string;
		      idpessoa,idpessjur,idsitplanprev: integer): boolean;
    function ParticPlanoRefer(descricao,dtavaliacao : string;iIdTabela : integer) : boolean;
    function DependPlanoRefer(descricao,dtavaliacao : string;iIdTabela : integer) : boolean;
    function DeletarValores(idtabela : integer): boolean;
  end;

var
  frmGeraValores: TfrmGeraValores;

implementation
uses  UMensErro,UDataBase ,UBibliotecaAtuarial,usistema, UGrupoHipotese,
      RelatErro,DBaseDados, uAutorizacao,faguarde;
{$R *.DFM}

procedure TfrmGeraValores.dblTabelasChange(Sender: TObject);
begin
  inherited;
  with qryDadosTabela do begin
    close;
    ParamByName('pIdTabela').AsInteger := qryTabelas['IdTabela'];
    open;
  end;
  //  Verifica se os dados estão gerados na Tabela de Valores ou na tabela de erros
  with TwwQuery.Create(Self) do begin
    databasename := qryTabelas.DatabaseName;
    Sql.Add('SELECT IDTABELA, DESCRICAO FROM TBPARTICIP ');
    Sql.Add('WHERE (IDTABELA = ' + inttostr(qryTabelas['IdTabela']) + ') AND ');
    Sql.Add('(IDTABELA NOT IN (SELECT DISTINCT IDTABELA FROM TBVALPART))');
    try
      Open;
      if recordcount > 0 then
        ckbGerados.Checked := false
      else
	ckbGerados.Checked := true;
      close;  
     except
      ShowMessage('Problemas com a tabela de valores!');
    end;
    Free;
  end;
end;

procedure TfrmGeraValores.FormShow(Sender: TObject);
begin
  inherited;
  qryTabelas.Open;
end;

procedure TfrmGeraValores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryTabelas.close;
end;

function   TfrmGeraValores.Gravaerro(nometabela,tipocritica,dataref,descricao : string;
				  idpessoa,idpessjur,idsitplanprev: integer): boolean;
begin

  GravaErro := true;
  with TwwQuery.Create(Self) do
  begin
    DataBaseName := qryTabelas.DataBaseName;

    Sql.Add('INSERT INTO ERROATUARIALTAB (TABELA, DATAATUAL, DATAREF, ');
    Sql.Add('DESCRICAO, TIPO, IDPESSOA, IDPESSJUR, SITUACAO) ');
    Sql.Add('VALUES ('''+ nometabela + ''', ''' + datetostr(date) + ''', ');
    Sql.Add('''' + dataref + ''', ''' + descricao + ''', ');
    Sql.Add('''' + tipocritica + ''', ' + inttostr(idpessoa) );
    Sql.Add(', ' + inttostr(idpessjur) + ', ' + inttostr(idsitplanprev) + ')');
    try
     ExecSQL;
     memoMensagens.Lines.Add('Erro ' + descricao);
     memoMensagens.Lines.Add('   Participante: ' + inttostr(idpessoa));
     memoMensagens.Lines.Add('');
     lblStatus.Caption := 'Gravando na tabela de ERROS ...';
     Application.ProcessMessages;

     except
      GravaErro := False;
    end;
    Free;
  end;

end;

procedure TfrmGeraValores.bbtnGeraClick(Sender: TObject);
begin
  inherited;
  if (dblTabelas.LookupValue = '') then
      MsgDlg('Atenção! Nenhuma tabela foi selecionada.', 'Erro', mtError, [mbOK], 0)
  else begin
    // Verifica se valores já foram gerados
    if (not ckbGerados.Checked) then begin
      // Inicia a transação para geração dos valores
      memoMensagens.Clear;
      memoMensagens.Lines.Add('Processo Iniciado - Aguarde ...');
      lblStatus.Caption := 'Gravando as informações nas tabelas...' ;
      application.ProcessMessages;

      qrydados.close;
      qrydados.params[0].asinteger:=qryTabelas['idtabela'];
      qrydados.open;

      if Qrydados.IsEmpty then begin
	 //PARTE DE CARREGAR OS DADOS
	 // GRUPOS SÃO PRÉ-ESTABELECIDOS PELO USUÁRIO NA CRIAÇÃO NO DICIONÁRIO DE DADOS

	lblStatus.Caption := 'Aguarde, buscando informações para gravação ...';
	Application.ProcessMessages;

	if trim(QryTabelas['MASSAPLANO']) = 'ADPREF' then begin// PARTICIPANTES PLANO REFER
	  // CHAMA ROTINA MONTA DADOS PARTICIPANTES PLANO REFER
	  if not(ParticPlanoREFER(QryTabelas.FieldbyName('descricao').asstring,
				       QryTabelas.FieldbyName('avaliacao').asstring,14)) then
	  begin
	    showmessage('Problemas na gravação dos dados dos participantes : Plano REFER');

	    //Deleta registros tabelas
            if not DeletarValores(qryTabelas['IDTABELA']) then
             showmessage('Favor eliminar a atual tabela');

            exit;
          end;
        end
	else
         if QryTabelas['MASSAPLANO'] = 'ADPMET' then begin // PARTICIPANTES PLANO METRO
           if not(ParticPlanoRefer(QryTabelas.FieldbyName('descricao').asstring,
                                        QryTabelas.FieldbyName('avaliacao').asstring,14)) then
           begin
              showmessage('Problemas na gravação dos dados dos participantes : Plano Metrô');
              //Deleta registros tabelas
              if not DeletarValores(qryTabelas['IDTABELA']) then
               showmessage('Favor eliminar a atual tabela');
               exit;
           end;
         end
         else
         if QryTabelas['MASSAPLANO'] = 'ADDREF' then begin // DEPENDENTES PLANO REFER
	   if not(DependPlanoRefer(QryTabelas.FieldbyName('descricao').asstring,
                                      QryTabelas.FieldbyName('avaliacao').asstring,14)) then begin
             showmessage('Problemas na gravação dos dados dos dependentes : Plano Metrô');
		       //Deleta registros tabelas
                if not DeletarValores(qryTabelas['IDTABELA']) then
                  showmessage('Favor eliminar a atual tabela');
             exit;
           end;
         end
	 else
           if QryTabelas['MASSAPLANO'] = 'ADDMET' then // DEPENDENTES PLANO METRO
             // CHAMA ROTINA MONTA DADOS DEPENDENTES PLANO METRO
           else
           if QryTabelas['MASSAPLANO'] = 'ADEREF' then // PATROCINADORAS PLANO REFER
            // CHAMA ROTINA MONTA DADOS PATROCINADORAS PLANO REFER
           else
           if QryTabelas['MASSAPLANO'] = 'ADEMET' then // PATROCINADORAS PLANO METRO
           // CHAMA ROTINA MONTA DADOS PATROCINADORAS PLANO REFER
           else
           begin
              showmessage('Grupo selecionado não foi cadastrado no dicionário de dados');
              // colocar rotina para deletar os registros da TBCAMPOPART e da TBPARTICIP
              // referentes ao IDTABELA criado
             exit;
	   end;
       end; // QryDados is Empty
    end
    else //  Check Box marcado
      MsgDlg('Atenção! Os valores já foram gerados para esta tabela.', 'Erro', mtError, [mbOK], 0);
  end; // else da Escolha de tabela
end;

function TfrmGeraValores.ParticPlanoRefer(descricao,dtavaliacao : string;iIdTabela : integer) : boolean;
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

// apaga registros do arquivo de erro
 lblStatus.Caption := 'Apagando tabela de erros ...';
 Application.ProcessMessages;

 if not ExecutaQuery(QryAux,'DELETE FROM '+sistema.PrefixoServidor+'ERROATUARIALTAB') then begin
   showmessage('Problemas na tabela de erros do módulo atuarial' + #10 + #13 +
	       'Posteriormente apague os dados!');
 end;


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

 memoMensagens.Lines.Add('Preparando informações dos participantes ...');
 memoMensagens.Lines.Add('');

 lblStatus.Caption := 'Preparando informações dos participantes ...';
 Application.ProcessMessages;

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
  sql.add('   AND     (PAI.IDPESSOA          <  1300600) ');   // LINHA PARA DIMINUIR A EXECUÇÃO DO PROGRAMA
  sql.add('   AND     (PART.IDPESSOA          =  PF.IDPESSOA) ');
  sql.add('   AND     (PART.IDPESSOA          =  ELEG.IDPESSOA) ');
  sql.add('   AND     (PART.IDPESSOA          =  RESERVA.IDPESSOA) ');
  sql.add('   AND     (PART.IDSITPART         =  SIT.IDSITPART) ');
  sql.add('   AND     (PAI.IDPESSOA           =  PART.IDPESSOA)');

  params[0].asinteger := 14; //plano REFER
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
   QryDados['idtabela'] := qryTabelas['idtabela'];
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

   QryDados['V6'] := inttostr(situacao); // QryPartPrevPlan['IDSITPLANOPREV'])
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

    //SRB
    QryDados['V29'] := '0';


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

    if QryPartprevplan['V33'] <> NULL then        // RESERVA DE POUPANÇA
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

   with QryAux do begin
     close;
     sql.clear;
     sql.add('SELECT IDSITPART, FLGINTERNO ');
     sql.add('FROM '+sistema.PrefixoServidor+'SITPART '); // PARTICIPANTES ATIVOS E MANTIDOS
     sql.add('WHERE FLGINTERNO IN (''AT'', ''MA'', ''MP'') AND ');
     sql.add('IDSITPART = :PIdSitPart');
     params[0].asinteger := QryPartPrevPlan['IDSITPART'];
     try
      open;
     except begin
      showmessage('Problemas na Tabela de Situação do Participante : SITPART');
      ParticPlanoRefer := false;
     end;
     end;

   end;

   if QryDados['V11'] <> '' then begin  // DATA DE NASCIMENTO
    decodedate(strtodate(QryDados['V11']),ano,mes,dia);
    idadeatual := trunc(((anoref - ano) * 12 + (mesref - mes))/12);
    if ((idadeatual < 14) or (idadeatual > 65)) and
			       (not QryAux.EOF) then begin
       Gravaerro(descricao,'S',dtavaliacao,'Idade atual: '+inttostr(idadeatual)+' anos',
			     QryPartPrevPlan['IDPESSOA'],
			     QryPartPrevPlan['IDPESSJUR'],situacao);
      erro := true;
    end;
   end;

   if (QryDados['V1'] <> '') and (QryDados['V10'] <> '') then begin
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

   DatasitFundacao := strtodate('01/01/1901'); // DATA PARAMETRO INICIAL
   with QryAux do begin
     close;
     sql.clear;
     sql.add('SELECT MAX(DATAEVENTO)  AS DATASITFUND ');
     sql.add('FROM '+sistema.PrefixoServidor+'EVENTOSPREV  WHERE ');
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

   if (QryDados['V11'] <> '') and (DatasitFundacao <> 0) and (DatasitFundacao <> strtodate('01/01/1901')) then begin
    // DATA DE NASCIMENTO E SITUACAO NA FUNDACAO
    if strtodate(QryDados['V11']) > DatasitFundacao then begin
      Gravaerro(descricao,'S',dtavaliacao,'Data de nascimento maior que data de situação na REFER',
			     QryPartPrevPlan['IDPESSOA'],
			     QryPartPrevPlan['IDPESSJUR'],situacao);
      erro := true;
    end;
   end;

   if (QryDados['V10'] <> '') and (DatasitFundacao <> 0) and (DatasitFundacao <> strtodate('01/01/1901')) then begin
    // DATA DE ADMISSAO E SITUACAO NA FUNDACAO
    if strtodate(QryDados['V10']) > DatasitFundacao then begin
      Gravaerro(descricao,'S',dtavaliacao,'Data de admissão maior que data de situação na REFER',
			     QryPartPrevPlan['IDPESSOA'],
			     QryPartPrevPlan['IDPESSJUR'],situacao);
      erro := true;
    end;
   end;

   if (QryDados['V1'] <> '') and (DatasitFundacao <> 0) and (DatasitFundacao <> strtodate('01/01/1901')) then begin
    // DATA DE INSCRICAO E SITUACAO NA FUNDACAO
    if strtodate(QryDados['V1']) > DatasitFundacao then begin
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
       Gravaerro(descricao,'S',dtavaliacao,'Salário de participação > 60 salários mínimos',
			     QryPartPrevPlan['IDPESSOA'],
			     QryPartPrevPlan['IDPESSJUR'],situacao);
       erro := true;
      end;

     end;
   end;

   // GRAVA NA TABELA DE DADOS TBVALPART
   if not erro then begin
    lblStatus.Caption := 'Gravando na tabela de VALORES ...';
    Application.ProcessMessages;
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

 ParticPlanoRefer := true;

 MsgDlg('Total de registros lidos : '+inttostr(registro)+#10+#13+
	'Total de registros gravados : '+inttostr(gravados)+#10+#13+
	'Total de registros não gravados : '+inttostr(naogravados)+#10+#13, 'Informações', mtInformation, [mbOk], 0);

 lblStatus.Caption := 'Processo finalizado.';
 ckbGerados.Checked := true;
 PrgBar1.Position:= 0;
 Application.ProcessMessages;

end;

function TfrmGeraValores.DependPlanoRefer(descricao,dtavaliacao : string;iIdTabela : integer) : boolean;
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

// apaga registros do arquivo de erro
 lblStatus.Caption := 'Apagando tabela de erros ...';
 Application.ProcessMessages;

 if not ExecutaQuery(QryAux,'DELETE FROM '+sistema.PrefixoServidor+'ERROATUARIALTAB') then
   showmessage('Problemas na tabela de erros do módulo atuarial' + #10 + #13 +
	       'Posteriormente apague os dados!');

 val(copy(dtavaliacao,1,4),anoref,code);
 if (code <> 0) or (anoref < 1999) then begin
   showmessage('Problemas no ano da data de referência da avaliação');
   DependPlanoRefer := false;
 end;
 val(copy(dtavaliacao,5,2),mesref,code);
 if (code <> 0) or ((mesref < 1) or (mesref > 12)) then begin
   showmessage('Problemas no mês da data de referência da avaliação');
   DependPlanoRefer := false;
 end;

 memoMensagens.Lines.Add('Preparando informações dos dependentes ...');
 memoMensagens.Lines.Add('');

 lblStatus.Caption := 'Preparando informações dos dependentes ...';
 Application.ProcessMessages;

 with QryPartprevplan do begin
  close;
  sql.clear;
  sql.add('SELECT  PP.NOME TITULAR, P.NOME DEPENDENTE, PF.DATANASC, PF.SEXO');
  sql.add('FROM  DEPENTIT DPT, PESSOA P, PESSOA PP, PESSOAFISICA PF');
  sql.add('WHERE DPT.IDPESSOA = P.IDPESSOA AND');
  sql.add('   P.IDPESSOA = PF.IDPESSOA AND');
  sql.add('   DPT.IDTITULAR = PP.IDPESSOA');

  params[0].asinteger := 14; //plano REFER
  try
   open;
  except begin
   showmessage('Problemas na tabela de participantes do plano - PARTPREVPLAN');
   DependPlanoRefer := false;
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
  end; // fim do While EOF
 end;
end;

function TfrmGeraValores.DeletarValores(idtabela : integer): boolean;
begin
 DeletarValores := true;
 if not ExecutaQuery(QryAux,'DELETE FROM '+sistema.PrefixoServidor+'TBVALPART '+
	     'WHERE IDTABELA  = '+IntToStr(IDTABELA)) then
    DeletarValores := false;

end;

procedure TfrmGeraValores.bbtnApagaClick(Sender: TObject);
begin
  inherited;
  if (dblTabelas.LookupValue = '') then
      MsgDlg('Atenção! Nenhuma tabela foi selecionada.', 'Erro', mtError, [mbOK], 0)
  else
  if ckbGerados.Checked then begin
     lblStatus.Caption := 'Apagando valores para a tabela ...';
     Application.ProcessMessages;
     if not DeletarValores(qryTabelas['idtabela']) then
	MsgDlg('Erro na Tabela de Valores dos Participantes.', 'Erro', mtError, [mbOk], 0)
     else begin
	lblStatus.Caption := 'Valores apagados.';
	Application.ProcessMessages;
	ckbGerados.checked := false
     end;
  end
  else
    MsgDlg('Não existem valores gerados para esta tabela!', 'Erro', mtError, [mbOK], 0);
end;

end.
