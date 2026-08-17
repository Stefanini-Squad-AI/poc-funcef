unit uCtrlLancIRRFCaP;

// Alterações:
{---------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     :
Pendencia :
Descrição :
----------------------------------------------------------------------------------------------------
Rotina    : PreencheCamposDB
Data      : 07/12/2007
Autor     : Bruno Bastos
Pendencia : 27050
Descrição : Passar o campo data de pagamento para a propriedade correspondente.
----------------------------------------------------------------------------------------------------
Rotina    : InsertLancIRRF
Data      : 20/08/2007
Autor     : André Pontes
Pendencia : 26172
Descrição : Alteração na lógica de busca do IDINFORME de INSS
----------------------------------------------------------------------------------------------------
Rotina    : PreencheCamposDB
Data      : 29/03/2007
Autor     : André Pontes
Pendencia : -
Descrição : Correção da gravação do CodigoGPS 
----------------------------------------------------------------------------------------------------
Rotina    :
Data      : 27/02/2007
Autor     : André Pontes
Pendencia : 24490
Descrição : Gravação da Atividade/Projeto na LancIRRF
----------------------------------------------------------------------------------------------------
Rotina    :
Data      : 21/02/2007 a 23/02/2007
Autor     : André Pontes
Pendencia :
Descrição : Nova CTRL para gravar LancIRRF a partir da busca de Contas a Pagar
---------------------------------------------------------------------------------------------------}



// Impostos:

//    01 - IRRF
//    02 - INSS
//    15 - ISS
//    16 - PIS
//    17 - COFINS
//    18 - CSLL
//    19 - PIS/COFINS/CSLL
//    20 - CPMF


interface

