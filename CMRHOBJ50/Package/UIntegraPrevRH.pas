// *****************************************************************************
// Unit        : UIntegraPrevRH
// Descricao   : Esta unit contem as rotinas de integraçao dos sistemas previden
//               ciarios com o sistema de RH e Folha de Pagamento da Fundação
// Responsável : Camille Monteiro Viana
// Setor       : Desenvolvimento TotalPREV
// Ultima Alt. : 27.03.2002
// *****************************************************************************
//Rotina...........: function InsereCriticaInterface
//Nº SOL...........: 155521/9643
//Nº KINTANA.......: 1664446
//Data da Alteração: 28/05/2012
//Responsável......: André Oliveira
//Descrição........: Substiuição do "SELECT MAX(SEQCRITICA) SEQCRITICA FROM TABCRITICASCCP" por uma sequence motivo de performance.
//***************************************************************************************


{*******************************************************
RESPONSÁVEL.: Douglas Siqueira
Nº SOL......: 171426
Nº KINTANA..: 1537613
Data........: 06/01/2012
Descrição...: Alteração do limite de faixas de 9 para 20.
*******************************************************}


unit UIntegraPrevRH;

interface

uses  Db, DBTables, Wwquery, Wwdatsrc, DBCtrls, Mask, wwdbedit,
      Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
      ComCtrls, UDataBase;

const
      ceEmprNovo             = '69';
      ceCCustoAlterado       = '70';
      ceMatriculaAlterada    = '72';
      ceDataAdmAlterada      = '4';
      ceDtDemissaoAlterada   = '61';
      ceSalarioAlterado      = '71';
      ceDtReadmissaoAlterada = '62';
      ceFilialAlterada       = '55';
      ceCargoAlterado        = '9';
// *****************************************************************************
// *********************** ROTINA PRINCIPAL ************************************
// *****************************************************************************
      function AtualizaDadosPrevFuncionario ( piIdFundacao, piIdPessoa : longint ) : boolean;
      function AtualizaFaixasSalariais      ( piIdFundacao             : longint ) : boolean;

// *****************************************************************************
// *********************** ROTINAS AUXILIARES***********************************
// *****************************************************************************
      function InsereFuncionarioElegivel    ( piIdFundacao, piIdPessoa : longint ) : boolean;
      function AlteraFuncionarioElegivel    ( piIdFundacao, piIdPessoa : longint ) : boolean;
      function ProcessaDE_PARA_CARGO        ( piIdFundacao, piIdPessoa, piIdCargoElegPatro : longint; pcTipo : char; var piIdCargo : longint ) : boolean;
      function ProcessaDE_PARA_CONTABANCARIA( piIdPessoa, piIdAgencia : longint; psNumConta : string ) : boolean;
      function InsereCriticaInterface       ( qryAux            : TwwQuery;
                                              piIdFundacao,
                                              piIdPessoa        : longint;
                                              psValorNoRH,
                                              psValorNoAdmPREV,
                                              psMatricula,
                                              psCodErro,
                                              psTipoDado       : string       ) : boolean;
      function OraNumero                    ( sNumero          : string)        : string;
      //André Oliveira SOL - 155521/9643 - KIN -1664446
       function GetSequence                    ( Sufixo          : string)        : integer;
implementation

uses uMensErro;

// *****************************************************************************
// *********************** ROTINA PRINCIPAL ************************************
// *****************************************************************************
function AtualizaDadosPrevFuncionario( piIdFundacao, piIdPessoa : longint ) : boolean;
var qryElegivel : TwwQuery;
begin
   Result := False;

   qryElegivel              := TwwQuery.Create(Application);
   qryElegivel.DatabaseName := 'BaseDados';

   // Verificar se pessoa é elegivel da fundacao
   with qryElegivel do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT EL.MATRICULA '+
              ' FROM   ELEGPATRO EL '+
              ' WHERE  (EL.IDPESSJUR = ' + IntToStr(piIdFundacao) + ' ) ' +
              ' AND ((EL.IDPESSJURCEDIDO IS NULL) ' +
              ' OR  (EL.IDPESSJURCEDIDO = ' + IntToStr(piIdFundacao) + ' )) ' +
              ' AND (EL.IDPESSOA  = ' + IntToStr(piIdPessoa) + ' ) ' );
      Open;

      if qryElegivel.IsEmpty
      then begin
         if not InsereFuncionarioElegivel ( piIdFundacao, piIdPessoa )
         then begin
            qryElegivel.Free;
            Exit;
         end;
      end
      else begin
         if not AlteraFuncionarioElegivel ( piIdFundacao, piIdPessoa )
         then begin
            qryElegivel.Free;
            Exit;
         end;
      end;
   end;
   qryElegivel.Free;
   Result := True;
end;

function AtualizaFaixasSalariais      ( piIdFundacao             : longint) : boolean;
var qryFaixasRH,
    qryFaixasPREV : TwwQuery;
    iIdCargoRH,
    iIdCargoExt   : longint;
    iFaixa        : word;
    sIdNivel      : string;
