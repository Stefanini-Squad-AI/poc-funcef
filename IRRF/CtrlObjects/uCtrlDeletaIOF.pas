{ Alterações
**********************************************************************
Analista.: Luiz Carlos
SIG......: 63614
Data.....: 22/02/2018
Rotina...: DeletaLancIOF
Descrição: Ajuste update da HISTMOVEMPTMO para delete na HMEIMPOSTOS
**********************************************************************
Analista.: Marcio Sanches Spinosa
SOL......: 186920
Kintana..: 1892913
Data.....: 24/12/2012
Rotina...: DeletaLancIOF
Descrição: Alteração no sql para melhor desempenho
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 23194
Data.....: 05/09/2006
Rotina...: DeletaLancIOF
Descrição: Colocar join da HistMovEmptmo com a LancIRRF.
**********************************************************************
}

unit uCtrlDeletaIOF;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCtrlUtil;

  Type
    TCtrlDeletaIOF = Class(TCmControlObject)

    private
    CtrlUtil : TCtrlUtil;
    cdsGeral : TclientDataSet;
    cdsAux : TclientDataSet;
    procedure PegaIDItemIOF(var IdiTemIof, IdItemIofCompl, IdPrograma : longInt; var CodCentroCusto : string; IdEmpresaProp : Longint);

    protected

      procedure DoChangeDataBase; Override;

    public

      Constructor Create; Override;

      Destructor Destroy; Override;

      function DeletaLancIOF(IdPessoa, iSistema, iVersao, iPessoa : Integer; DataIni, dataFim, MesCobranca : string) : Boolean;
      procedure Atualizaposicao (cTexto : String);

    protected

    End;


implementation

Uses
FdeletaIOFMT;

{ TCtrlDeletaFolha }

constructor TCtrlDeletaIOF.Create;
begin
  inherited;
  cdsGeral  := TClientDataSet.Create(nil);
  cdsAux    := TClientDataSet.Create(nil);
end;

destructor TCtrlDeletaIOF.Destroy;
begin
  inherited;
  cdsGeral.free;
  cdsAux.free;
end;

procedure TCtrlDeletaIOF.DoChangeDataBase;
begin
  inherited;

end;

procedure TCtrlDeletaIOF.PegaIDItemIOF(var IdiTemIof, IdItemIofCompl,
                                       IdPrograma: Integer; var CodCentroCusto: string;
                                       IdEmpresaProp: Integer);
Var
  Ssql : string;
begin
  Ssql := 'SELECT IDITEMIOF, IDPROGRAMA, CODCENTROCUSTO, IDEMPRESA, IDITEMIOFCOMPL '+
          '  FROM PARAMEMPTMO '+
          ' WHERE IDEMPRESAPROP = '+ intTostr(Sistema.Idempresa);
  cdsGeral.data  := GetDataPacket(Ssql);
  IdiTemIof      := cdsGeral.fieldByname('IDITEMIOF').Asinteger;
  IdItemIofCompl := CdsGeral.FieldByName('IDITEMIOFCOMPL').AsInteger;
  IdPrograma     := cdsGeral.fieldByname('IDPROGRAMA').Asinteger;
  CodCentroCusto := cdsGeral.fieldByname('CODCENTROCUSTO').Asstring;
end;

function TCtrlDeletaIOF.DeletaLancIOF(IdPessoa, iSistema, iVersao, iPessoa: Integer;
                                          DataIni, dataFim, MesCobranca: string): Boolean;
Var
  Ssql,ssqlGeral,CodCentroCusto : string;
  iTipoBuscaIOF  : Integer;
  IdiTemIOF, IdPrograma, IdItemIofCompl,IdEmpresa : Integer;
begin
  Result := True;
  // DETERMINA SE TRABALHA COM DATA PREVISTA OU EFETIVA PARA O IOF - INICIO
  SsqlGeral := 'SELECT FLGBUSCAIOF FROM PARAMIRRF WHERE IDPESSOA = '+inttostr(IdPessoa);
  cdsGeral.data := GetDataPacket(SsqlGeral);
  if cdsGeral.IsEmpty then
    iTipoBuscaIOF := 0
  else
    iTipoBuscaIOF := cdsGeral.fieldbyname('flgbuscaiof').asInteger;
  // DETERMINA SE TRABALHA COM DATA PREVISTA OU EFETIVA PARA O IOF - FIM

  // DETERMINA O CODIGO DO ITEM DE IOF - INICIO
  PegaIDItemIOF(IdiTemIOF, IdItemIofCompl, IdPrograma, CodCentroCusto, IdEmpresa);
 // DETERMINA O CODIGO DO ITEM DE IOF - FIM
  try
      Ssql := 'SELECT * FROM LANCIRRF WHERE '+
        ' DATALANCAMENTO BETWEEN TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'') '+
        ' AND TO_DATE('+quotedStr(dataFim)+',''DD/MM/YYYY'') '+
        ' AND FLGDARF = ''N''  '+
        ' AND FLGFOLHA = ''N'' '+
        ' AND IDEMPRESA = '+intTostr(Sistema.idempresa)+  
        ' AND IDDARF IS NULL '+
        ' AND IDMODULO = 15 '+
        ' AND CODDOCUMENTO IS NULL';

      AtualizaPosicao ('Fase 1/4 : Verificando Registros a Processar ....');
      StartTransaction;
      cdsAux.data := GetDataPacket(Ssql);
      If not cdsAux.EOF then
      begin