uses
  sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient, uCMClientDataSet,
  {$IFNDEF VERSAO0505} uCMTypes {$ENDIF},
  uDBLancIRRF, uDbLancxinforme, DBaseDados;


  type
    TCtrlLancIRRFCaP = Class(TCmControlObject)

    protected

      procedure DoChangeDataBase; Override;


    private

      DBLancXInforme  : TDBLancXInforme;
      DBLancIRRF      : TDBLancIRRF;

      FNatureza       : string;

      FFavorecido     : Integer;
      FDocumento      : Integer;
      FEmpresaProp    : Integer;
      FUsaPlanPatro   : Boolean;
      FDataLancto     : TDateTime;
      FDataPagto      : TDateTime;

      FVlrINSS        : Currency;
      FVlrIR          : Currency;
      FVlrBase        : Currency;
      FPercentIR      : Currency;
      FVlrPIS         : Currency;
      FVlrISS         : Currency;
      FVlrCSCOFPIS    : Currency;
      FVlrCOFINS      : Currency;
      FVlrCSLL        : Currency;
      FPlanoContab    : Integer;
      FContaContab    : string;
      FPatro          : Integer;
      FPlanoPrev      : Integer;
      FModulo         : Integer;
      FPrograma       : Integer;
      FVlrDepIR       : Currency;
      FCodGPS         : Integer;
      FCentroCusto    : string;
      FCentroRespon   : string;
      FTipoRecDes     : string;
      FCPFCGC         : string;
      FNumLancto      : Integer;
      FAtivProjeto    : Integer;

      cdsAux          : TCMClientDataSet;

      function  BuscaAliquota: Extended;

      procedure SetNatureza(const Value: string);
      procedure SetDocumento(const Value: Integer);
      procedure SetFavorecido(const Value: Integer);
      procedure SetEmpresaProp(const Value: Integer);
      procedure SetUsaPlanPatro(const Value: Boolean);
      procedure SetDataLancto(const Value: TDateTime);

      procedure SetPercentIR(const Value: Currency);
      procedure SetVlrBase(const Value: Currency);
      procedure SetVlrINSS(const Value: Currency);
      procedure SetVlrIR(const Value: Currency);
      procedure SetVlrISS(const Value: Currency);
      procedure SetVlrPIS(const Value: Currency);
      procedure SetCSCOFPIS(const Value: Currency);
      procedure SetVlrCOFINS(const Value: Currency);
      procedure SetVlrCSLL(const Value: Currency);
      procedure SetContaContab(const Value: string);
      procedure SetPlanoContab(const Value: Integer);
      procedure SetPatro(const Value: Integer);
      procedure SetPlanoPrev(const Value: Integer);
      procedure SetModulo(const Value: Integer);
      procedure SetPrograma(const Value: Integer);
      procedure SetCentroCusto(const Value: string);
      procedure SetCentroRespon(const Value: string);
      procedure SetCodGPS(const Value: Integer);
      procedure SetTipoRecDes(const Value: string);
      procedure SetVlrDepIR(const Value: Currency);
      procedure SetCPFCGC(const Value: string);
      procedure SetNumLancto(const Value: Integer);
      procedure SetAtivProjeto(const Value: Integer);
      procedure SetDataPagto(const Value: TDateTime);



    public

      constructor Create; override;
      destructor Destroy; override;

      property Natureza     : string          read FNatureza      write SetNatureza;

      property DataLancto   : TDateTime       read FDataLancto    write SetDataLancto;
      property DataPagto    : TDateTime       read FDataPagto     write SetDataPagto;

      property Documento    : Integer         read FDocumento     write SetDocumento;
      property NumLancto    : Integer         read FNumLancto     write SetNumLancto;

      property Favorecido   : Integer         read FFavorecido    write SetFavorecido;
      property EmpresaProp  : Integer         read FEmpresaProp   write SetEmpresaProp;
      property UsaPlanPatro : Boolean         read FUsaPlanPatro  write SetUsaPlanPatro;

      property VlrBase      : Currency        read FVlrBase       write SetVlrBase;
      property VlrIR        : Currency        read FVlrIR         write SetVlrIR;
      property VlrINSS      : Currency        read FVlrINSS       write SetVlrINSS;
      property VlrPIS       : Currency        read FVlrPIS        write SetVlrPIS;
      property VlrCOFINS    : Currency        read FVlrCOFINS     write SetVlrCOFINS;
      property VlrCSLL      : Currency        read FVlrCSLL       write SetVlrCSLL;
      property VlrCSCOFPIS  : Currency        read FVlrCSCOFPIS   write SetCSCOFPIS;
      property VlrISS       : Currency        read FVlrISS        write SetVlrISS;

      property PercentIR    : Currency        read FPercentIR     write SetPercentIR;
      property VlrDepIR     : Currency        read FVlrDepIR      write SetVlrDepIR;

      property ContaContab  : string          read FContaContab   write SetContaContab;
      property PlanoContab  : Integer         read FPlanoContab   write SetPlanoContab;
      property PlanoPrev    : Integer         read FPlanoPrev     write SetPlanoPrev;
      property Patro        : Integer         read FPatro         write SetPatro;
      property Programa     : Integer         read FPrograma      write SetPrograma;
      property Modulo       : Integer         read FModulo        write SetModulo;
      property CentroCusto  : string          read FCentroCusto   write SetCentroCusto;
      property TipoRecDes   : string          read FTipoRecDes    write SetTipoRecDes;
      property CentroRespon : string          read FCentroRespon  write SetCentroRespon;
      property AtivProjeto  : Integer         read FAtivProjeto   write SetAtivProjeto;

      property CodGPS       : Integer         read FCodGPS        write SetCodGPS;

      property CPFCGC       : string          read FCPFCGC        write SetCPFCGC;

      procedure LimpaCampos;
      procedure PreencheCamposDB;

      function InsertLancIRRF: Boolean;


    end;




implementation
{ TCtrlLancIRRFCaP }




constructor TCtrlLancIRRFCaP.Create;
begin
  inherited;

  cdsAux          := TCMClientDataSet.Create(nil);

  DBLancIRRF      := TDBLancIRRF.Create(self);
  DBLancXInforme  := TDBLancXInforme.Create(self);
end;



destructor TCtrlLancIRRFCaP.Destroy;
begin
  DBLancXInforme.Free;
  DBLancIRRF.Free;

  cdsAux.Free;

  inherited;
end;



procedure TCtrlLancIRRFCaP.DoChangeDataBase;
begin
  inherited;

  DBLancXInforme.DataBaseName := DataBaseName;
  DBLancIRRF.DataBaseName     := DataBaseName;
end;



