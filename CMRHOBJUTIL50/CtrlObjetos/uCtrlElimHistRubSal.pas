{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 12/07/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlElimHistRubSal;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH;

type
  TCtrlElimHistRubSal = class(TCtrlCustomRH)
  public
    function ContarRubricas(ListaIdRubrica, ListaIdFunc: string; Mes, Ano: integer;
      IdMotivo: double): integer;
    function EliminarRubricas(DesfazerLancamentos: boolean; ListaIdRubrica,
      ListaIdFunc: string; Mes, Ano: integer; IdMotivo: double; TipoEmpresa: string): boolean;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlElimHistRubSal }

function TCtrlElimHistRubSal.ContarRubricas(ListaIdRubrica, ListaIdFunc: string;
  Mes, Ano: integer; IdMotivo: double): integer;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  COUNT(*) AS TOTREG'+CR_LF+
      'FROM'+CR_LF+
      '  HISTRUBSAL'+CR_LF+
      'WHERE'+CR_LF+
      IFF(ListaIdRubrica='', '', MontaLinhaSelSQL('(CODPROVDESC',ListaIdRubrica,2)+CR_LF)+
      QuebrarListaFiltro(2,'(IDPESSOA',ListaIdFunc,100)+ ' AND'+CR_LF+
      '  (MES       = ' +QuotedStr(IntToStr(Ano) +'/'+ PoeZero(Mes))+ ') AND'+CR_LF+
      '  (IDMOTIVO  = ' +FloatToStr(IdMotivo)+ ') AND'+CR_LF+
      '  (IDMODULO  = 21)');

    Result := _CdsAux.FieldByName('TOTREG').asInteger;
  finally
    _CdsAux.Free;
  end;
end;

function TCtrlElimHistRubSal.EliminarRubricas(DesfazerLancamentos: boolean; ListaIdRubrica,
  ListaIdFunc: string; Mes, Ano: integer; IdMotivo: double; TipoEmpresa: string): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.EliminarRubricas(DesfazerLancamentos, ListaIdRubrica,
      ListaIdFunc, Mes, Ano, IdMotivo, TipoEmpresa);
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ExecSQL(
        'DELETE HISTRUBSAL'+CR_LF+
        'WHERE'+CR_LF+
        IFF(ListaIdRubrica='', '', MontaLinhaSelSQL('(CODPROVDESC',ListaIdRubrica,2)+CR_LF)+
        QuebrarListaFiltro(2,'(IDPESSOA',ListaIdFunc,100)+ ' AND'+CR_LF+
        '  (MES       = ' +QuotedStr(IntToStr(Ano) +'/'+ PoeZero(Mes))+ ') AND'+CR_LF+
        '  (IDMOTIVO  = ' +FloatToStr(IdMotivo)+ ') AND'+CR_LF+
        '  (IDMODULO  = 21)');
      if not(Result) then
        raise Exception.Create(MessageInfo);

      if (ListaIdRubrica = '') then
      begin
        // Decrementar o Número de Ocorrências
        Result := ExecSQL(
          'UPDATE RUBRICAINDIV'+CR_LF+
          'SET NUMOCORRENCIAS = NUMOCORRENCIAS - 1,'+CR_LF+
          '    IDLOTE         = NULL,'+CR_LF+
          '    ANOMESREF      = NULL'+CR_LF+
          'WHERE'+CR_LF+
          QuebrarListaFiltro(2,'(IDPESSOA ',ListaIdFunc,100)+ ' AND'+CR_LF+
          '  (IDLOTE    = ' +FloatToStr(IdMotivo)+ ') AND'+CR_LF+
          '  (ANOMESREF = ' +QuotedStr(IntToStr(Ano) +'/'+ PoeZero(Mes))+ ')');
      if not(Result) then
        raise Exception.Create(MessageInfo);

        // Voltar os Lançamentos vindos dos sistemas previdênciários
        if (TipoEmpresa = 'P') then
        begin
          Result := ExecSQL(
            'UPDATE TMPDESC'+CR_LF+
            'SET SITENVIO        = ''0'','+CR_LF+
            '    DATARECEBIMENTO = NULL,'+CR_LF+
            '    VALORRECEBIDO   = NULL,'+CR_LF+
            '    IDSEQINTERNOFB  = NULL'+CR_LF+
            'WHERE'+CR_LF+
            QuebrarListaFiltro(2,'(IDPESSOA      ',ListaIdFunc,100)+ ' AND'+CR_LF+
            '  (IDSEQINTERNOFB = ' +FloatToStr(IdMotivo)+ ') AND'+CR_LF+
            '  (MESCOBRANCA    = ' +QuotedStr(IntToStr(Ano) +'/'+ PoeZero(Mes))+ ')');
          if not(Result) then
            raise Exception.Create(MessageInfo);
        end;
      end;  

      Commit;
      MessageInfo := ('Processo executado com sucesso.');
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

end.