// Marcio Sanches Spinosa - Sol :186920 Kintana :1892913 - Inicio
//          If iTipoBuscaIOF = 0 then // DATA EFETIVA
//          begin
              //  HISTMOVEMPTMO - INICIO -----------------------------------------------------------------------------------
              {
                Ajuste no sql abaixo, pois como estava escrito não iria fazer nenhum update
                na histmovemptmo, podendo ocasionar um erro de constraint.
                Como a constraint entre a HISTMOVEMPTMO e a LANCIRRF na FCRT está desabilitada,
                esse erro nunca apareceu, porém se fosse necessário gerar a busca novamente,
                os registros não seriam mais selecionados, visto que o campo IDLANCIRRF estaria
                preenchido 
              }
//              Ssql := ' UPDATE HISTMOVEMPTMO SET IDLANCIRRF = NULL '+
//                      ' WHERE IDHISTMOVEMPTMO IN (SELECT H.IDHISTMOVEMPTMO  '+
//                      ' FROM HISTMOVEMPTMO H, CONTRATOEMPTMO C,    '+
//                      ' TIPOCONTREMPTMO TC, TIPOEMPTMO TE,         '+
//                      ' LANCIRRF L, '+ 
//                      '(SELECT IDCONTRATOEMPTMO, HMEDATAEFETIVA    '+
//                      ' FROM HISTMOVEMPTMO WHERE (hmetipomov in (0,2))  '+
//                      ' AND (hmecentraliza = 1)                    '+
//                      ' AND (flgbaixado is null)                   '+
//                      ' AND ((flgestornado is null) or (flgestornado = 0))                '+
//                      ' AND (plncodigoestorno is null)            '+
//                      ' AND (HMEDATAEFETIVA BETWEEN                '+
//                      ' TO_DATE('+quotedStr(DataIni)+', ''DD/MM/YYYY'') AND '+
//                      ' TO_DATE('+quotedStr(dataFim)+', ''DD/MM/YYYY'') )   '+
//                      ' GROUP by IDCONTRATOEMPTMO, HMEDATAEFETIVA) HCB      '+
//                      ' WHERE                                               '+
//                      ' (TE.IDEMPRESAPROP   = '+ InttoStr(Sistema.Idempresa)+')  '+ 
//                      ' AND (H.IDLANCIRRF IS NOT NULL)                      '+
//                      ' AND (H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO)       '+
//                      ' AND (H.IDCONTRATOEMPTMO = HCB.IDCONTRATOEMPTMO)     '+
//                      ' AND (C.IDTIPOCONTREMPTMO  = TC.IDTIPOCONTREMPTMO)   '+
//                      ' AND (TC.IDTIPOEMPTMO      = TE.IDTIPOEMPTMO)        '+
//
//                      ' AND (H.IDLANCIRRF = L.IDLANCIRRF) '+
//                      ' AND (L.IDDARF IS NULL)) ';
// Marcio Sanches Spinosa - Sol :186920 Kintana :1892913 - Fim

// Marcio Sanches Spinosa - Sol :186920 Kintana :1892913 - Inicio
// Luiz Carlos - SIG63614 - Inicio
                Ssql := 'DELETE HMEIMPOSTOS ' + #13 +
//                Ssql := 'UPDATE HISTMOVEMPTMO ' + #13 +
//                        ' SET	 IDLANCIRRF = NULL ' + #13 +
// Luiz Carlos - SIG63614 - Fim
                        ' WHERE  IDLANCIRRF IN ((SELECT IDLANCIRRF '+ #13 +
                        ' FROM LANCIRRF ' + #13 +
                        ' WHERE DATALANCAMENTO BETWEEN  '+ #13 +
                        ' TO_DATE('+quotedStr(DataIni)+', ''DD/MM/YYYY'')'+ #13 +
                        ' AND TO_DATE('+quotedStr(dataFim)+', ''DD/MM/YYYY'') '+ #13 +
                        ' AND FLGDARF = ''N'' '+ #13 +
                        ' AND FLGFOLHA = ''N'' '+ #13 +
                        ' AND IDEMPRESA = ' + IntToStr(IdPessoa) + #13 +
                        ' AND IDDARF IS NULL ' + #13 +
                        ' AND IDMODULO = 15 ' +
                        ' AND CODDOCUMENTO IS NULL)) ';
              //  HISTMOVEMPTMO - FIM ------------------------------------------------------------------------------------