begin
   Result := False;

   qryFaixasRH                := TwwQuery.Create(Application);
   qryFaixasRH.DatabaseName   := 'BaseDados';
   qryFaixasPREV              := TwwQuery.Create(Application);
   qryFaixasPREV.DatabaseName := 'BaseDados';

   // Verificar se pessoa é elegivel da fundacao
   with qryFaixasRH do
   begin
      // Trazer todos os cargos e suas faixas
      Close;
      SQL.Clear;
      SQL.Add(' SELECT C.IDCARGO, F.IDFAIXASALARIAL, F.STEP1, F.STEP2, F.STEP3, '+
 //             '        F.STEP4,   F.STEP5, F.STEP6,  F.STEP7, F.STEP8, F.STEP9, '+
 //             '        F.DATAEFETIV                                             '+


              '   F.STEP4, F.STEP5, F.STEP6, F.STEP7, F.STEP8, F.STEP9, F.Step10, F.Step11, '+ //Douglas.Siqueira SOL 171426 Kintana 1537613
              '   F.Step12,F.Step13,F.Step14,F.Step15,F.Step16,F.Step17,F.Step18,F.Step19,F.Step20, '+//Douglas.Siqueira SOL 171426 Kintana 1537613
              '   F.DATAEFETIV                                             '+


              ' FROM   CARGO C, FAIXASAL F                                      '+
              ' WHERE  F.IDFAIXASALARIAL = C.IDFAIXASALARIAL                    '+
              ' UNION  SELECT C.IDCARGO, F.IDFAIXASALARIAL, F.STEP1, F.STEP2, F.STEP3, '+
 //             '        F.STEP4,   F.STEP5, F.STEP6,  F.STEP7, F.STEP8, F.STEP9, '+
//              '        F.DATAEFETIV                                             '+

              '   F.STEP4, F.STEP5, F.STEP6, F.STEP7, F.STEP8, F.STEP9,F.Step10,F.Step11, '+ //Douglas.Siqueira SOL 171426 Kintana 1537613
              '   F.Step12,F.Step13,F.Step14,F.Step15,F.Step16,F.Step17,F.Step18,F.Step19,F.Step20, '+//Douglas.Siqueira SOL 171426 Kintana 1537613
              '   F.DATAEFETIV                                             '+

              ' FROM   FUNCIONARIO C, FAIXASAL F                                '+
              ' WHERE  F.IDFAIXASALARIAL = C.IDFAIXACARGO                       '+
              ' ORDER BY IDCARGO ');
      Open;
      while not Eof do
      begin
         iIdCargoRH := FieldByName('IDCARGO').AsInteger;

         while (not Eof) and (iIdCargoRH = FieldByName('IDCARGO').AsInteger) do
         begin
            // Verificar se cargo já existe
            qryFaixasPREV.Close;
            qryFaixasPREV.SQL.Clear;
            qryFaixasPREV.SQL.Add('SELECT C.IDCARGOEXT FROM CARGOEXT C '+
                                  'WHERE (IDPESSJUR = ' +IntToStr(piIdFundacao)+ ')'+
                                  'AND   RTRIM(C.CODIGO) = '''+IntToStr(iIdCargoRH)+'''');
            qryFaixasPREV.Open;

            if qryFaixasPREV.IsEmpty
            then begin
               iIdCargoExt := iIdCargoRH;
               if not ProcessaDE_PARA_CARGO ( piIdFundacao, -1, -1, 'C', iIdCargoExt)
               then begin
                  qryFaixasRH.Free;
                  qryFaixasPREV.Free;
                  Exit;
               end;
            end
            else iIdCargoExt := qryFaixasPREV.FieldByName('IDCARGOEXT').AsInteger;

            // Verificar se faixa salarial existe
            for iFaixa := 1 to 20 {9} do  //Douglas.Siqueira SOL 171426 Kintana 1537613
            begin
               sIdNivel := Trim(FieldByName('IDFAIXASALARIAL').AsString)+'0'+IntToStr(iFaixa);

               // Verificar se nivel existe
               qryFaixasPREV.Close;
               qryFaixasPREV.SQL.Clear;
               qryFaixasPREV.SQL.Add(' SELECT IDNIVEL FROM NIVEL WHERE (IDNIVEL = '+sIdNivel+
                 ') AND (IDPESSJUR = ' +IntToStr(piIdFundacao)+ ')');
               qryFaixasPREV.Open;
               if qryFaixasPrev.IsEmpty
               then begin
                  qryFaixasPREV.Close;
                  qryFaixasPREV.SQL.Clear;
                  qryFaixasPREV.SQL.Add(' INSERT INTO NIVEL (IDPESSJUR, IDNIVEL, CODIGO) '+
                                        ' VALUES ( '+IntToStr(piIdFundacao)+','+
                                                     sIdNivel             +','+
                                                     ''''+sIdNivel        +''') ');
                  try
                     qryFaixasPREV.ExecSQL;
                  except
                     qryFaixasRH.Free;
                     qryFaixasPREV.Free;
                     Exit;
                  end;
               end;

               // Verificar se existe cargoxnivel
               qryFaixasPREV.Close;
               qryFaixasPREV.SQL.Clear;
               qryFaixasPREV.SQL.Add(' SELECT IDNIVEL FROM CARGOXNIVEL '+
                                     ' WHERE  IDCARGOEXT = '+IntToStr(iIdCargoExt)+
                                     ' AND    IDNIVEL    = '+sIdNivel+
                                     ' AND    IDPESSJUR  = '+IntToStr(piIdFundacao));
               qryFaixasPREV.Open;
               if qryFaixasPREV.IsEmpty
               then begin
                  qryFaixasPREV.Close;
                  qryFaixasPREV.SQL.Clear;
                  qryFaixasPREV.SQL.Add(' INSERT INTO CARGOXNIVEL (IDPESSJUR,  '+
                                        ' IDCARGOEXT, IDPESSJURNIVEL, IDNIVEL, '+
                                        ' DATAVIGENCIA, DATAFIM )              '+
                                        ' VALUES ('+IntToStr(piIdFundacao)+','+
                                                    IntToStr(iIdCargoext)+','+
                                                    IntToStr(piIdFundacao)+','+
                                                    sIdNivel             +','+
                                                    'TO_DATE('''+FieldByName('DATAEFETIV').AsString+''',''DD/MM/YYYY''), '+
                                                    'NULL )');
                  try
                     qryFaixasPREV.ExecSQL;
                  except
                     qryFaixasRH.Free;
                     qryFaixasPREV.Free;
                     Exit;
                  end;
               end;

               qryFaixasPREV.Close;
               qryFaixasPREV.SQL.Clear;
               qryFaixasPREV.SQL.Add(' SELECT VALOR FROM FAIXANIVEL '+
                                     ' WHERE  IDNIVEL        = '+sIdNivel +
                                     ' AND    DATAEFETIVACAO = TO_DATE('''+FieldByName('DATAEFETIV').AsString+''',''DD/MM/YYYY'')'+
                                     ' AND    IDPESSJUR      = ' +IntToStr(piIdFundacao));
               qryFaixasPREV.Open;

               if qryFaixasPREV.IsEmpty
               then begin
                  if FieldByName('STEP'+IntToStr(iFaixa)).AsFloat > 0
                  then begin
                     qryFaixasPREV.Close;
                     qryFaixasPREV.SQL.Clear;
                     qryFaixasPREV.SQL.Add(' INSERT INTO FAIXANIVEL (IDPESSJUR,              '+
                                           ' IDNIVEL, IDFAIXASALEXT, DATAEFETIVACAO, VALOR ) '+
                                           ' VALUES ( '+IntToStr(piIdFundacao)+','+
                                                        sIdNivel             +','+
                                                        IntToStr(LeUltRegistro(Nil,'FAIXANIVEL')) +','+
                                                      'TO_DATE('''+FieldByName('DATAEFETIV').AsString+''',''DD/MM/YYYY''), '+
                                                      OraNumero(FieldByName('STEP'+IntToStr(iFaixa)).AsString)+')');
                     try
                        qryFaixasPREV.ExecSQL;
                     except
                        qryFaixasRH.Free;
                        qryFaixasPREV.Free;
                        Exit;
                     end;
                  end;
               end
               else begin
                  if  qryFaixasPREV.FieldByName('VALOR').AsString <> FieldByName('STEP'+IntToStr(iFaixa)).AsString
                  then begin // faixa foi apenas alterada
                     qryFaixasPREV.Close;
                     qryFaixasPREV.SQL.Clear;
                     qryFaixasPREV.SQL.Add(' UPDATE FAIXANIVEL SET VALOR = '+ OraNumero(FieldByName('STEP'+IntToStr(iFaixa)).AsString)+
                                           ' WHERE  IDPESSJUR = '+IntToStr(piIdFundacao)+
                                           ' AND    IDNIVEL   = '+sIdNivel              +
                                           ' AND    DATAEFETIVACAO = TO_DATE('''+FieldByName('DATAEFETIV').AsString+''',''DD/MM/YYYY'') ');
                     try
                        qryFaixasPREV.ExecSQL;
                     except
                        qryFaixasRH.Free;
                        qryFaixasPREV.Free;
                        Exit;
                     end;
                  end;
               end;
            end; // for
            Next;
         end; // while 2
      end; // while 1
   end;
   qryFaixasRH.Free;
   qryFaixasPREV.Free;
   Result := True;
end;

// *****************************************************************************
// *********************** ROTINAS AUXILIARES***********************************
// *****************************************************************************
function OraNumero(sNumero : string):string;
var i : integer;
    sResult,
    sOra : string;
    bPrimPonto : boolean;
begin
   if Trim(sNumero)  = ''
   then begin
      Result := '0';
      exit;
   end;
   sOra := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = ','
     then begin
        if not bPrimPonto
        then begin
           sOra := sOra + '.';
           bPrimPonto := True;
        end
        else sOra := sOra;
     end
     else begin
        if sNumero[i] <> '.'
        then sOra := sOra + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sOra := sOra+'.';
              bPrimPonto := True;
           end
           else sOra := sOra;
        end;
     end;
   end;
   sResult := '';
   for i := length(sOra) downto 1
   do begin
      sResult := sResult + sOra[i];
   end;
   Result := sResult;
end;

function InsereCriticaInterface (qryAux            : TwwQuery;
                                 piIdFundacao,
                                 piIdPessoa        : longint;
                                 psValorNoRH,
                                 psValorNoAdmPREV,
                                 psMatricula,
                                 psCodErro,
                                 psTipoDado       : string       ) : boolean;
var iSeqCritica : longint;
begin
   Result := False;
  //INICIO - André Oliveira SOL - 155521/9643 - KIN -1664446
   {qryaux.Close;
   qryaux.sql.Clear;
   qryaux.sql.Add(' SELECT MAX(SEQCRITICA) SEQCRITICA FROM TABCRITICASCCP ');
   qryAux.Open;


   if qryAux.IsEmpty
   then iSeqCritica := 1
   else  iSeqCritica := qryAux.FieldByName('SEQCRITICA').AsInteger + 1;
    }
   iSeqCritica := GetSequence('TABCRITICASCCP');
   // FIM - André Oliveira SOL - 155521/9643 - KIN -1664446
   qryAux.Close;
   qryAux.sql.Clear;
   qryAux.sql.Add(' INSERT INTO TABCRITICASCCP (IDPESSJUR , IDPESSOA , SEQCRITICA, MESCOBRANCA, '+
                  ' VALORCHAVE , VALORNAFUNDACAO , VALORNOINTERFACE, CHAVE, CODERRO, TIPODADO, GRUPO, '+
                  ' FLGPROCESSADO, DTPROCESSADO ) '+
                  ' VALUES ('  + IntToStr(piIdFundacao) +', '+
                                 IntToStr(piIdPessoa)   +', '+
                                 IntToStr(iSeqCritica)  +', '+
                                 ''''+Copy(DateToStr(date),7,4)+Copy(DateToStr(date),4,2)+''','+
                                 ''''+psMatricula       +''', '+
                                 ''''+psValorNoAdmPREV  +''', '+
                                 ''''+psValorNoRH       +''', '+
                                 '''M'''                +',   '+
                                 psCodErro              +',   '+
                                 ''''+psTipoDado        +''', '+
                                 '''R'''                +',   '+
                                 '0'                    +',   '+
                                 'SYSDATE ) ');

   try
      qryAux.ExecSQL;
   except
      Exit;
   end;

   Result := True;