function TCtrlLancIRRFCaP.InsertLancIRRF: Boolean;
var
  sSQL        : string;
  IDLancIRRF  : Integer;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.InsertLancIRRF;
    if not(Result) then
    begin
      MessageInfo := Connection.AppServer.MessageInfo;
    end;
  end
  else  // if ConnectionSide = cnsClient
  begin
    // ---------------------------------------------------------------------------------------------

    // Busca a alíquota de IRRF - se for o caso
    if (FVlrBase <> 0) and (FVlrIR <> 0) then BuscaAliquota;

    // ---------------------------------------------------------------------------------------------
    // Gravação da LancIRRF
    // ---------------------------------------------------------------------------------------------

    DBLancIRRF.LimpaCampos;
    PreencheCamposDB;

    DBLancIRRF.ErrorIfNoRowsAffected := True;

    if not(DBLancIRRF.Insert) then
    begin
      Result      := False;
      MessageInfo := 'Erro ao inserir LancIRRF: ' + DBLancIRRF.MessageInfo;
      Exit;
    end;

    // Retorna o ID para inserção na LancXInforme
    IDLancIRRF := DBLancIRRF.IDLancIRRF.AsInteger;

    // ---------------------------------------------------------------------------------------------
    // FIM Gravação da LancIRRF
    // ---------------------------------------------------------------------------------------------



    // ---------------------------------------------------------------------------------------------
    // Gravação da LancXInforme
    // ---------------------------------------------------------------------------------------------

    // IRRF ----------------------------------------------------------------------------------------
    if FVlrIR <> 0 then
    begin
      // 1º) Gravação do Valor-Base
      if FVlrBase <> 0 then
      begin
        sSQL        := 'SELECT NVL(IDINFORMERENDBRUT, 0) AS IDINFORME FROM PARAMIRRF ';
        cdsAux.Data := GetDataPacket(sSQL);

        if cdsAux.FieldByName('IDINFORME').AsInteger = 0 then
        begin
          Result      := False;
          MessageInfo := 'Não foi encontrada a linha do Informe referente ao rendimento bruto.';
          Exit;
        end;

        DBLancXInforme.IDLancIRRF.AsInteger   := IDLancIRRF;
        DBLancXInforme.IDInforme.AsInteger    := cdsAux.FieldByName('IDINFORME').AsInteger;
        DBLancXInforme.VlrLanc.AsFloat        := FVlrBase;
        DBLancXInforme.FlgTipoReg.AsString    := 'N';
        DBLancXInforme.FontePagadora.AsFloat  := 0;

      end;  // if FVlrBase <> 0

      // -------------------------------------------------------------------------------------------

      // 2º) Gravação do IRRF
      if FVlrIR <> 0 then
      begin
        sSQL        := 'SELECT NVL(IDINFORMEIRRETIDO, 0) AS IDINFORME FROM PARAMIRRF ';
        cdsAux.Data := GetDataPacket(sSQL);

        if cdsAux.FieldByName('IDINFORME').AsInteger = 0 then
        begin
          Result      := False;
          MessageInfo := 'Não foi encontrada a linha do Informe referente ao IRRF.';
          Exit;
        end;

        DBLancXInforme.IDLancIRRF.AsInteger   := IDLancIRRF;
        DBLancXInforme.IDInforme.AsInteger    := cdsAux.FieldByName('IDINFORME').AsInteger;
        DBLancXInforme.VlrLanc.AsFloat        := FVlrIR;
        DBLancXInforme.FlgTipoReg.AsString    := 'N';
        DBLancXInforme.FontePagadora.AsFloat  := 0;

        DBLancXInforme.ErrorIfNoRowsAffected := True;

        if not(DBLancXInforme.Insert) then
        begin
          Result      := False;
          MessageInfo := 'Erro ao inserir LancXInforme: ' + DBLancIRRF.MessageInfo;
          Exit;
        end;

      end;  // if FVlrIR <> 0
    end;  // if FVlrIR <> 0

    // INSS ----------------------------------------------------------------------------------------
    if FVlrINSS <> 0 then
    begin
      // 1º) Gravação do Valor-Base
      if FVlrBase <> 0 then
      begin
        sSQL        := 'SELECT NVL(IDINFORMEVLRBASE, 0) AS IDINFORME FROM PARAMIRRF ';
        cdsAux.Data := GetDataPacket(sSQL);

        if cdsAux.FieldByName('IDINFORME').AsInteger = 0 then
        begin
          Result      := False;
          MessageInfo := 'Não foi encontrada a linha do Informe referente ao rendimento bruto.';
          Exit;
        end;

        DBLancXInforme.IDLancIRRF.AsInteger   := IDLancIRRF;
        DBLancXInforme.IDInforme.AsInteger    := cdsAux.FieldByName('IDINFORME').AsInteger;
        DBLancXInforme.VlrLanc.AsFloat        := FVlrBase;
        DBLancXInforme.FlgTipoReg.AsString    := 'N';
        DBLancXInforme.FontePagadora.AsFloat  := 0;

        DBLancXInforme.ErrorIfNoRowsAffected := True;

        if not(DBLancXInforme.Insert) then
        begin
          Result      := False;
          MessageInfo := 'Erro ao inserir LancXInforme: ' + DBLancIRRF.MessageInfo;
          Exit;
        end;
      end;  // if FVlrBase <> 0


      // 2º) Gravação do INSS
      if FVlrINSS <> 0 then
      begin
        sSQL        := 'SELECT NVL(IDINFORMEVLRINSS, 0) AS IDINFORME FROM PARAMIRRF ';
        cdsAux.Data := GetDataPacket(sSQL);

        if cdsAux.FieldByName('IDINFORME').AsInteger = 0 then
        begin
          Result      := False;
          MessageInfo := 'Não foi encontrada a linha do Informe referente ao INSS.';
          Exit;
        end;

        DBLancXInforme.IDLancIRRF.AsInteger   := IDLancIRRF;
        DBLancXInforme.IDInforme.AsInteger    := cdsAux.FieldByName('IDINFORME').AsInteger;
        DBLancXInforme.VlrLanc.AsFloat        := FVlrINSS;
        DBLancXInforme.FlgTipoReg.AsString    := 'N';
        DBLancXInforme.FontePagadora.AsFloat  := 0;

        DBLancXInforme.ErrorIfNoRowsAffected := True;

        if not(DBLancXInforme.Insert) then
        begin
          Result      := False;
          MessageInfo := 'Erro ao inserir LancXInforme: ' + DBLancIRRF.MessageInfo;
          Exit;
        end;
      end;  // if FVlrINSS <> 0
    end;  // if FVlrINSS <> 0

    // ---------------------------------------------------------------------------------------------
    // FIM Gravação da LancXInforme
    // ---------------------------------------------------------------------------------------------

    Result := True;
  end;  // if ConnectionSide = cnsClient
