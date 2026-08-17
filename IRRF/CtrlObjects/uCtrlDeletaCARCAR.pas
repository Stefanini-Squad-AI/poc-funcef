unit uCtrlDeletaCARCAR;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCtrlUtil;

  Type
    TCtrlDeletaCARCAR = Class(TCmControlObject)

    private
    CtrlUtil : TCtrlUtil;
    cdsGeral : TclientDataSet;
    protected

      procedure DoChangeDataBase; Override;

    public

      Constructor Create; Override;

      Destructor Destroy; Override;

      function DeletaLancCARCAR(IdPessoa, iSistema, iVersao, iPessoa : Integer; DataIni, dataFim, Naturendimento : string) : Boolean;
      procedure Atualizaposicao (cTexto : String);

    protected

    End;


implementation

Uses FDeletaCARCARMT;

{ TCtrlDeletaFolha }

constructor TCtrlDeletaCARCAR.Create;
begin
  inherited;
  cdsGeral  := TClientDataSet.Create(nil);
end;

destructor TCtrlDeletaCARCAR.Destroy;
begin
  inherited;
  cdsGeral.free;
end;

procedure TCtrlDeletaCARCAR.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlDeletaCARCAR.DeletaLancCARCAR(IdPessoa, iSistema, iVersao, iPessoa: Integer;
                                          DataIni, dataFim, Naturendimento: string): Boolean;
Var
  Ssql,ssqlGeral,CodCentroCusto : string;
  IdPrograma, IdEmpresa : Integer;
begin
  Result := True;

  try

      ssql := ' SELECT IDLANCIRRF '+
              ' FROM LANCIRRF WHERE DATALANCAMENTO BETWEEN '+
              ' TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'') AND '+
              ' TO_DATE ('+quotedStr(dataFim)+',''DD/MM/YYYY'') '+
              ' AND FLGFOLHA = ''N'' '+
              ' AND IDMODULO = 3 '+
              ' AND FLGDARF = ''N''' +
              ' AND CODNATUREZA = '+ quotedStr(Naturendimento)+
              ' AND CODDOCUMENTO IS NOT NULL ';

      AtualizaPosicao ('Fase 1/3 : Verificando Registros a Processar ....');
      StartTransaction;
      cdsGeral.data := GetDataPacket(Ssql);
      If not cdsGeral.EOF then
      begin
          // LANCXINFORME - INICIO
          ssql := ' DELETE LANCXINFORME WHERE '+
                  ' IDLANCIRRF IN (SELECT IDLANCIRRF '+
                  ' FROM LANCIRRF WHERE DATALANCAMENTO BETWEEN '+
                  ' TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'') AND '+
                  ' TO_DATE ('+quotedStr(dataFim)+',''DD/MM/YYYY'') '+
                  ' AND FLGFOLHA = ''N'' '+
                  ' AND IDMODULO = 3 '+
                  ' AND FLGDARF = ''N''' +
                  ' AND CODNATUREZA = '+ quotedStr(Naturendimento)+
                  ' AND CODDOCUMENTO IS NOT NULL) ';

          AtualizaPosicao ('Fase 2/3 : Apagando os Lançamentos de IRRF para o Informe de Rendimentos');
          ExecSQL(Ssql);
          // LANCXINFORME - FIM

          //  LANCIRRF - INICIO ----------------------------------------------------------------------------

          ssql := ' DELETE LANCIRRF WHERE '+
                  ' DATALANCAMENTO BETWEEN '+
                  ' TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'') AND '+
                  ' TO_DATE ('+quotedStr(dataFim)+',''DD/MM/YYYY'') '+
                  ' AND FLGFOLHA = ''N'' '+
                  ' AND IDMODULO = 3 '+
                  ' AND FLGDARF = ''N'' '+
                  ' AND CODNATUREZA = '+ quotedStr(Naturendimento)+
                  ' AND CODDOCUMENTO IS NOT NULL ';
          AtualizaPosicao ('Fase 3/3 : Apagando os Lançamentos de Imposto de Renda .');
          ExecSQL(Ssql);
          CtrlUtil.GravaLogTOTALPREV ('Apagou Geração do Contas a Pagar '+
                         ' período de :'+DataIni+' até '+DataFim);
          AtualizaPosicao ('Fim do Processo .');
          //  LANCIRRF - FIM ----------------------------------------------------------------------------
      end else
      begin
           AtualizaPosicao ('> NÃO EXISTE NENHUMA INFORMAÇÃO A SER PROCESSADA OU DARF JÁ IMPRESSO.');   
      end;
      Commit;
  except
        On E:Exception Do
        Begin
             Rollback;
             Result := False;
             MessageInfo := E.Message;
        End;
  end;
end;


procedure TCtrlDeletaCARCAR.Atualizaposicao (cTexto : String);
begin
    FrmDeletaCARCARMT.pnlPosicao.caption := cTexto;
    FrmDeletaCARCARMT.Repaint;
end;

end.