end;


function ProcessaDE_PARA_CARGO     ( piIdFundacao, piIdPessoa, piIdCargoElegPatro : longint; pcTipo : char; var piIdCargo : longint ) : boolean;
var qryAux       : TwwQuery;
    iIdPCS,
    iIdCargoOriginal,
    iIdCargoPrev : longint;
    sDataAlterFunc,
    sSQL         : string;
begin
   Result := False;

   if piIdCargo <= 0
   then begin
      Result := True;
      Exit;
   end;

   iIdCargoOriginal         := piIdCargo;
   qryAux                   := TwwQuery.Create(Application);
   qryAux.DatabaseName      := 'BaseDados';

   // Verificar se cargo está na tabela CARGOEXT
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT C.IDCARGOEXT FROM CARGOEXT C '+
                  'WHERE (IDPESSJUR = ' +IntToStr(piIdFundacao)+ ')'+
                  'AND   RTRIM(C.CODIGO) = '''+IntToStr(piIdCargo)+'''');

   qryAux.Open;

   if not qryAux.IsEmpty
   then begin
      piIdCargo := qryAux.FieldByName('IDCARGOEXT').AsInteger;
   end
   else begin
      // Cargo não está na tabela CARGOEXT. O cargo deverá ser inserido na tabela de cargos
      // Buscar PCS válido no momento
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT P.IDPCS '+
                     ' FROM   PCS P    '+
                     ' WHERE  P.IDPESSJUR = '+IntToStr(piIdFundacao)+
                     ' AND    P.FINALVIGENCIA IS NULL ');
      qryAux.Open;

      if not qryAux.IsEmpty
      then iIdPCS := qryAux.FieldByName('IDPCS').AsInteger
      else iIdPCS := -1;

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT C.IDCARGO, C.TITULO, C.DESCRICAO, C.CBO, C.IDFAIXASALARIAL, C.CODNIVEL '+
                     ' FROM   CARGO C                                                                '+
                     ' WHERE  C.IDCARGO  = '+IntToStr(piIdCargo));
      qryAux.Open;

      iIdCargoPrev := LeUltRegistro(nil, 'CARGOEXT');
      piIdCargo    := iIdCargoPrev;

      sSQL := ' INSERT INTO CARGOEXT ( IDCARGOEXT,  IDFAIXASALEXT, TITULO,   CBO,             '+
              '                        DESCRICAO,   IDPESSJUR,     IDPCS,    IDCARREIRA,      '+
              '                        TIPO,        JORNADA,       FLGATIVO, IDTIPOFUNC,      '+
              '                        CODIGO,      NOMERESUMIDO,  FLGPCC,   IDCARGOCORRESP,  '+
              '                        DATACRIACAO, ANOMESALT,     ULTMESPROC )               '+
              ' VALUES (';

      sSQL := sSQL + IntToStr(iIdCargoPrev)+', ';
      sSQL := sSQL + ' NULL, '; // idfaixasalext não é usado
      sSQL := sSQL + ''''+qryAux.FieldbyName('TITULO').AsString+''', ';
      if qryAux.FieldbyName('CBO').AsString = '' then
        sSQL := sSQL + ' NULL, '
      else
        sSQL := sSQL + qryAux.FieldbyName('CBO').AsString+', ';
      sSQL := sSQL + ' NULL, '; // descricao é um campo memo
      sSQL := sSQL + IntToStr(piIdFundacao)+',';

      if iIdPCS > 0
      then sSQL := sSQL + IntToStr(iIdPCS)+','
      else sSQL := sSQL + ' NULL, ';

      sSQL := sSQL + ' NULL, ';
      sSQL := sSQL + ''''+pcTipo+''', '; 
      sSQL := sSQL + ' NULL, ';
      sSQL := sSQL + ' 1, ';
      sSQL := sSQL + ' NULL, ';
      sSQL := sSQL + IntToStr(piIdCargo)+', ';
      sSQL := sSQL + ' NULL, ';
      sSQL := sSQL + ' 0, ';
      sSQL := sSQL + ' NULL, ';
      sSQL := sSQL + ' TO_DATE('''+DateToStr(date)+''', ''DD/MM/YYYY''), ';
      sSQL := sSQL + ' ''0000/00'', ';
      sSQL := sSQL + ' ''0000/00''  ';

      sSQL := sSQL + ' ) ';

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(sSQL);

      try
         qryAux.ExecSQL;
      except
         qryAux.Free;
         Exit;
      end;
   end; // else

   if piIdPessoa <= 0
   then begin
      qryAux.Free;
      Result := True;
      exit
   end;
   // Inserir CARGO na tabela EVOLFUNCPREV
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT MAX(E.DATAALTERFUNC) AS DATAALTERFUNC '+
              ' FROM   EVOLFUNC E, MOTIVO M                  '+
              ' WHERE  E.IDPESSOA = '+IntToStr(piIdPessoa)   );
      if pcTipo = 'C'
      then SQL.Add('AND    E.IDCARGO  = '+IntToStr(iIdCargoOriginal))
      else SQL.Add('AND    E.IDFUNCAO = '+IntToStr(iIdCargoOriginal));

      SQL.Add(' AND    M.IDMOTIVO = E.IDMOTIVO '+
              ' AND    M.GRUPOMOTIVO = ''A'' ');
      Open;

      if IsEmpty or (FieldByName('DATAALTERFUNC').AsString = '')
      then begin
         qryAux.Free;
         Result := True;
         Exit;
      end;

      sDataAlterFunc := FieldbyName('DATAALTERFUNC').AsString;

      // Atualizar cargo/função anterior com datafinal = (data inicio do novo cargo) - 1
      sSQL := ' UPDATE EVOLFUNCPREV SET DATAFINAL = TO_DATE('''+DateToStr(StrToDate(sDataAlterFunc) - 1)+''', ''DD/MM/YYYY'') '+
              ' WHERE  IDPESSJUR  = '+IntToStr(piIdFundacao)+
              ' AND    IDPESSOA   = '+IntToStr(piIdPessoa);
      if pcTipo = 'C'
      then sSQL := sSQL + ' AND    IDCARGOEXT = '+IntToStr(piIdCargoElegPatro)
      else sSQL := sSQL + ' AND    IDFUNCAO   = '+IntToStr(piIdCargoElegPatro);

      sSQL := sSQL + ' AND DATAINICIO = ( SELECT MAX(DATAINICIO) '+
              '                           FROM   EVOLFUNCPREV    '+
              '                           WHERE  IDPESSJUR  = '+IntToStr(piIdFundacao)+
              '                           AND    IDPESSOA   = '+IntToStr(piIdPessoa) ;
      if pcTipo = 'C'
      then sSQL := sSQL + '               AND    IDCARGOEXT = '+IntToStr(piIdCargoElegPatro)
      else sSQL := sSQL + '               AND    IDFUNCAO   = '+IntToStr(piIdCargoElegPatro);

      sSQL := sSQL + '                  ) ';

      Close;
      SQL.Clear;
      SQL.Add(sSQL);
   end; // with

   try
      qryAux.ExecSQL;
   except
      qryAux.Free;
      Exit;
   end;


   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT SEQHISTFUNC FROM EVOLFUNCPREV '+
              ' WHERE  IDPESSOA = '+IntToStr(piIdPessoa));
      if pcTipo = 'C'
      then SQL.Add(' AND    IDCARGOEXT = '+IntToStr(piIdCargo))
      else SQL.Add(' AND    IDFUNCAO   = '+IntToStr(piIdCargo));
         SQL.Add(' AND DATAINICIO = TO_DATE('''+sDataAlterFunc+''', ''DD/MM/YYYY'') ');
      Open;

      if not IsEmpty
      then begin
         qryAux.Free;
         Result := True;
         Exit;
      end;

      sSQL := ' INSERT INTO EVOLFUNCPREV ( DATAINICIO,  DATAFINAL,    IDPESSJURCG, IDCARGOEXT,  '+
              '                            IDPESSJURFG, IDFUNCAO,     IDPESSJURGR, IDGRUPOFUNC, '+
              '                            IDPESSJUR,   IDPESSOA,     MODOFUNCAO,   ORIGEM,     '+
              '                            PERCADNOT,   PERCATS,      PERCADICIONALNOT,         '+
              '                            PERCFUNCAO,  PERCINSALUB,  PERCPERICUL,              '+
              '                            PERC1AC,     PERC2AC,      QTDEMINUTOS,              '+
              '                            SEQHISTFUNC                                          )'+
              ' VALUES ( ';
      sSQL := sSQL +' TO_DATE('''+sDataAlterFunc+''', ''DD/MM/YYYY''), '; // DATAINICIO
      sSQL := sSQL +' NULL, ';                                            // DATAFINAL
      if pcTipo = 'C'
      then begin
         sSQL := sSQL +IntToStr(piIdFundacao)+' , ';                      // IDPESSJURCG
         sSQL := sSQL +IntToStr(piIdCargo)+' , ';                         // IDCARGOEXT
         sSQL := sSQL +' NULL, ';                                         // IDPESSJURFG
         sSQL := sSQL +' NULL, ';                                         // IDFUNCAO
         sSQL := sSQL +' NULL, ';                                         // IDPESSJURGR
         sSQL := sSQL +' NULL, ';                                         // IDGRUPOFUNC
      end
      else begin
         sSQL := sSQL +' NULL, ';                                         // IDPESSJURCG
         sSQL := sSQL +' NULL, ';                                         // IDCARGOEXT
         sSQL := sSQL +IntToStr(piIdFundacao)+' , ';                      // IDPESSJURFG
         sSQL := sSQL +IntToStr(piIdCargo)+' , ';                         // IDFUNCAO
         sSQL := sSQL +' NULL, ';                                         // IDPESSJURGR
         sSQL := sSQL +' NULL, ';                                         // IDGRUPOFUNC
      end;

      sSQL := sSQL +IntToStr(piIdFundacao)+' , ';                         // IDPESSJUR
      sSQL := sSQL +IntToStr(piIdPessoa)+', ';                            // IDPESSOA

      if pcTipo = 'C'
      then sSQL := sSQL +' NULL, '                                        // MODOFUNCAO
      else sSQL := sSQL +' ''ES'', ';                                     // MODOFUNCAO : ES = EVENTUAL/SUBSTITUIÇÃO

      sSQL := sSQL +'''I'', ';                                            // ORIGEM
      sSQL := sSQL +' NULL, ';                                            // PERCADNOT
      sSQL := sSQL +' NULL, ';                                            // PERCATS
      sSQL := sSQL +' NULL, ';                                            // PERCADICIONALNOT
      sSQL := sSQL +' NULL, ';                                            // PERCFUNCAO
      sSQL := sSQL +' NULL, ';                                            // PERCINSALUB
      sSQL := sSQL +' NULL, ';                                            // PERCPERICUL
      sSQL := sSQL +' NULL, ';                                            // PERC1AC
      sSQL := sSQL +' NULL, ';                                            // PERC2AC
      sSQL := sSQL +' NULL, ';                                            // QTDEMINUTOS
      sSQL := sSQL + IntToStr(LeUltRegistro(nil,'EVOLFUNCPREV'));         // SEQHISTFUNC
      sSQL := sSQL + ')';

      Close;
      SQL.Clear;
      SQL.Add(sSQL);
   end; // with

   try
      qryAux.ExecSQL;
   except
      qryAux.Free;
      Exit;
   end;

   qryAux.Free;
   Result := True;