end;



function TCtrlLancIRRFCaP.BuscaAliquota: Extended;
var
   sSQL   : string;
   sData  : string;
begin
  sData   := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', FDataLancto)) + ', ''DD/MM/YYYY'')';

  Result := 0;

  sSQL :=
  'SELECT '                                             + #13 +
  '  FAIXA_IRRF, ALIQUOTA_IRRF '                        + #13 +
  'FROM '                                               + #13 +
  '  IRRF '                                             + #13 +
  'WHERE '                                              + #13 +
  '  DATAINIVIGENCIA = ( '                              + #13 +
  '                    SELECT '                         + #13 +
  '                      MAX(DATAINIVIGENCIA) '         + #13 +
  '                    FROM '                           + #13 +
  '                      IRRF '                         + #13 +
  '                    WHERE '                          + #13 +
  '                      DATAINIVIGENCIA <= ' + sData   + #13 +
  '                    ) '                              + #13 +
  'ORDER BY '                                           + #13 +
  '  ALIQUOTA_IRRF '                                    + #13;

  cdsAux.Data := GetDataPacket(sSQL);

  // -----------------------------------------------------------------------------------------------

  cdsAux.First;
  while not(cdsAux.EOF) do
  begin
    if cdsAux.FieldByName('FAIXA_IRRF').AsFloat > FVlrBase then
    begin
       Result := cdsAux.FieldByName('ALIQUOTA_IRRF').AsFloat;
       Break;
    end;

    cdsAux.Next;
  end;

  // -----------------------------------------------------------------------------------------------
end;



procedure TCtrlLancIRRFCaP.LimpaCampos;
begin
  Natureza      := '';

  DataLancto    := 0;

  Documento     := 0;
  Favorecido    := 0;
  EmpresaProp   := 0;
  UsaPlanPatro  := True;

  VlrBase       := 0;
  VlrIR         := 0;
  VlrINSS       := 0;
  VlrPIS        := 0;
  VlrCOFINS     := 0;
  VlrCSLL       := 0;
  VlrCSCOFPIS   := 0;
  VlrISS        := 0;

  PercentIR     := 0;    
  VlrDepIR      := 0;    

  ContaContab   := '';
  PlanoContab   := 0;    
  PlanoPrev     := 0;
  Patro         := 0;
  Programa      := 0;
  Modulo        := 0;
  CentroCusto   := '';
  TipoRecDes    := '';
  CentroRespon  := '';
  AtivProjeto   := 0;

  CodGPS        := 0;

  CPFCGC        := '';
