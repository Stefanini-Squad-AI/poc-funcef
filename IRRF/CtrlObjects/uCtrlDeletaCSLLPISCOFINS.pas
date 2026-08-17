unit uCtrlDeletaCSLLPISCOFINS;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCtrlUtil;

Type
  TCtrlDeletaCSLLPISCOFINS = class(TCmControlObject)
  private
    CtrlUtil : TCtrlUtil;
    cdsGeral : TclientDataSet;
    protected

  public

    constructor Create; override;
    destructor Destroy; override;

    function DeletaLancCSLLPISCOFINS(IdPessoa, iSistema, iVersao, iPessoa : Integer; DataIni, dataFim, Naturendimento : string) : Boolean;
    procedure Atualizaposicao (cTexto : String);

  published

end;

implementation

Uses FDeletaCSLLPISCOFINSMT;

{ TCtrlDeletaCSLLPISCOFINS }


constructor TCtrlDeletaCSLLPISCOFINS.Create;
begin
  inherited;
  cdsGeral  := TClientDataSet.Create(nil);
end;

destructor TCtrlDeletaCSLLPISCOFINS.Destroy;
begin
   inherited;
   cdsGeral.free;
end;


function TCtrlDeletaCSLLPISCOFINS.DeletaLancCSLLPISCOFINS(IdPessoa, iSistema, iVersao, iPessoa: Integer;
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

          AtualizaPosicao ('Fase 2/3 : Apagando os Lançamentos para o Informe de Rendimentos');
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
          CtrlUtil.GravaLogTOTALPREV ('Apagou Geração da CSLL/PIS/COFINS '+
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


procedure TCtrlDeletaCSLLPISCOFINS.Atualizaposicao (cTexto : String);
begin
    FrmDeletaCSLLPISCOFINSMT.pnlPosicao.caption := cTexto;
    FrmDeletaCSLLPISCOFINSMT.Repaint;
end;




end.

