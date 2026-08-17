{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Claudio Faria                   }
{ Atualizado Em: 22/11/2006                             }
{                                                       }
{*******************************************************}

unit uCtrRCompDARF;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrRCompDARF = Class(TCmControlObject)
    private
    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      function ListaCompDARF(pdDataInicial, pdDataFinal:TDateTime ):OleVariant;
    protected

    End;

implementation

{ TCtrLancIRRF }

constructor TCtrRCompDARF.Create;
begin
  inherited;
end;

destructor TCtrRCompDARF.Destroy;
begin
  inherited;
end;

procedure TCtrRCompDARF.DoChangeDataBase;
begin
  inherited;
end;

function TCtrRCompDARF.ListaCompDARF(pdDataInicial,
  pdDataFinal: TDateTime): OleVariant;
Var sSQL:String;
begin

  sSQL := ' SELECT DISTINCT ' + #13 +
          '   H.MES, E.MATRICULA, H.IDTITULAR, P.NOME AS NOMETITULAR, H.IDPESSOA, ' + #13 +
          '   H.IDRESPONSAVEL, PR.NOME AS NOMERECEBEDOR, ' + #13 +
          '   H.SEQRUBRICA, H.FLGDESCONTO, H.FLGESPECIAL, H.FLGTIPODESC, ' + #13 +
          '   H.IDRUBRICA, PD.DESCRICAO, ' + #13 +
          '   DECODE(H.FLGESPECIAL, 0, DECODE(H.FLGDESCONTO, 0, ''Provento'', ' + #13 +
          '                                                  1, ''Desconto'', ' + #13 +
          '                                                  2, ''Informativo''), ' + #13 +
          '                         1, ''Informativo'', ' + #13 +
          '                         2, ''Informativo'') AS TITULORUBRICA, ' + #13 +
          '   DECODE(H.FLGESPECIAL, 0, DECODE(H.FLGDESCONTO, 0, H.VALORPROVENTO, ' + #13 +
          '                                                  1, H.VALORPROVENTO * (-1), ' + #13 +
          '                                                  2, 0), ' + #13 +
          '                         1, 0, ' + #13 +
          '                         2, 0) AS VALORPROVENTOREAL, H.VALORPROVENTO, ' + #13 +
          '   DECODE(H.FLGESTORNO, 1, ''PAGTO PENDENTE'', ' + #13 +
          ' 	                   2, ''PENDENTE EM PROCESSAMENTO DE PRÉVIA'', ' + #13 +
          '                        3, ''PENDENTE PAGO NOVAMENTE'', ' + #13 +
          '                        4, ''ESTORNADO P/ REPROCESSAMENTO'', ' + #13 +
          '                        9, ''ESTORNADO - PAGTO INDEVIDO'') AS SITESTORNO, ' + #13 +
          '   H.IDLANCIRRF, H.IDLANCIRRFESTORNO,  L.IDDARF, ' + #13 +
          '   H.IDHSTFOLHABENEF AS VERSAOPAGTO,  HSPG.HISTORICO AS HISTPAGTO, HSPG.DATAPREVPAGTO AS DTPREVPGTO, ' + #13 +
          '   H.IDVERSAOPAGTO AS VERSAONOVA, HSNPG.HISTORICO AS HISTPAGTONOVO, HSNPG.DATAPREVPAGTO AS DTPREVPGTONOVO, ' + #13 +
          '   VPAG.IDLANCIRRF, H.DATAPAGAMENTO ' + #13 +
          ' FROM ' + #13 +
          '   HISTRUBSAL H, ELEGPATRO E, PESSOA P, PESSOA PR, ' + #13 +
          '   PROVDESC PD, HSTFOLHABENEF HSPG, HSTFOLHABENEF HSNPG, LANCIRRF L, ' + #13 +
          '   ( ' + #13 +
          '    SELECT HPAGEST.IDHSTFOLHABENEF, HPAGEST.IDLANCIRRF, ' + #13 +
          '           HPAGEST.IDTITULAR, HPAGEST.IDRESPONSAVEL ' + #13 +
          '    FROM ' + #13 +
          '      HISTRUBSAL HPAGEST, ' + #13 +
          ' 	 HISTRUBSAL HPAGNOVO ' + #13 +
          '    WHERE HPAGEST.DATAPAGAMENTO   >= TO_DATE(' + QuotedStr( FormatDateTime('dd/mm/yyyy', pdDataInicial) ) + ',''dd/mm/yyyy'') ' + #13 +
          '      AND HPAGEST.DATAPAGAMENTO   <= TO_DATE(' + QuotedStr( FormatDateTime('dd/mm/yyyy', pdDataFinal) ) + ',''dd/mm/yyyy'') ' + #13 +
          '      AND HPAGEST.IDMODULO        = 18 ' + #13 +
          ' 	 AND HPAGEST.FLGESTORNO      <> 0 ' + #13 +
          ' 	 AND HPAGEST.IDVERSAOPAGTO   =  HPAGNOVO.IDHSTFOLHABENEF ' + #13 +
          ' 	 AND HPAGEST.IDTITULAR       =  HPAGNOVO.IDTITULAR ' + #13 +
          ' 	 AND HPAGEST.IDRESPONSAVEL   =  HPAGNOVO.IDRESPONSAVEL ' + #13 +
          '   ) VPAG ' + #13 +
          ' WHERE H.DATAPAGAMENTO   >= TO_DATE(' + QuotedStr( FormatDateTime('dd/mm/yyyy', pdDataInicial) ) + ',''dd/mm/yyyy'') ' + #13 +
          '   AND H.DATAPAGAMENTO   <= TO_DATE(' + QuotedStr( FormatDateTime('dd/mm/yyyy', pdDataFinal) ) + ',''dd/mm/yyyy'') ' + #13 +
          '   AND H.IDMODULO        = 18 ' + #13 +
          '   AND H.FLGESTORNO      <> 0 ' + #13 +
          '   AND H.IDTITULAR       = E.IDPESSOA(+) ' + #13 +
          '   AND H.IDTITULAR       = P.IDPESSOA(+) ' + #13 +
          '   AND H.IDRESPONSAVEL   = PR.IDPESSOA(+) ' + #13 +
          '   AND H.IDRUBRICA       = PD.IDPROVENTO(+) ' + #13 +
          '   AND H.IDHSTFOLHABENEF = HSPG.IDHSTFOLHABENEF(+) ' + #13 +
          '   AND H.IDVERSAOPAGTO   = HSNPG.IDHSTFOLHABENEF(+) ' + #13 +
          '   AND H.IDLANCIRRF      = L.IDLANCIRRF(+) ' + #13 +
          '   AND H.IDVERSAOPAGTO   = VPAG.IDHSTFOLHABENEF(+) ' + #13 +
          '   AND H.IDTITULAR       = VPAG.IDTITULAR(+) ' + #13 +
          '   AND H.IDRESPONSAVEL   = VPAG.IDRESPONSAVEL(+) ' + #13 +
          ' ORDER BY ' + #13 +
          '   E.MATRICULA, H.IDHSTFOLHABENEF, H.SEQRUBRICA ';


   Result := GetDataPacket(sSQL);
end;

procedure TCtrRCompDARF.OnCreateAppServer;
begin
  inherited;

end;

end.