end;



procedure TCtrlLancIRRFCaP.PreencheCamposDB;
begin
  DBLancIRRF.VlrReferencia.AsFloat      := FVlrBase;
  DBLancIRRF.VlrPIS.AsFloat             := FVlrPIS;
  DBLancIRRF.VlrISS.AsFloat             := FVlrISS;
  DBLancIRRF.VlrIRRFNaoComp.AsFloat     := 0;
  DBLancIRRF.VlrIRRF.AsFloat            := FVlrIR;
  DBLancIRRF.VlrIOF.AsFloat             := 0;
  DBLancIRRF.VlrINSS.AsFloat            := FVlrINSS;
  DBLancIRRF.VlrDepIRRF.AsFloat         := FVlrDepIR;
  DBLancIRRF.VlrCSLL.AsFloat            := FVlrCSLL;
  DBLancIRRF.VlrCSCOFPIS.AsFloat        := FVlrCSCOFPIS;
  DBLancIRRF.VlrCOFINS.AsFloat          := FVlrCOFINS;
  DBLancIRRF.VlrBase.AsFloat            := FVlrBase;
  DBLancIRRF.PercIRRF.AsFloat           := FPercentIR;

  DBLancIRRF.IDImpostoRetido.AsFloat    := 0;
  DBLancIRRF.CodDocumento.AsFloat       := FDocumento;
  DBLancIRRF.NumLancto.AsFloat          := FNumLancto;

  DBLancIRRF.CodigoGPS.AsFloat          := 0;
  DBLancIRRF.IDDARF.AsFloat             := 0;
  DBLancIRRF.IDDocISS.AsFloat           := 0;
  DBLancIRRF.IDDocINSS.AsFloat          := 0;

  DBLancIRRF.DataPagamento.AsDateTime   := 0;
  DBLancIRRF.DataLancamento.AsDateTime  := FDataLancto;
  DBLancIRRF.DataPagamento.AsDateTime   := FDataPagto; //CPREV - Pend. 27050

  DBLancIRRF.IDModulo.AsFloat           := 3;
  DBLancIRRF.IDModuloRespon.AsFloat     := 3;

  DBLancIRRF.IDPrograma.AsFloat         := FPrograma;
  DBLancIRRF.IDPlanoPrev.AsFloat        := FPlanoPrev;
  DBLancIRRF.IDPatro.AsFloat            := FPatro;

  DBLancIRRF.IDPessoa.AsFloat           := FEmpresaProp;
  DBLancIRRF.IDEmpresa.AsFloat          := FEmpresaProp;

  DBLancIRRF.Plano.AsFloat              := FPlanoContab;
  DBLancIRRF.PlaConta.AsString          := FContaContab;
  DBLancIRRF.PlaContaRecDes.AsString    := '';
  DBLancIRRF.CodTipRecDes.AsString      := FTipoRecDes;
  DBLancIRRF.CodCentroRespon.AsString   := FCentroRespon;
  DBLancIRRF.CodCentroCusto.AsString    := FCentroCusto;
  DBLancIRRF.UnidNegoc.AsFloat          := FAtivProjeto;

  DBLancIRRF.IDHstFolhaBenef.AsFloat    := 0;
  DBLancIRRF.IDMotivo.AsFloat           := 0;

  DBLancIRRF.IDBenefIRRF.AsFloat        := FFavorecido;
  DBLancIRRF.NumDocumento.AsString      := FCPFCGC;

  DBLancIRRF.FlgIRRFNaoComp.AsFloat     := 0;

  DBLancIRRF.CodNatureza.AsString       := FNatureza;
  DBLancIRRF.CodigoGPS.AsFloat          := CodGPS;  

  DBLancIRRF.FlgFolha.AsString          := 'N';

  DBLancIRRF.FlgDARM.AsString           := '';
  DBLancIRRF.FlgDARF.AsString           := '';
end;