//          end else
//          begin // DATA PREVISTA
//                //  HISTMOVEMPTMO - INICIO -----------------------------------------------------------------------------------
//                ssql := ' UPDATE HISTMOVEMPTMO SET IDLANCIRRF = NULL '+
//                        ' WHERE IDLANCIRRF IN (SELECT H.IDLANCIRRF   '+
//                        ' FROM HISTMOVEMPTMO H, CONTRATOEMPTMO C, TIPOCONTREMPTMO TC, '+
//                        ' LANCIRRF L, '+ 
//                        ' TIPOEMPTMO TE WHERE '+
//                        ' (TE.IDEMPRESAPROP   = '+IntToStr(Sistema.idempresa)+') '+  
//                        ' AND (H.IDLANCIRRF IS NOT NULL)' +
//                        ' AND (H.HMEDATAPREVISTA BETWEEN TO_DATE('+quotedStr(DataIni)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(dataFim)+', ''DD/MM/YYYY'') ) '+
//                        ' AND (H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO) '+
//                        ' AND (C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO) '+
//                        ' AND (TC.IDTIPOEMPTMO     = TE.IDTIPOEMPTMO) '+
//                        ' AND (L.IDLANCIRRF = H.IDLANCIRRF) '+
//                        ' AND (L.IDDARF IS NULL)) ';
//                        ;
// Marcio Sanches Spinosa - Sol :186920 Kintana :1892913 - Fim
//                //  HISTMOVEMPTMO - FIM ------------------------------------------------------------------------------------
//          end;
          AtualizaPosicao ('Fase 2/4 : Atualizando o Histórico de Empréstimos.');
          ExecSQL(Ssql);
          //  LANCXINFORME - INICIO ----------------------------------------------------------------------------
                    Ssql := 'DELETE LANCXINFORME WHERE IDLANCIRRF IN'+
                  ' (SELECT IDLANCIRRF FROM LANCIRRF WHERE '+
                  ' DATALANCAMENTO BETWEEN TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'') '+
                  ' AND TO_DATE('+quotedStr(dataFim)+',''DD/MM/YYYY'') '+
                  ' AND FLGDARF = ''N''  '+
                  ' AND FLGFOLHA = ''N'' '+
                  ' AND IDEMPRESA = '+intTostr(Sistema.Idempresa)+  
                  ' AND IDDARF IS NULL '+
                  ' AND IDMODULO = 15 '+
                  ' AND CODDOCUMENTO IS NULL)';
          AtualizaPosicao ('Fase 3/4 : Apagando os Lançamentos Analíticos de Imposto de Renda .');
          ExecSQL(Ssql);
          //  LANCIRRF - INICIO ----------------------------------------------------------------------------
          Ssql := 'DELETE LANCIRRF WHERE '+
                  ' DATALANCAMENTO BETWEEN TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'') '+
                  ' AND TO_DATE('+quotedStr(dataFim)+',''DD/MM/YYYY'') '+
                  ' AND FLGDARF = ''N''  '+
                  ' AND FLGFOLHA = ''N'' '+
                  ' AND IDEMPRESA = '+intTostr(Sistema.idempresa)+   
                  ' AND IDDARF IS NULL '+
                  ' AND IDMODULO = 15 '+
                  ' AND CODDOCUMENTO IS NULL';
          AtualizaPosicao ('Fase 4/4 : Apagando os Lançamentos Sintéticos de Imposto de Renda .');
          ExecSQL(Ssql);
          CtrlUtil.GravaLogTOTALPREV ('Apagou Geração do IOF '+
                         ' período de :'+DataIni+' até '+DataFim);
          AtualizaPosicao ('Fim do Processo .');
          //  LANCIRRF - FIM ----------------------------------------------------------------------------

          // LANCXINFORME - INICIO

          // OS LANCAMENTOS DE IOF NÃO POSSUEM REGISTROS NA TABELA LANCXINFORME.

          // LANCXINFORME - FIM
      end else
      begin
           AtualizaPosicao ('> NÃO EXISTE NENHUMA INFORMAÇÃO A SER PROCESSADA OU DARF JÁ IMPRESSO.'); 
      end;
      commit;
  except
        On E:Exception Do
        Begin
             Rollback;
             Result := False;
             MessageInfo := E.Message;
        End;
  end;
end;


procedure TCtrlDeletaIOF.Atualizaposicao (cTexto : String);
begin
    FrmdeletaIOFMT.pnlPosicao.caption := cTexto;
    FrmdeletaIOFMT.Repaint;
end;

end.