end;

function ProcessaDE_PARA_CONTABANCARIA( piIdPessoa, piIdAgencia : longint; psNumConta : string ) : boolean;
var qryAux : TwwQuery;
    sSQL   : string;
begin
   Result := False;
   qryAux                   := TwwQuery.Create(Application);
   qryAux.DatabaseName      := 'BaseDados';

   // Verificar se conta bancária está na tabela CONTABANCARIA
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT  C.IDCBANCARIA,  C.CONTACORRENTE, C.IDAGENCIA,    '+
                  '         C.FLGCONTAPREF, C.IDPESSOA,      C.TIPOCONTA,    '+
                  '         C.FLGCONTACONJUNTA                               '+
                  ' FROM    CONTABANCARIA C '+
                  ' WHERE   C.IDPESSOA  = '+IntToStr(piIdPessoa));
   qryAux.Open;

   if qryAux.IsEmpty
   then begin // pessoa nao tem contabancaria cadastrada
      sSQL := ' INSERT INTO CONTABANCARIA (IDCBANCARIA, CONTACORRENTE, IDAGENCIA, '+
              '             FLGCONTAPREF,  IDPESSOA,    TIPOCONTA,     FLGCONTACONJUNTA) '+
              ' VALUES ( '+IntToStr(LeUltRegistro(nil, 'CONTABANCARIA'))+','+
                           ''''+psNumConta+''', '+
                           IntToStr(piIdAgencia)+','+
                           '1, '+
                           IntToStr(piIdPessoa)+','+
                           '''0'', ''N'') ';
   end
   else begin // pessoa já tem conta bancaria
      if ((qryAux.FieldByName('IDAGENCIA').AsInteger =  piIdAgencia) and (qryAux.FieldByName('CONTACORRENTE').AsString <> psNumConta)) OR
         ((qryAux.FieldByName('IDAGENCIA').AsInteger <> piIdAgencia) and (qryAux.FieldByName('CONTACORRENTE').AsString =  psNumConta))
      then begin // pessoa apenas mudou de agencia ou conta
         sSQL := ' UPDATE CONTABANCARIA SET IDAGENCIA = '+IntToStr(piIdAgencia)+', CONTACORRENTE = '''+psNumConta+''''+
                 ' WHERE  IDCBANCARIA = '+qryAux.FieldByName('IDCBANCARIA').AsString;
      end
      else begin // pessoa tem uma nova conta bancaria
         // Alterar a conta anterior para NAO-PREFERENCIAL e inserir a nova como PREFERENCIAL
         sSQL := ' UPDATE CONTABANCARIA SET FLGCONTAPREF = 0 '+
                 ' WHERE  IDCBANCARIA = '+qryAux.FieldByName('IDCBANCARIA').AsString;
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(sSQL);
         try
            qryAux.ExecSQL;
         except
            qryAux.Free;
            Exit;
         end;
         sSQL := ' INSERT INTO CONTABANCARIA (IDCBANCARIA, CONTACORRENTE, IDAGENCIA, '+
                 '             FLGCONTAPREF,  IDPESSOA,    TIPOCONTA,     FLGCONTACONJUNTA) '+
                 ' VALUES ( '+IntToStr(LeUltRegistro(nil, 'CONTABANCARIA'))+','+
                              ''''+psNumConta+''', '+
                              IntToStr(piIdAgencia)+','+
                              '1, '+
                              IntToStr(piIdPessoa)+','+
                              '''0'', ''N'') ';
      end;
   end;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSQL);
   try
      qryAux.ExecSQL;
   except
      qryAux.Free;
      Exit;
   end;

   qryAux.Free;
   Result := True;
end;

function InsereFuncionarioElegivel ( piIdFundacao, piIdPessoa : longint ) : boolean;
var qryElegivel : TwwQuery;
    sSQL        : string;
    iIdCargo,
    iIdFuncao   : longint;
begin
   Result := False;

   qryElegivel              := TwwQuery.Create(Application);
   qryElegivel.DatabaseName := 'BaseDados';

   with qryElegivel do
   begin

      // Inserir pessoa na tabela ELEGIVEL
      Close;
      SQL.Clear;
      SQL.Add(' INSERT INTO ELEGIVEL (IDPESSOA) VALUES ('+IntToStr(piIdPessoa)+') ');

      try
         ExecSQL;
      except
         //qryElegivel.Free;
         //Exit; Eugenio 08/11/02
      end;

      // Buscar dados da pessoa a inserir
      Close;
      SQL.Clear;
      SQL.Add(' SELECT IDPESSOA,       IDSITFUNC,    IDEMPRESA AS IDEMPRESAPROP, CODCENTROCUSTO, MATRICULA,      '+
              '        DATAADMISSAO,   DATADESLIGAMENTO AS DATADEMISSAO, SALARIOATUAL AS SALTOTAL,               '+
              '        DATARETORNO AS  DATAREADMISSAO,                                                           '+
              '        IDESTAB,        IDCARGO,      IDFUNCAO,           IDFAIXACARGO,   IDFAIXAFUNCAO,          '+
              '        NIVELINDIV1,    NIVELINDIV2,  IDAGENCIASALARIO,   IDAGENCIAFGTS,  NUMCONTASALARIO,        '+
              '        NUMCONTAFGTS                                                                              '+
              ' FROM   FUNCIONARIO  F                                                                            '+
              ' WHERE  IDPESSOA = '+IntToStr(piIdPessoa));
      Open;

      iIdCargo := FieldByName('IDCARGO').AsInteger;
      if not ProcessaDE_PARA_CARGO ( piIdFundacao, piIdPessoa, -1, 'C', iIdCargo )
      then begin
         qryElegivel.Free;
         Exit;
      end;

      iIdFuncao := FieldByName('IDFUNCAO').AsInteger;
      if not ProcessaDE_PARA_CARGO ( piIdFundacao, piIdPessoa, -1, 'F', iIdFuncao )
      then begin
         qryElegivel.Free;
         Exit;
      end;

      if not ProcessaDE_PARA_CONTABANCARIA( piIdPessoa, FieldByName('IDAGENCIASALARIO').AsInteger, FieldByName('NUMCONTASALARIO').AsString)
      then begin
         qryElegivel.Free;
         Exit;
      end;

      // Inserir pessoa na tabela ELEGPATRO
      sSQL := ' INSERT INTO ELEGPATRO                                                            '+
              '  (IDPESSJUR,         IDPESSOA,          IDSITFUNC,        IDEMPRESAPROP,    CODCENTROCUSTO, MATRICULA,      '+
              '   DATAADMISSAO,      DATADEMISSAO,      SALTOTAL,         DATAREADMISSAO,   IDESTAB,                        '+
              '   IDPESSJURCARGO,    IDCARGOEXT,        IDPESSJURFUNC,    IDFUNCAOEXT,                                      '+
              '   PARTICIPPREVID,    PARTICIPASSIST,    NIVEL,            DATAINICIOAFAST,  DATAFIMAFAST,                   '+
              '   TEMPONAOCREDITADO, TEMPOSERVANTERIOR, TEMPOSERVANTREAL, TEMPOSITESPECIAL,                                 '+
              '   VALORBASE1,        VALORBASE2,        VALORBASE3,       IDPESSJURORGAO,                                   '+
              '   SIGLA,             FLGDIRETOR,        CODVINCULAFUNC) '+
              ' VALUES ( '+IntToStr(piIdFundacao) +','+IntToStr(piIdPessoa)+',';

      if Trim(FieldByName('IDSITFUNC').AsString) <> ''
      then sSQL := sSQL + FieldByName('IDSITFUNC').AsString+','
      else sSQL := sSQL + ' NULL ,';

      if Trim(FieldByName('IDEMPRESAPROP').AsString) <> ''
      then sSQL := sSQL + FieldByName('IDEMPRESAPROP').AsString+','
      else sSQL := sSQL + ' NULL ,';

      if Trim(FieldByName('CODCENTROCUSTO').AsString) <> ''
      then sSQL := sSQL + ''''+FieldByName('CODCENTROCUSTO').AsString+''','
      else sSQL := sSQL + ' NULL ,';

      if Trim(FieldByName('MATRICULA').AsString) <> ''
      then sSQL := sSQL + ''''+FieldByName('MATRICULA').AsString+''','
      else sSQL := sSQL + ' NULL ,';

      if Trim(FieldByName('DATAADMISSAO').AsString) <> ''
      then sSQL := sSQL + 'TO_DATE('''+FieldByName('DATAADMISSAO').AsString+''',''DD/MM/YYYY''), '
      else sSQL := sSQL + ' NULL ,';

      if Trim(FieldByName('DATADEMISSAO').AsString) <> ''
      then sSQL := sSQL + 'TO_DATE('''+FieldByName('DATADEMISSAO').AsString+''',''DD/MM/YYYY''), '
      else sSQL := sSQL + ' NULL ,';

      if Trim(FieldByName('SALTOTAL').AsString) <> ''
      then sSQL := sSQL + OraNumero(FieldByName('SALTOTAL').AsString)+', '
      else sSQL := sSQL + ' NULL ,';

      if Trim(FieldByName('DATAREADMISSAO').AsString) <> ''
      then sSQL := sSQL + 'TO_DATE('''+FieldByName('DATAREADMISSAO').AsString+''',''DD/MM/YYYY''), '
      else sSQL := sSQL + ' NULL ,';

      if Trim(FieldByName('IDESTAB').AsString) <> ''
      then sSQL := sSQL + FieldByName('IDESTAB').AsString+','
      else sSQL := sSQL + ' NULL ,';

      if iIdCargo > 0
      then begin
         sSQL := sSQL + IntToStr(piIdFundacao)+',';
         sSQL := sSQL + IntToStr(iIdCargo)+',';
      end
      else begin
         sSQL := sSQL + ' NULL ,';
         sSQL := sSQL + ' NULL ,';
      end;

      if iIdFuncao > 0
      then begin
         sSQL := sSQL + IntToStr(piIdFundacao)+',';
         sSQL := sSQL + IntToStr(iIdFuncao)+',';
      end
      else begin
         sSQL := sSQL + ' NULL ,';
         sSQL := sSQL + ' NULL ,';
      end;

      sSQL := sSQL + ' 0 ,';    // PARTICIPPREVID
      sSQL := sSQL + ' 0 ,';    // PARTICIPASSIST
      sSQL := sSQL + ' NULL ,'; // NIVEL
      sSQL := sSQL + ' NULL ,'; // INICIOAFAST
      sSQL := sSQL + ' NULL ,'; // FIMAFAST

      sSQL := sSQL + ' 0 ,';    // TEMPONAOCREDITADO
      sSQL := sSQL + ' 0 ,';    // TEMPOSERVANTERIOR
      sSQL := sSQL + ' 0 ,';    // TEMPOSERVANTREAL
      sSQL := sSQL + ' 0 ,';    // TEMPOSITESPECIAL
      sSQL := sSQL + ' NULL ,'; // VALORBASE1
      sSQL := sSQL + ' NULL ,'; // VALORBASE2
      sSQL := sSQL + ' NULL ,'; // VALORBASE3

      sSQL := sSQL + ' NULL ,'; // IDPESSJURORGAO
      sSQL := sSQL + ' NULL ,'; // SIGLA
      sSQL := sSQL + ' 0,';     // FLGDIRETOR
      sSQL := sSQL + ' NULL  '; // CODVINCULAFUNC

      sSQL := sSQL + ' ) ';

      Close;
      SQL.Clear;
      SQL.Add(sSQL);

      try
         ExecSQL;
      except
         qryElegivel.Free;
         Exit;
      end;


   end;

   qryElegivel.Free;
   Result := True;
end;

function AlteraFuncionarioElegivel( piIdFundacao, piIdPessoa : longint ) : boolean;
var sSQL : string;
    qryAux,
    qryElegivel,
    qryFuncionario : TwwQuery;
    iIdCargo       : longint;
begin
   Result := False;
   sSQL := '';

   qryAux                      := TwwQuery.Create(Application);
   qryAux.DatabaseName         := 'BaseDados';

   qryElegivel                 := TwwQuery.Create(Application);
   qryElegivel.DatabaseName    := 'BaseDados';

   qryFuncionario              := TwwQuery.Create(Application);
   qryFuncionario.DatabaseName := 'BaseDados';

   with qryFuncionario do
   begin
      // Buscar dados da pessoa na tabela de funcionario
      Close;
      SQL.Clear;
      SQL.Add(' SELECT F.IDPESSOA,       F.IDSITFUNC,    F.IDEMPRESA AS IDEMPRESAPROP, F.CODCENTROCUSTO, F.MATRICULA,  '+
              '        F.DATAADMISSAO,   F.DATADESLIGAMENTO AS DATADEMISSAO, F.SALARIOATUAL AS SALTOTAL,               '+
              '        F.DATARETORNO AS  DATAREADMISSAO,                                                               '+
              '        F.IDESTAB,        F.IDCARGO,      F.IDFUNCAO,           F.IDFAIXACARGO,   F.IDFAIXAFUNCAO,      '+
              '        F.NIVELINDIV1,    F.NIVELINDIV2,  F.IDAGENCIASALARIO,   F.NUMCONTASALARIO,                      '+
              '        C.IDCARGO AS CODCARGO                                                                           '+
              ' FROM   CARGO C, FUNCIONARIO  F                                                                         '+
              ' WHERE  F.IDPESSOA = '+IntToStr(piIdPessoa)+
              ' AND    F.IDCARGO  = C.IDCARGO(+) ');
      Open;
   end;

   with qryElegivel do
   begin
      // Buscar dados da pessoa na tabela de elegpatro
      Close;
      SQL.Clear;
      SQL.Add(' SELECT EL.IDPESSOA,       EL.IDSITFUNC,    EL.IDEMPRESAPROP, EL.CODCENTROCUSTO, EL.MATRICULA,          '+
              '        EL.DATAADMISSAO,   EL.DATADEMISSAO, EL.SALTOTAL,                                                '+
              '        EL.DATAREADMISSAO,                                                                              '+
              '        EL.IDESTAB,        EL.IDCARGOEXT,      EL.IDFUNCAOEXT, C.IDAGENCIA, C.CONTACORRENTE,            '+
              '        CEXT.CODIGO AS CODCARGO                                                                         '+
              ' FROM   CONTABANCARIA C, CARGOEXT CEXT, ELEGPATRO EL                                                    '+
              ' WHERE  EL.IDPESSJUR = '+IntToStr(piIdFundacao)+
              ' AND    EL.IDPESSOA  = '+IntToStr(piIdPessoa)+
              ' AND    EL.IDPESSOA  = C.IDPESSOA(+)                                                                    '+
              ' AND    EL.IDCARGOEXT = CEXT.IDCARGOEXT                                                                 ');
      Open;
   end;

   if qryElegivel.FieldByName('IDSITFUNC').AsString       <> qryFuncionario.FieldByName('IDSITFUNC').AsString
   then begin
      sSQL := sSQL + ', IDSITFUNC = '+qryFuncionario.FieldByName('IDSITFUNC').AsString;
      InsereCriticaInterface       ( qryAux,  piIdFundacao,   piIdPessoa,
                                     qryFuncionario.FieldByName('IDSITFUNC').AsString,
                                     qryElegivel.FieldByName('IDSITFUNC').AsString,
                                     qryFuncionario.FieldByName('MATRICULA').AsString,
                                     ceEmprNovo, 'N');
   end;

   if qryElegivel.FieldByName('CODCENTROCUSTO').AsString  <> qryFuncionario.FieldByName('CODCENTROCUSTO').AsString
   then begin
      sSQL := sSQL + ', IDEMPRESAPROP  = '+qryFuncionario.FieldByName('IDEMPRESAPROP').AsString+
                     ', CODCENTROCUSTO = '''+qryFuncionario.FieldByName('CODCENTROCUSTO').AsString+'''';
      InsereCriticaInterface       ( qryAux,  piIdFundacao,   piIdPessoa,
                                     qryFuncionario.FieldByName('CODCENTROCUSTO').AsString,
                                     qryElegivel.FieldByName('CODCENTROCUSTO').AsString,
                                     qryFuncionario.FieldByName('MATRICULA').AsString,
                                     ceCCustoAlterado, 'C');
   end;

   if (qryElegivel.FieldByName('MATRICULA').AsString <> qryFuncionario.FieldByName('MATRICULA').AsString)
   then begin

{      (MsgDlg('Atualiza a Matrícula no Previdenciário De: '+
               qryElegivel.FieldByName('MATRICULA').AsString + ' Para: '+
               qryFuncionario.FieldByName('MATRICULA').AsString + ' ?',
               'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrYes)
}
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT FLGATUMATRICULA FROM PARAMAPREV ');
      qryAux.Open;

      if (not qryAux.IsEmpty) and (qryAux.FieldByName('FLGATUMATRICULA').AsInteger = 1)
      then begin
         sSQL := sSQL + ', MATRICULA     = '''+qryFuncionario.FieldByName('MATRICULA').AsString+'''';
         InsereCriticaInterface       ( qryAux,  piIdFundacao,   piIdPessoa,
                                        qryFuncionario.FieldByName('MATRICULA').AsString,
                                        qryElegivel.FieldByName('MATRICULA').AsString,
                                        qryFuncionario.FieldByName('MATRICULA').AsString,
                                        ceMatriculaAlterada, 'C');
      end;

   end;

   if qryElegivel.FieldByName('DATAADMISSAO').AsString    <> qryFuncionario.FieldByName('DATAADMISSAO').AsString
   then begin
      if qryFuncionario.FieldByName('DATAADMISSAO').AsString <> ''
      then sSQL := sSQL + ', DATAADMISSAO = TO_DATE('''+qryFuncionario.FieldByName('DATAADMISSAO').AsString+''', ''DD/MM/YYYY'')'
      else sSQL := sSQL + ', DATAADMISSAO = NULL ';
       
      InsereCriticaInterface       ( qryAux,  piIdFundacao,   piIdPessoa,
                                     qryFuncionario.FieldByName('DATAADMISSAO').AsString,
                                     qryElegivel.FieldByName('DATAADMISSAO').AsString,
                                     qryFuncionario.FieldByName('MATRICULA').AsString,
                                     ceDataAdmAlterada, 'D');
   end;

   if qryElegivel.FieldByName('DATADEMISSAO').AsString    <> qryFuncionario.FieldByName('DATADEMISSAO').AsString
   then begin

      if qryFuncionario.FieldByName('DATADEMISSAO').AsString <> ''
      then sSQL := sSQL + ', DATADEMISSAO = TO_DATE('''+qryFuncionario.FieldByName('DATADEMISSAO').AsString+''', ''DD/MM/YYYY'')'
      else sSQL := sSQL + ', DATADEMISSAO = NULL ';
      InsereCriticaInterface       ( qryAux,  piIdFundacao,   piIdPessoa,
                                     qryFuncionario.FieldByName('DATADEMISSAO').AsString,
                                     qryElegivel.FieldByName('DATADEMISSAO').AsString,
                                     qryFuncionario.FieldByName('MATRICULA').AsString,
                                     ceDtDemissaoAlterada, 'D');
   end;

   if qryElegivel.FieldByName('SALTOTAL').AsString        <> qryFuncionario.FieldByName('SALTOTAL').AsString
   then begin
      sSQL := sSQL + ', SALTOTAL = '+OraNumero(qryFuncionario.FieldByName('SALTOTAL').AsString);
      InsereCriticaInterface       ( qryAux,  piIdFundacao,   piIdPessoa,
                                     qryFuncionario.FieldByName('SALTOTAL').AsString,
                                     qryElegivel.FieldByName('SALTOTAL').AsString,
                                     qryFuncionario.FieldByName('MATRICULA').AsString,
                                     ceSalarioAlterado, 'N');
   end;

   if qryElegivel.FieldByName('DATAREADMISSAO').AsString  <> qryFuncionario.FieldByName('DATAREADMISSAO').AsString
   then begin
      if qryFuncionario.FieldByName('DATAREADMISSAO').AsString <> ''
      then sSQL := sSQL + ', DATAREADMISSAO = TO_DATE('''+qryFuncionario.FieldByName('DATAREADMISSAO').AsString+''', ''DD/MM/YYYY'')'
      else sSQL := sSQL + ', DATAREADMISSAO = NULL '; 

      InsereCriticaInterface       ( qryAux,  piIdFundacao,   piIdPessoa,
                                     qryFuncionario.FieldByName('DATAREADMISSAO').AsString,
                                     qryElegivel.FieldByName('DATAREADMISSAO').AsString,
                                     qryFuncionario.FieldByName('MATRICULA').AsString,
                                     ceDtReadmissaoAlterada, 'D');
   end;

   if qryElegivel.FieldByName('IDESTAB').AsString         <> qryFuncionario.FieldByName('IDESTAB').AsString
   then begin
      sSQL := sSQL + ', IDESTAB = '+qryFuncionario.FieldByName('IDESTAB').AsString;
      InsereCriticaInterface       ( qryAux,  piIdFundacao,   piIdPessoa,
                                     qryFuncionario.FieldByName('IDESTAB').AsString,
                                     qryElegivel.FieldByName('IDESTAB').AsString,
                                     qryFuncionario.FieldByName('MATRICULA').AsString,
                                     ceFilialAlterada, 'N');
   end;

   if qryElegivel.FieldByName('CODCARGO').AsString      <> qryFuncionario.FieldByName('CODCARGO').AsString
   then begin
      iIdCargo := qryFuncionario.FieldByName('IDCARGO').AsInteger;

      if not ProcessaDE_PARA_CARGO ( piIdFundacao, piIdPessoa,
                                     qryElegivel.FieldByName('IDCARGOEXT').AsInteger,
                                     'C', iIdCargo)
      then begin
         qryElegivel.Free;
         Exit;
      end;
      sSQL := sSQL + ', IDCARGOEXT = '+IntToStr(iIdCargo);
      InsereCriticaInterface       ( qryAux,  piIdFundacao,   piIdPessoa,
                                     qryFuncionario.FieldByName('CODCARGO').AsString,
                                     qryElegivel.FieldByName('CODCARGO').AsString,
                                     qryFuncionario.FieldByName('MATRICULA').AsString,
                                     ceCargoAlterado, 'N');
   end;

   if Trim(sSQL) <> ''
   then begin
      sSQL := Copy(sSQL, 2, Length(sSQL)-1);
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' UPDATE ELEGPATRO SET '+sSQL+
                     ' WHERE  IDPESSJUR = '+IntToStr(piIdFundacao)+
                     ' AND    IDPESSOA  = '+IntToStr(piIdPessoa));
      try
         qryAux.ExecSQL;
      except
         qryFuncionario.Free;
         qryElegivel.Free;
         qryAux.Free;
         Exit;
      end;
   end;
   qryFuncionario.Free;
   qryElegivel.Free;
   qryAux.Free;
   Result := True;
end;
//INICIO- André Oliveira SOL - 155521/9643 - KIN -1664446
function GetSequence(Sufixo : string):integer;
begin
    With  TwwQuery.Create(nil) do
       Try

            SQL.ADD('SELECT SEQ' + Sufixo + '.NEXTVAL FROM DUAL');
            ExecSQL;
         Result := Fields[0].AsInteger;

         Close;
         Free;
       Except

         Free;
         Raise;
       End;
end;
//FIM- André Oliveira SOL - 155521/9643 - KIN -1664446
end.