// -------------------------------------------------------------------------------------------------
// Propriedades
// -------------------------------------------------------------------------------------------------

procedure TCtrlLancIRRFCaP.SetDataLancto(const Value: TDateTime);
begin
  FDataLancto := Value;
end;

procedure TCtrlLancIRRFCaP.SetNatureza(const Value: string);
begin
  FNatureza := Value;
end;

procedure TCtrlLancIRRFCaP.SetEmpresaProp(const Value: Integer);
begin
  FEmpresaProp := Value;
end;

procedure TCtrlLancIRRFCaP.SetUsaPlanPatro(const Value: Boolean);
begin
  FUsaPlanPatro := Value;
end;

procedure TCtrlLancIRRFCaP.SetDocumento(const Value: Integer);
begin
  FDocumento := Value;
end;

procedure TCtrlLancIRRFCaP.SetNumLancto(const Value: Integer);
begin
  FNumLancto := Value;
end;

procedure TCtrlLancIRRFCaP.SetFavorecido(const Value: Integer);
begin
  FFavorecido := Value;
end;

procedure TCtrlLancIRRFCaP.SetPercentIR(const Value: Currency);
begin
  FPercentIR := Value;
end;

procedure TCtrlLancIRRFCaP.SetVlrBase(const Value: Currency);
begin
  FVlrBase := Value;
end;

procedure TCtrlLancIRRFCaP.SetVlrINSS(const Value: Currency);
begin
  FVlrINSS := Value;
end;

procedure TCtrlLancIRRFCaP.SetVlrIR(const Value: Currency);
begin
  FVlrIR := Value;
end;

procedure TCtrlLancIRRFCaP.SetVlrISS(const Value: Currency);
begin
  FVlrISS := Value;
end;

procedure TCtrlLancIRRFCaP.SetVlrPIS(const Value: Currency);
begin
  FVlrPIS := Value;
end;

procedure TCtrlLancIRRFCaP.SetCSCOFPIS(const Value: Currency);
begin
  FVlrCSCOFPIS := Value;
end;

procedure TCtrlLancIRRFCaP.SetVlrCOFINS(const Value: Currency);
begin
  FVlrCOFINS := Value;
end;

procedure TCtrlLancIRRFCaP.SetVlrCSLL(const Value: Currency);
begin
  FVlrCSLL := Value;
end;

procedure TCtrlLancIRRFCaP.SetContaContab(const Value: string);
begin
  FContaContab := Value;
end;

procedure TCtrlLancIRRFCaP.SetPlanoContab(const Value: Integer);
begin
  FPlanoContab := Value;
end;

procedure TCtrlLancIRRFCaP.SetPatro(const Value: Integer);
begin
  FPatro := Value;
end;

procedure TCtrlLancIRRFCaP.SetPlanoPrev(const Value: Integer);
begin
  FPlanoPrev := Value;
end;

procedure TCtrlLancIRRFCaP.SetModulo(const Value: Integer);
begin
  FModulo := Value;
end;

procedure TCtrlLancIRRFCaP.SetPrograma(const Value: Integer);
begin
  FPrograma := Value;
end;

procedure TCtrlLancIRRFCaP.SetCentroCusto(const Value: string);
begin
  FCentroCusto := Value;
end;

procedure TCtrlLancIRRFCaP.SetCentroRespon(const Value: string);
begin
  FCentroRespon := Value;
end;

procedure TCtrlLancIRRFCaP.SetCodGPS(const Value: Integer);
begin
  FCodGPS := Value;
end;

procedure TCtrlLancIRRFCaP.SetTipoRecDes(const Value: string);
begin
  FTipoRecDes := Value;
end;

procedure TCtrlLancIRRFCaP.SetVlrDepIR(const Value: Currency);
begin
  FVlrDepIR := Value;
end;

procedure TCtrlLancIRRFCaP.SetCPFCGC(const Value: string);
begin
  FCPFCGC := Value;
end;

procedure TCtrlLancIRRFCaP.SetAtivProjeto(const Value: Integer);
begin
  FAtivProjeto := Value;
end;

// -------------------------------------------------------------------------------------------------
// FIM Propriedades
// -------------------------------------------------------------------------------------------------

procedure TCtrlLancIRRFCaP.SetDataPagto(const Value: TDateTime);
begin
  FDataPagto := Value;
end;

end.
