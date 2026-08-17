unit uCtrlCpExecRot;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     uCMClientDataSet, UCMTypes, Dialogs, uCtrlPadroes, uDbCpExecRot,
     uDbCpRotAprEnt, uFuncaoGeral, uCtrlCpRotApurado, uCtrlRegra, uTiposRegraMT,
     JCLSysUtils, uCtrlRoteiros, Windows, uDbCpRotApurado, uDbCpRotAprMov,
     uDbCpRotEntRD;

type
  TCtrlCpExecRot = Class(TCmControlObject)
  private

    DbCpExecRot    : TDbCpExecRot;
    DbCpRotApurado : TDbCpRotApurado;
    DbCpRotAprEnt  : TDbCpRotAprEnt;
    DbCpRotAprMov  : TDbCpRotAprMov;
    DbCpRotEntRD   : TDbCpRotEntRD;

    CtrlCpRotApurado : TCtrlCpRotApurado;
    CtrlRegra        : TCtrlRegra;
    CtrlRoteiro      : TCtrlRoteiro;

  protected

    procedure DoChangeDataBase; override;
    procedure AfterInitialize; override;

  public
    iIdEmpresa   : integer;
    iIdUsuario   : integer;
    sNomeUsuario : string;

    cdsExecRoteiros            ,
    cdsRoteirosApurados        ,               
    cdsEntradasApuradas        ,
    cdsEntradasApurRD          ,
    cdsMovimentacoesExecutadas : TCMClientDataset;

    iQtdePassos : integer;

    ProcessoInicio   : procedure of object;
    ProcessoPasso    : procedure of object;
    ProcessoTermino  : procedure of object;
    EtapasApuradas   : procedure of object;

    MovtoInicio   : procedure of object;
    MovtoPasso    : procedure of object;
    MovtoTermino  : procedure of object;

    Constructor Create; override;
    Destructor Destroy; override;

    function SelecionaRotApurado( iIdCpExecRot : integer ) : OleVariant;

    Function SalvaDados  : Boolean;

    //Processa movimentações com base em entradas
    function ProcessaMovimentacoes( iIdCpRotApurado : integer; oEntradas : OLEVariant; oMovimentacoes : OLEVariant ) : OLEVariant;

    //Recupera a última execução de roteiros
    function RecuperaUltimaExecucao : OLEVariant;

    //Roteiros apurados na data
    function RoteiroApuradoDataRef( dData : TDateTime ) : OLEVariant;

    //Execura roteiros pendentes
    function ExecutaRoteirosPendentes( iIdCpAtivo : integer; dtDe, dtAte : TDateTime ) : boolean;

    //Consulta execuções de roteiros
    function ConsultaExecRot( iIdCpExecRot, iIdCpAtivo : integer; dDe, dAte : TDateTime ) : OleVariant;

    //Exclui execução de roteiros
    function ExcluiExecRot( iIdCpExecRot : integer ) : boolean;

  end;

//Monta o SQL de entrada das regras, mediantes as entradas do roteiro
function MontaSQLEntrada( cdsEnt : TCmClientDataset ) : string;

implementation

constructor TCtrlCpExecRot.Create;
begin
  inherited;
  DbCpExecRot      := TDbCpExecRot.Create(Self);
  DbCpRotApurado   := TDbCpRotApurado.Create(Self);
  DbCpRotAprEnt    := TDbCpRotAprEnt.Create(Self);
  DbCpRotAprMov    := TDbCpRotAprMov.Create(Self);
  DbCpRotEntRD     := TDbCpRotEntRD.Create( Self);

  DbCpRotApurado.bUsaSequence := False;
  DbCpRotAprEnt.bUsaSequence  := False;

  CtrlCpRotApurado := TCtrlCpRotApurado.Create;
  CtrlRegra        := TCtrlRegra.Create;
  CtrlRoteiro      := TCtrlRoteiro.Create;
end;

destructor TCtrlCpExecRot.Destroy;
begin
  DbCpExecRot.Free;
  DbCpRotApurado.Free;
  DbCpRotAprEnt.Free;
  DbCpRotAprMov.Free;
  DbCpRotEntRD.Free;

  CtrlCpRotApurado.Free;
  CtrlRegra.Free;
  CtrlRoteiro.Free;

  inherited;
end;


procedure TCtrlCpExecRot.AfterInitialize;
begin
  inherited;
  CtrlCpRotApurado.InitializeAs( Self );
  CtrlRegra.InitializeAs( Self );
  CtrlRoteiro.InitializeAs( Self );
end;

procedure TCtrlCpExecRot.DoChangeDataBase;
begin
  inherited;
  DbCpExecRot.DataBaseName    := Databasename;
  DbCpRotApurado.DataBaseName := Databasename;
  DbCpRotAprEnt.DataBaseName  := Databasename;
  DbCpRotAprMov.DataBaseName  := Databasename;
  DbCpRotEntRD.DataBaseName  := Databasename;
end;

function TCtrlCpExecRot.SelecionaRotApurado( iIdCpExecRot : integer ) : OleVariant;
begin
  DbCpExecRot.IdCpExecRot.AsInteger := iIdCpExecRot;
  Result := GetDataPacket( DbCpExecRot.SSqlSelect );
end;


function TCtrlCpExecRot.SalvaDados : Boolean;
var
  iIDCPEXECROT    ,
  iIDCPROTAPURADO ,
  iIDCPROTAPRENT  : integer;

  procedure FiltraCds( cdsF : TCMClientDataset; sCampo : string );
  begin
    cdsF.Filtered := False;
    cdsF.Filter := '';
    if sCampo <> '' then
    begin
      cdsF.Filter   := sCampo;
      cdsF.Filtered := True;
    end;
    cdsF.First;
  end;

begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaDados;
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      //Preenche o ID das execuções
      cdsExecRoteiros.First;
      while not cdsExecRoteiros.Eof do
      begin
        if cdsExecRoteiros.FieldByName('IDCPEXECROT').AsInteger <= 0 then
        begin
          iIDCPEXECROT := cdsExecRoteiros.FieldByName('IDCPEXECROT').AsInteger;
          cdsExecRoteiros.Edit;
          cdsExecRoteiros.FieldByName('IDCPEXECROT').AsInteger := GetSequence( 'CPEXECROT' );
          cdsExecRoteiros.Post;

          FiltraCds( cdsRoteirosApurados, 'IDCPEXECROT=' + IntToStr( iIDCPEXECROT ) );

          //Preenche o ID da execução nos roteiros
          cdsRoteirosApurados.First;
          while not cdsRoteirosApurados.Eof do
          begin
            if cdsRoteirosApurados.FieldByName('IDCPEXECROT').AsInteger <> cdsExecRoteiros.FieldByName('IDCPEXECROT').AsInteger then
            begin
              cdsRoteirosApurados.Edit;
              cdsRoteirosApurados.FieldByName('IDCPEXECROT').AsInteger := cdsExecRoteiros.FieldByName('IDCPEXECROT').AsInteger;
              cdsRoteirosApurados.Post;
              //As linhas abaixo preparam novamente a varredura do início, pois o dataset é desordenado quando o campo é mudado
              cdsRoteirosApurados.First;
              Continue;
            end;
            cdsRoteirosApurados.Next;
          end;

          FiltraCds( cdsRoteirosApurados, '' );
        end;
        cdsExecRoteiros.Next;
      end;


      //Executa ações pré-processamento
      iQtdePassos := cdsRoteirosApurados.RecordCount;
      if Assigned( ProcessoInicio ) then
        ProcessoInicio;

      if iQtdePassos > 0 then
      begin

        //Preenche o ID dos detalhes
        cdsRoteirosApurados.First;
        while not cdsRoteirosApurados.Eof do
        begin

          iIDCPROTAPURADO := cdsRoteirosApurados.FieldByName('IDCPROTAPURADO').AsInteger;

          cdsRoteirosApurados.Edit;

          if iIDCPROTAPURADO <= 0 then
            cdsRoteirosApurados.FieldByName('IDCPROTAPURADO').AsInteger := GetSequence( 'CPROTAPURADO' );

          cdsRoteirosApurados.Post;

          //Preenche o ID das entradas
          FiltraCds( cdsEntradasApuradas, 'IDCPROTAPURADO=' + IntToStr( iIDCPROTAPURADO ) );
          while not cdsEntradasApuradas.Eof do
          begin
            if cdsEntradasApuradas.FieldByName('IDCPROTAPRENT').AsInteger <= 0 then
            begin
              iIDCPROTAPRENT := cdsEntradasApuradas.FieldByName('IDCPROTAPRENT').AsInteger;

              cdsEntradasApuradas.Edit;
              cdsEntradasApuradas.FieldByName('IDCPROTAPRENT').AsInteger := GetSequence( 'CPROTAPRENT' );
              cdsEntradasApuradas.Post;

              //Preenche o ID da entrada nas movimentações
              if cdsMovimentacoesExecutadas.Active then
              begin
                FiltraCds( cdsMovimentacoesExecutadas, 'IDCPROTAPRENT=' + IntToStr( iIDCPROTAPRENT ) );
                while not cdsMovimentacoesExecutadas.Eof do
                begin
                  if cdsMovimentacoesExecutadas.FieldByName('IDCPROTAPRENT').AsInteger <> cdsEntradasApuradas.FieldByName('IDCPROTAPRENT').AsInteger then
                  begin
                    cdsMovimentacoesExecutadas.Edit;
                    cdsMovimentacoesExecutadas.FieldByName('IDCPROTAPRENT').AsInteger := cdsEntradasApuradas.FieldByName('IDCPROTAPRENT').AsInteger;
                    cdsMovimentacoesExecutadas.Post;
                    //As linhas abaixo preparam novamente a varredura do início, pois o dataset é desordenado quando o campo é mudado
                    cdsEntradasApuradas.First;
                    Continue;
                  end;
                  cdsMovimentacoesExecutadas.Next;
                end;
              end;


              //Preenche o ID da entrada nos rateios
              if cdsEntradasApurRD.Active then
              begin
                FiltraCds( cdsEntradasApurRD, 'IDCPROTAPRENT=' + IntToStr( iIDCPROTAPRENT ) );
                while not cdsEntradasApurRD.Eof do
                begin
                  if cdsEntradasApurRD.FieldByName('IDCPROTAPRENT').AsInteger <> cdsEntradasApuradas.FieldByName('IDCPROTAPRENT').AsInteger then
                  begin
                    cdsEntradasApurRD.Edit;
                    cdsEntradasApurRD.FieldByName('IDCPROTAPRENT').AsInteger := cdsEntradasApuradas.FieldByName('IDCPROTAPRENT').AsInteger;
                    cdsEntradasApurRD.Post;
                    //As linhas abaixo preparam novamente a varredura do início, pois o dataset é desordenado quando o campo é mudado
                    cdsEntradasApuradas.First;
                    Continue;
                  end;
                  cdsEntradasApurRD.Next;
                end;
              end;

              //As linhas abaixo preparam novamente a varredura do início, pois o dataset é desordenado quando o campo é mudado
              cdsEntradasApuradas.First;
              Continue;
            end;

            cdsEntradasApuradas.Next;
          end;

          //Preenche o ID do roteiro apurado nas entradas
          cdsEntradasApuradas.First;
          while not cdsEntradasApuradas.Eof do
          begin
            if cdsEntradasApuradas.FieldByName('IDCPROTAPURADO').AsInteger <> cdsRoteirosApurados.FieldByName('IDCPROTAPURADO').AsInteger then
            begin
              cdsEntradasApuradas.Edit;
              cdsEntradasApuradas.FieldByName('IDCPROTAPURADO').AsInteger := cdsRoteirosApurados.FieldByName('IDCPROTAPURADO').AsInteger;
              cdsEntradasApuradas.Post;
              //As linhas abaixo preparam novamente a varredura do início, pois o dataset é desordenado quando o campo é mudado
              cdsEntradasApuradas.First;
              Continue;
            end;   
            cdsEntradasApuradas.Next;
          end;

          FiltraCds( cdsEntradasApuradas, '' );



          if cdsMovimentacoesExecutadas.Active then
          begin

            //Preenche o ID das movimentações
            FiltraCds( cdsMovimentacoesExecutadas, 'IDCPROTAPURADO=' + IntToStr( iIDCPROTAPURADO ) );
            while not cdsMovimentacoesExecutadas.Eof do
            begin
              if cdsMovimentacoesExecutadas.FieldByName('IDCPROTAPRMOV').AsInteger <= 0 then
              begin
                cdsMovimentacoesExecutadas.Edit;
                cdsMovimentacoesExecutadas.FieldByName('IDCPROTAPRMOV').AsInteger := GetSequence( 'CPROTAPRMOV' );
                cdsMovimentacoesExecutadas.Post;
                //As linhas abaixo preparam novamente a varredura do início, pois o dataset é desordenado quando o campo é mudado
                cdsMovimentacoesExecutadas.First;
                Continue;
              end;
              cdsMovimentacoesExecutadas.Next;
            end;

            //Preenche o ID do roteiro apurado nas movimentações
            cdsMovimentacoesExecutadas.First;
            while not cdsMovimentacoesExecutadas.Eof do
            begin
              if cdsMovimentacoesExecutadas.FieldByName('IDCPROTAPURADO').AsInteger <> cdsRoteirosApurados.FieldByName('IDCPROTAPURADO').AsInteger then
              begin
                cdsMovimentacoesExecutadas.Edit;
                cdsMovimentacoesExecutadas.FieldByName('IDCPROTAPURADO').AsInteger := cdsRoteirosApurados.FieldByName('IDCPROTAPURADO').AsInteger;
                cdsMovimentacoesExecutadas.Post;
                //As linhas abaixo preparam novamente a varredura do início, pois o dataset é desordenado quando o campo é mudado
                cdsMovimentacoesExecutadas.First;
                Continue;
              end;
              cdsMovimentacoesExecutadas.Next;
            end;
          
          end;

          //Executa ações de notificação de passo executado
          if Assigned( ProcessoPasso ) then
            ProcessoPasso;

          cdsRoteirosApurados.Next;
        end;

        FiltraCds( cdsEntradasApuradas        , '' );
        FiltraCds( cdsMovimentacoesExecutadas , '' );

      end;

      //Grava as execuções
      Result := ApplyCds( cdsExecRoteiros, DbCpExecRot, [], [] );
      if not Result then Raise Exception.Create( DbCpExecRot.MessageInfo );

      //Grava os roteiros
      Result := ApplyCds( cdsRoteirosApurados, DbCpRotApurado, [], [] );
      if not Result then Raise Exception.Create( DbCpRotApurado.MessageInfo );

      //Grava as entradas
      Result := ApplyCds( cdsEntradasApuradas, DbCpRotAprEnt, [], [] );
      if not Result then Raise Exception.Create( DbCpRotAprEnt.MessageInfo );

      //Grava os rateios
      Result := ApplyCds( cdsEntradasApurRD, DbCpRotEntRD, [], [] );
      if not Result then Raise Exception.Create( DbCpRotEntRD.MessageInfo );

      //Grava as movimentações
      if cdsMovimentacoesExecutadas.Active then
      begin
        Result := ApplyCds( cdsMovimentacoesExecutadas, DbCpRotAprMov, [], [] );
        if not Result then Raise Exception.Create( DbCpRotAprMov.MessageInfo );
      end;

      Commit;

      //Executa ações de pós-processamento
      if Assigned( ProcessoTermino ) then
        ProcessoTermino;

      Result := True;
    except
      on E:Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;


function MontaSQLEntrada( cdsEnt : TCmClientDataset ) : string;
var
  sCampos : string;
  FuncaoGeral : TFuncaoGeral;
  iRecNo : integer;
begin
  FuncaoGeral := TFuncaoGeral.Create;
  iRecNo := cdsEnt.RecNo;
  cdsEnt.DisableControls;
  try

    Result := '';

    if cdsEnt.IsEmpty then
      sCampos := '*'
    else
    begin
      cdsEnt.First;
      sCampos := '';
      while not cdsEnt.Eof do
      begin
        if sCampos <> '' then sCampos := sCampos + ', ';

        sCampos := sCampos + QuotedStr( FuncaoGeral.OraNumero( cdsEnt.FieldByName('VALOR').AsFloat ) ) +
                   ' as ' + cdsEnt.FieldByName('NOMEPARAREGRA').AsString;

        cdsEnt.Next;
      end;
    end;

    Result := ' select ' + sCampos + ' from DUAL ';
  finally
    FuncaoGeral.Free;
    cdsEnt.RecNo := iRecNo;
    cdsEnt.EnableControls;
  end;
end;

function TCtrlCpExecRot.ProcessaMovimentacoes( iIdCpRotApurado : integer; oEntradas, oMovimentacoes : OLEVariant ) : OLEVariant;
var
  cdsEntradas,
  cdsMovimentacoes,
  cdsResult : TCmClientDataset;
  sSQL : string;
begin
  cdsEntradas      := TCmClientDataset.Create( nil );
  cdsMovimentacoes := TCmClientDataset.Create( nil );
  cdsResult        := TCmClientDataset.Create( nil );
  try
    cdsEntradas.Data      := oEntradas;
    cdsMovimentacoes.Data := oMovimentacoes;

    Result := null;

    //Se não houver movimentações, sai da rotina
    if cdsMovimentacoes.IsEmpty then exit;

    //Monta o dataset de retorno
    cdsResult.Data := GetDataPacket(
     ' select tm.NOME as NOMEMOVIM     ,                 ' +
     '        ram.IDCPROTAPRMOV        ,                 ' +
     '        ram.IDCPTIPOMOVIM        ,                 ' +
     '        ram.IDCPROTAPURADO       ,                 ' +
     '        ram.VALOR                ,                 ' +
     '        ram.IDCPROTAPRENT        ,                 ' +
     '        ram.IDREGRA              ,                 ' +
     '        ram.IDCPCONTA            ,                 ' +
     '        ram.FLGORIGEM            ,                 ' +
     '        tm.FLGTPMOVIM            ,                 ' +
     '        tm.FLGENTSAI             ,                 ' +
     '        ram.QTDECOTAS            ,                 ' +
     '        te.NOME as NOMEENTRADA   ,                 ' +
     '        r.NOMEREGRA              ,                 ' +
     '        c.NOME as NOMECONTA      ,                 ' +
     '        ''1234567890'' as ORIGEM                   ' +
     ' from   CPROTAPRMOV ram          ,                 ' +
     '        CPTIPOMOVIM tm           ,                 ' +
     '        CPROTAPRENT rae          ,                 ' +
     '        CPTPENTRADA te           ,                 ' +
     '        REGRA       r            ,                 ' +
     '        CPCONTA     c                              ' +
     ' where  ram.IDCPTIPOMOVIM = tm.IDCPTIPOMOVIM       ' +
     '   and  ram.IDCPROTAPRENT = rae.IDCPROTAPRENT (+)  ' +
     '   and  rae.IDCPTPENTRADA = te.IDCPTPENTRADA       ' +
     '   and  ram.IDREGRA       = r.IDREGRA         (+)  ' +
     '   and  ram.IDCPCONTA     = c.IDCPCONTA       (+)  ' +
     '   and  1 = 2                                      ' );

    //Monta o SQL de entrada. Se não houver entradas, uma query padrão é utilizada
    if cdsEntradas.IsEmpty then
      sSQL := ' select * from dual '
    else
      sSQL := MontaSQLEntrada( cdsEntradas );

    //Executa ações pré-processamento
    iQtdePassos := cdsMovimentacoes.RecordCount;
    if Assigned( MovtoInicio ) then
      MovtoInicio;

    //Processa as movimentações
    cdsMovimentacoes.First;
    while not cdsMovimentacoes.Eof do
    begin

      cdsResult.Append;
      cdsResult.FieldByName('VALOR').AsFloat := 0;

      //Se a movimentação tem como origem "Entrada"...
      if cdsMovimentacoes.FieldByName('FLGORIGEM').AsString = 'E' then
      begin
        //...recupera a entrada correspondente.
        cdsEntradas.First;
        if cdsEntradas.Locate( 'IDCPTPENTRADA', cdsMovimentacoes.FieldByName('IDCPTPENTRADA').AsInteger, [] ) then
        begin
          cdsResult.FieldByName('VALOR').AsFloat           := cdsEntradas.FieldByName('VALOR').AsFloat;
          cdsResult.FieldByName('IDCPROTAPRENT').AsInteger := cdsEntradas.FieldByName('IDCPROTAPRENT').AsInteger;
          cdsResult.FieldByName('NOMEENTRADA').AsString    := cdsMovimentacoes.FieldByName('NOME_ENTRADA').AsString;
          cdsResult.FieldByName('ORIGEM').AsString         := 'Entrada';
        end;
      end;


      //Se a movimentação tem como origem "Regra"...
      if cdsMovimentacoes.FieldByName('FLGORIGEM').AsString = 'R' then
      begin
        //...executa a regra.
        CtrlRegra.RuleNumber  := cdsMovimentacoes.FieldByName('IDREGRA').AsString;
        CtrlRegra.IdEmpresa   := iIdEmpresa;
        CtrlRegra.TipoCliente := tcFundacao;
        CtrlRegra.CopiaData( GetDataPacket( sSQL ) );
        CtrlRegra.Execute;
        MessageInfo := CtrlRegra.Mensagem;
        if CtrlRegra.Error then
          raise Exception.Create( 'Erro na execução de regra ' + CtrlRegra.RuleNumber + ': ' + MessageInfo );
        cdsResult.FieldByName('VALOR').AsFloat      := StrToFloat( StringReplace( CtrlRegra.Result, '.', ',', [] ) );
        cdsResult.FieldByName('IDREGRA').AsInteger  := cdsMovimentacoes.FieldByName('IDREGRA').AsInteger;
        cdsResult.FieldByName('NOMEREGRA').AsString := cdsMovimentacoes.FieldByName('NOME_REGRA').AsString;
        cdsResult.FieldByName('ORIGEM').AsString    := 'Regra';
      end;

      cdsResult.FieldByName('IDCPROTAPRMOV').AsInteger  := 0;
      cdsResult.FieldByName('IDCPROTAPURADO').AsInteger := iIdCpRotApurado;
      cdsResult.FieldByName('NOMEMOVIM').AsString       := cdsMovimentacoes.FieldByName('NOME').AsString;
      cdsResult.FieldByName('IDCPTIPOMOVIM').AsInteger  := cdsMovimentacoes.FieldByName('IDCPTIPOMOVIM').AsInteger;
      cdsResult.FieldByName('FLGTPMOVIM').AsString      := cdsMovimentacoes.FieldByName('FLGTPMOVIM').AsString;
      cdsResult.FieldByName('FLGENTSAI').AsString       := cdsMovimentacoes.FieldByName('FLGENTSAI').AsString;
      cdsResult.FieldByName('IDCPCONTA').AsInteger      := cdsMovimentacoes.FieldByName('IDCPCONTA').AsInteger;
      cdsResult.FieldByName('NOMECONTA').AsString       := cdsMovimentacoes.FieldByName('NOME_CONTA').AsString;
      cdsResult.FieldByName('FLGORIGEM').AsString       := cdsMovimentacoes.FieldByName('FLGORIGEM').AsString;
      cdsResult.Post;

      //Executa ações de notificação de passo executado
      if Assigned( MovtoPasso ) then
        MovtoPasso;

      cdsMovimentacoes.Next;
    end;

    //Executa ações de pós-processamento
    if Assigned( MovtoTermino ) then
      MovtoTermino;

    Result := cdsResult.Data;
    
  finally
    cdsEntradas.Free;
    cdsMovimentacoes.Free;
    cdsResult.Free;
  end;
end;


function TCtrlCpExecRot.RecuperaUltimaExecucao: OLEVariant;
begin
  Result := GetDataPacket(
   ' select e.IDCPEXECROT   ,                                                               ' +
   '        e.DTEXECUCAO    ,                                                               ' +
   '        e.DTREF         ,                                                               ' +
   '        e.IDUSUARIO     ,                                                               ' +
   '        e.FLGSTATUS     ,                                                               ' +
   '        e.IDCPVALORCOTA ,                                                               ' +
   '        u.NOMEUSUARIO   ,                                                               ' +
   '        decode( e.FLGSTATUS, ''E'', ''Executado'', ''C'', ''Cotas geradas'' ) as STATUS ' +
   ' from   CPEXECROT      e ,                                                              ' +
   '        USUARIOSISTEMA u                                                                ' +
   ' where  e.DTREF = ( select max( DTREF ) from CPEXECROT )                                ' +
   '   and  e.IDUSUARIO = u.IDUSUARIO                                                       ' );
end;

function TCtrlCpExecRot.RoteiroApuradoDataRef( dData : TDateTime ) : OLEVariant;
begin
  Result := GetDataPacket(
   ' select * from cpexecrot where dtref = to_date( ' +
   QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData ) ) + ', ''dd/mm/yyyy'' ) ' );
end;


function TCtrlCpExecRot.ConsultaExecRot( iIdCpExecRot, iIdCpAtivo : integer; dDe, dAte: TDateTime): OleVariant;
var
  sSQL : string;
begin
  sSQL :=
   ' select e.IDCPEXECROT    ,                                                   ' +
   '        e.IDCPATIVO      ,                                                   ' +
   '        a.NOME as ATIVO  ,                                                   ' +
   '        e.DTREF          ,                                                   ' +
   '        e.FLGSTATUS      ,                                                   ' +
   '        decode( e.FLGSTATUS, ''E'', ''Executado'', ''Cotizado'' ) as STATUS, ' +
   '        e.IDUSUARIO      ,                                                   ' +
   '        e.IDCPVALORCOTA  ,                                                   ' +
   '        u.NOMEUSUARIO    ,                                                   ' +
   '        e.DTEXECUCAO     ,                                                   ' +
   '        v.DTCOTA                                                             ' +
   ' from   CPEXECROT      e ,                                                   ' +
   '        USUARIOSISTEMA u ,                                                   ' +
   '        CPATIVO        a ,                                                   ' +
   '        CPVALORCOTA    v                                                     ' +
   ' where  e.IDUSUARIO     = u.IDUSUARIO                                        ' +
   '   and  e.IDCPATIVO     = a.IDCPATIVO                                        ' +
   '   and  e.IDCPVALORCOTA = v.IDCPVALORCOTA (+)                                ' ;

  if iIdCpExecRot <> 0 then
    sSQL := sSQL +
     ' and e.IDCPEXECROT = ' + IntToStr( iIdCpExecRot );

  if iIdCpAtivo <> 0 then
    sSQL := sSQL +
     ' and e.IDCPATIVO = ' + IntToStr( iIdCpAtivo );

  if dDe > 0 then
    sSQL := sSQL +
     ' and e.DTREF >= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy',
     dDe ) ) + ', ''dd/mm/yyyy'' ) ';

  if dAte > 0 then
    sSQL := sSQL +
     ' and e.DTREF <= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy',
     dAte ) ) + ', ''dd/mm/yyyy'' ) ';

  sSQL := sSQL +
   ' order by e.DTREF desc, 3 ';

  Result := GetDataPacket( sSQL );
end;

function TCtrlCpExecRot.ExcluiExecRot( iIdCpExecRot : integer ) : boolean;
var
  cdsAux : TCMClientDataset;
begin
  cdsAux := TCMClientDataset.Create( nil );
  try

    try
      Result := False;

      cdsAux.Data := GetDataPacket(
        ' select IDCPROTAPURADO      ' +
        ' from   CPROTAPURADO        ' +
        ' where  FLGSTATUS   = ''C'' ' +
        '   and  IDCPEXECROT = ' + IntToStr( iIdCpExecRot ) );

      if not cdsAux.IsEmpty then
        raise Exception.Create( 'Esta execução já possui roteiros cotizados e não pode ser excluído.' );         

      StartTransaction;

      if ExecSQL(
          ' delete from CPROTAPRMOV                                                           ' +
          ' where IDCPROTAPURADO in ( select IDCPROTAPURADO                                   ' +
          '                           from   CPROTAPURADO                                     ' +
          '                           where  IDCPEXECROT = ' + IntToStr( iIdCpExecRot ) + ' ) ' ) then
        if ExecSQL(
            ' delete from CPROTENTRD                                                                    ' +
            ' where IDCPROTAPRENT in ( select IDCPROTAPRENT                                             ' +
            '                          from   CPROTAPRENT,                                              ' +
            '                                 CPROTAPURADO                                              ' +
            '                          where  CPROTAPRENT.IDCPROTAPURADO = CPROTAPURADO.IDCPROTAPURADO  ' +
            '                            and  CPROTAPURADO.FLGTIPOAPUR <> ''M''                         ' +
            '                            and  CPROTAPURADO.IDCPEXECROT = ' + IntToStr( iIdCpExecRot ) + ' ) ' ) then
          if ExecSQL(
              ' delete from CPROTAPRENT                                                           ' +
              ' where IDCPROTAPURADO in ( select IDCPROTAPURADO                                   ' +
              '                           from   CPROTAPURADO                                     ' +
              '                           where  FLGTIPOAPUR <> ''M''                             ' +
              '                             and  IDCPEXECROT = ' + IntToStr( iIdCpExecRot ) + ' ) ' ) then
            if ExecSQL(
                ' delete from CPROTAPURADO                          ' +
                ' where  IDCPEXECROT = ' + IntToStr( iIdCpExecRot )   +
                '   and  FLGTIPOAPUR <> ''M''                       ' ) then
              if ExecSQL(
                  ' update CPROTAPURADO                               ' +
                  ' set    FLGSTATUS   = ''A'' ,                      ' +
                  '        IDCPEXECROT = null                         ' +
                  ' where  IDCPEXECROT = ' + IntToStr( iIdCpExecRot ) ) then
                if ExecSQL(
                    ' delete from CPEXECROT                           ' +
                    ' where  IDCPEXECROT = ' + IntToStr( iIdCpExecRot ) ) then
                begin
                  Commit;
                  Result := True;
                  exit;
                end;

      if MessageInfo <> '' then
        raise Exception.Create( MessageInfo );


    except
      On E : Exception do
      begin
        if InTransaction then Rollback;
        Result := False;
        MessageInfo := E.Message;
        exit;
      end;
    end;

  finally
    cdsAux.Free;
  end;    
end;


function TCtrlCpExecRot.ExecutaRoteirosPendentes( iIdCpAtivo : integer; dtDe, dtAte : TDateTime ) : boolean;
var
  cdsAux         ,
  cdsRoteiros    ,
  cdsTipoRecDes  ,
  cdsEntRot      ,
  cdsDocumentos  ,
  cdsRateio      ,
  cdsAlterador   ,
  cdsMovFinan    ,
  cdsEntAux      ,
  cdsMovtoAux    : TCMClientDataset;
  iCodAlterador  ,
  iIdPessoa      : integer;
  sCodTipRecDes  : string;
  sDescAlterador ,
  sDescRecDes    ,
  sRecPag        : string;
  fValor         : extended;
  sAux, sSQL     : string;
  i, iEnt,
  iRot, iExec    : integer;
  dAgora         ,
  dData          : TDateTime;

  procedure ProcessaEntradas;
  begin
    //Recupera as entradas do roteiro
    cdsEntRot.Data := GetDataPacket(
     ' select   e.idcprtpentrada           ,                               ' +
     '          c.nome                     ,                               ' +
     '          c.idcptpentrada            ,                               ' +
     '          c.nomepararegra            ,                               ' +
     '          e.flgorigem                ,                               ' +
     '          e.codtiprecdes             ,                               ' +
     '          e.idpessoa                 ,                               ' +
     '          e.recpag                   ,                               ' +
     '          e.codalterador             ,                               ' +
     '          c.nome as nomeentrada      ,                               ' +
     '          t.descricao as descrecdes  ,                               ' +
     '          decode( e.flgorigem, ''R'', ''Desembolso/Recebimento'',    ' +
     '           ''V'', ''Valor Líquido da Operação'', ''Q'',              ' +
     '           ''Quantidade de Cotas'', ''A'', ''Alterador'',            ' +
     '           ''Manual'' ) as origem                                    ' +
     ' from     cprtpentrada    e          ,                               ' +
     '          cptpentrada     c          ,                               ' +
     '          tiporecebdesemb t                                          ' +
     ' where    e.idcptpentrada = c.idcptpentrada                          ' +
     '   and    e.idcproteiro  = ' + cdsRoteiros.FieldByName('IDCPROTEIRO').AsString +
     '   and    e.codtiprecdes  = t.codtiprecdes (+)                       ' +
     '   and    e.recpag        = t.recpag       (+)                       ' +
     '   and    e.idpessoa      = t.idpessoa     (+)                       ' +
     ' order by c.nome ' );

    //Insere, no dataset de entradas, os dados apurados
    cdsEntRot.First;
    while not cdsEntRot.Eof do
    begin

      fValor := 0;

      iCodAlterador  := 0;
      iIdPessoa      := 0;
      sCodTipRecDes  := '';
      sRecPag        := '';
      sDescAlterador := '';
      sDescRecDes    := '';

      //Se a origem é um rateio...
      if cdsEntRot.FieldByName('FLGORIGEM').AsString = 'R' then
      begin

        cdsRateio.Filter   := 'CODTIPRECDES LIKE ''' + cdsEntRot.FieldByName('CODTIPRECDES').AsString + '%''';
        cdsRateio.Filtered := True;

        cdsRateio.First;
        while not cdsRateio.Eof do
        begin

          fValor := fValor + cdsRateio.FieldByName('VALOR').AsFloat;

          iIdPessoa     := cdsEntRot.FieldByName('IDPESSOA').AsInteger;
          sCodTipRecDes := cdsEntRot.FieldByName('CODTIPRECDES').AsString;
          sRecPag       := cdsEntRot.FieldByName('RECPAG').AsString;
          sDescRecDes   := cdsEntRot.FieldByName('DESCRECDES').AsString;

          cdsEntradasApurRD.Append;
          cdsEntradasApurRD.FieldByName('IDCPROTENTRD').AsInteger   := 0;
          cdsEntradasApurRD.FieldByName('IDCPROTAPRENT').AsInteger  := iEnt;

          if cdsRateio.FindField('IDRATEIODOCUM') <> nil then
            cdsEntradasApurRD.FieldByName('IDRATEIODOCUM').AsInteger  := cdsRateio.FieldByName('IDRATEIODOCUM').AsInteger;
          if cdsRateio.FindField('IDRATEIOFINANC') <> nil then
            cdsEntradasApurRD.FieldByName('IDRATEIOFINANC').AsInteger := cdsRateio.FieldByName('IDRATEIOFINANC').AsInteger;

          cdsEntradasApurRD.Post;

          cdsRateio.Next;
        end;

        cdsRateio.Filtered := False;
        cdsRateio.Filter   := '';

      end
      else
      begin

        if ( cdsRoteiros.FieldByName('FLGORIGEM').AsString = 'P' ) or
           ( cdsRoteiros.FieldByName('FLGORIGEM').AsString = 'R' ) then
        begin

          //Se a origem é o valor líquido do lançamento
          if cdsEntRot.FieldByName('FLGORIGEM').AsString = 'V' then
            fValor := cdsDocumentos.FieldByName('VALOR').AsFloat;

          //Se a origem é a quantidade de cotas do documento
          if cdsEntRot.FieldByName('FLGORIGEM').AsString = 'Q' then
            fValor := cdsDocumentos.FieldByName('QTDECOTAS').AsFloat;

          //Se a origem é um alterador
          if cdsEntRot.FieldByName('FLGORIGEM').AsString = 'A' then
          begin
            cdsAlterador.Data := GetDataPacket(
             ' select a.DESCRICAO, ' +
             '        l.VALOR ' +
             ' from   TIPOALTERADOR a , ' +
             '        ( select CODALTERADOR, ' +
             '                 VALOR ' +
             '          from   LANCTODOCUM ' +
             '          where  OPERACAO      = 4 ' +
             '            and  CODDOCUMENTO  = ' + cdsDocumentos.FieldByName('CODDOCUMENTO').AsString +
             '            and  CODALTERADOR  = ' + cdsEntRot.FieldByName('CODALTERADOR').AsString +
             '            and  ESTORNO is null ) l ' +
             ' where  a.CODALTERADOR = l.CODALTERADOR (+) ' +
             '   and  a.CODALTERADOR = ' + cdsEntRot.FieldByName('CODALTERADOR').AsString );

            fValor := cdsAlterador.FieldByName('VALOR').AsFloat;

            iCodAlterador  := cdsEntRot.FieldByName('CODALTERADOR').AsInteger;
            sDescAlterador := cdsAlterador.FieldByName('DESCRICAO').AsString;

          end;

        end;

      end;

      cdsEntradasApuradas.Append;
      cdsEntradasApuradas.FieldByName('IDCPROTAPURADO').AsInteger := cdsRoteirosApurados.FieldByName('IDCPROTAPURADO').AsInteger;
      cdsEntradasApuradas.FieldByName('IDCPROTAPRENT').AsInteger  := iEnt;
      cdsEntradasApuradas.FieldByName('NOME').AsString            := cdsEntRot.FieldByName('NOME').AsString;
      cdsEntradasApuradas.FieldByName('IDCPTPENTRADA').AsInteger  := cdsEntRot.FieldByName('IDCPTPENTRADA').AsInteger;
      cdsEntradasApuradas.FieldByName('NOMEPARAREGRA').AsString   := cdsEntRot.FieldByName('NOMEPARAREGRA').AsString;
      cdsEntradasApuradas.FieldByName('FLGORIGEM').AsString       := cdsEntRot.FieldByName('FLGORIGEM').AsString;
      cdsEntradasApuradas.FieldByName('ORIGEM').AsString          := cdsEntRot.FieldByName('ORIGEM').AsString;
      cdsEntradasApuradas.FieldByName('VALOR').AsFloat            := fValor;
      cdsEntradasApuradas.FieldByName('CODALTERADOR').AsInteger   := iCodAlterador;
      cdsEntradasApuradas.FieldByName('DESCALTERADOR').AsString   := sDescAlterador;
      cdsEntradasApuradas.FieldByName('CODTIPRECDES').AsString    := sCodTipRecDes;
      cdsEntradasApuradas.FieldByName('RECPAG').AsString          := sRecPag;
      cdsEntradasApuradas.FieldByName('IDPESSOA').AsInteger       := iIdPessoa;     
      cdsEntradasApuradas.FieldByName('DESCRECDES').AsString      := sDescRecDes;
      cdsEntradasApuradas.Post;

      Dec( iEnt );

      cdsEntRot.Next;
    end;
  end;

begin
  Result := False;

  try
    dAgora := Now;

    cdsRoteirosApurados.Close;
    cdsEntradasApuradas.Close;
    cdsMovimentacoesExecutadas.Close;
    cdsExecRoteiros.Close;

    cdsAux         := TCMClientDataset.Create( nil );
    cdsRoteiros    := TCMClientDataset.Create( nil );
    cdsEntRot      := TCMClientDataset.Create( nil );
    cdsDocumentos  := TCMClientDataset.Create( nil );
    cdsRateio      := TCMClientDataset.Create( nil );
    cdsAlterador   := TCMClientDataset.Create( nil );
    cdsMovtoAux    := TCMClientDataset.Create( nil );
    cdsEntAux      := TCMClientDataset.Create( nil );
    cdsMovFinan    := TCMClientDataset.Create( nil );
    cdsTipoRecDes  := TCMClientDataset.Create( nil );
    try

      //Recupera todos os roteiros manuais pendentes
      sSQL := CtrlCpRotApurado.SQLRoteiros  +
       ' and cra.FLGTIPOAPUR =  ''M'' ' +
       ' and cra.FLGSTATUS   =  ''A'' ' +
       ' and cra.DTAPURACAO  >= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dtDe  ) ) + ', ''dd/mm/yyyy'' ) ' +
       ' and cra.DTAPURACAO  <= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dtAte ) ) + ', ''dd/mm/yyyy'' ) ' ;

      if iIdCpAtivo > 0 then
        sSQL := sSQL +
         ' and cr.IDCPATIVO = ' + IntToStr( iIdCpAtivo );

      sSQL := sSQL +
       ' order by cra.DTAPURACAO ';

      cdsRoteirosApurados.Data := GetDataPacket( sSQL );


      //Varre o dataset de roteiros apurados para pegar o seus IDs
      cdsRoteirosApurados.First;
      while not cdsRoteirosApurados.Eof do
      begin                                   
        //Aproveita e informa a data de execução do roteiro
        cdsRoteirosApurados.Edit;
        cdsRoteirosApurados.FieldByName('DTEXECUCAO').AsDateTime := dAgora;
        cdsRoteirosApurados.Post;

        if sAux <> '' then sAux := sAux + ', ';
        sAux := sAux + cdsRoteirosApurados.FieldByName('IDCPROTAPURADO').AsString;

        cdsRoteirosApurados.Next;
      end;

      //Recupera todas as entradas manuais dos roteiros pendentes
      if sAux <> '' then
        cdsEntradasApuradas.Data := CtrlCpRotApurado.DadosRotAprEnt( sAux )
      else
        cdsEntradasApuradas.Data := CtrlCpRotApurado.DadosRotAprEnt( -1 );


      //Prepara o dataset de rateios de entradas 
      cdsEntradasApurRD.Data := GetDataPacket( ' select * from CPROTENTRD where 1 = 2 ' );


      //Recuperação de roteiros não-manuais
      sSQL :=
       ' select   r.RECPAG          ,                 ' +
       '          r.NOME            ,                 ' +
       '          r.IDPESSOA        ,                 ' +
       '          r.IDCPROTEIRO     ,                 ' +
       '          r.FLGOPERACAO     ,                 ' +
       '          r.DTINICIO        ,                 ' +
       '          r.DTFIM           ,                 ' +
       '          r.DESCRICAO       ,                 ' +
       '          r.CODTIPRECDES    ,                 ' +
       '          r.FLGATIVO        ,                 ' +
       '          r.FLGORIGEM       ,                 ' +
       '          r.IDCPATIVO       ,                 ' +
       '          t.CODTIPRECDES    ,                 ' +
       '          t.RECPAG          ,                 ' +
       '          t.ANASINT         ,                 ' +
       '          a.IDPLANOPREV     ,                 ' +
       '          a.IDPATRO         ,                 ' +
       '          a.DTABERT         ,                 ' +
       '          a.NOME as NOMEATIVO                 ' +
       '  from    CPROTEIRO r       ,                 ' +
       '          CPATIVO   a       ,                 ' +
       '          TIPORECEBDESEMB t                   ' +
       ' where    r.FLGATIVO     = ''S''              ' +
       '   and    r.IDCPATIVO    = a.IDCPATIVO        ' +
       '   and    r.CODTIPRECDES = t.CODTIPRECDES (+) ' +
       '   and    r.RECPAG       = t.RECPAG       (+) ' +
       '   and    ( ( r.DTFIM is null ) or ( r.dtfim >= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dtDe ) ) + ', ''dd/mm/yyyy'' ) ) ) ' +
       '   and    r.DTINICIO <= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dtAte ) ) + ', ''dd/mm/yyyy'' ) ' ;

      if iIdCpAtivo > 0 then
        sSQL := sSQL +
         ' and r.IDCPATIVO = ' + IntToStr( iIdCpAtivo );

      sSQL := sSQL +
       ' order by r.FLGOPERACAO,            ' +
       '          r.NOME                    ' ;

      cdsRoteiros.Data := GetDataPacket( sSQL );

      //Executa ações pré-processamento
      iQtdePassos := cdsRoteiros.RecordCount;
      if Assigned( ProcessoInicio ) then
        ProcessoInicio;

      //Inicia os "sequences"
      iEnt     := -1;
      iRot     := -1;
      iExec    := -1;

      //Prepara o dataset de execuções
      cdsExecRoteiros.Data := ConsultaExecRot( 0, iIdCpAtivo, dtDe, dtAte );

      //Para cada roteiro, faz a apuração
      cdsRoteiros.First;
      while not cdsRoteiros.Eof do
      begin
        dData := dtDe;

        if dData < cdsRoteiros.FieldByName('DTABERT').AsDateTime then
          dData := cdsRoteiros.FieldByName('DTABERT').AsDateTime;

        while dData <= dtAte do
        begin

          //Apurações pelo Contas a Pagar ou pelo Contas a Receber
          if ( cdsRoteiros.FieldByName('FLGORIGEM').AsString = 'P' ) or
             ( cdsRoteiros.FieldByName('FLGORIGEM').AsString = 'R' ) then
          begin

            //Recupera todos os documentos que possuam um rateio com
            //desembolso/recebimento indicado como principal para o rateio corrente
            sSQL :=
             ' select   distinct                                                  ' +
             '          cr.nome         ,                                         ' +
             '          cr.idcproteiro  ,                                         ' +
             '          d.coddocumento  ,                                         ' +
             '          d.nodocumento   ,                                         ' +
             '          nvl( d.qtdecotas, 0 ) as qtdecotas ,                      ' +
             '          ld.numlancto    ,                                         ' +
             '          ld.debcre       ,                                         ' +
             '          ld.datalancto   ,                                         ' +
             '          nvl( ld.valor, 0 ) as valor                               ' +
             ' from     cproteiro   cr  ,                                         ' +
             '          rateiodocum rd  ,                                         ' +
             '          lanctodocum ld  ,                                         ' +
             '          documento   d                                             ' +
             ' where    cr.recpag       =  rd.recpag                              ' +
             '   and    rd.codtiprecdes like ( trim( cr.codtiprecdes ) || ''%'' ) ' +
             '   and    rd.coddocumento =  d.coddocumento                         ' +
             '   and    d.recpag        =  cr.recpag                              ' +
             '   and    d.coddocumento  =  ld.coddocumento                        ' +
             '   and    cr.flgativo     =  ''S''                                  ' +
             '   and    ld.datalancto  = to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData ) ) + ', ''dd/mm/yyyy'' ) ' ;


            //Se o ativo possuir plano, faz filtragem por ele...
            if cdsRoteiros.FieldByName('IDPLANOPREV').AsInteger > 0 then
              sSQL := sSQL +
               ' and rd.IDPLANOPREV = ' + cdsRoteiros.FieldByName('IDPLANOPREV').AsString;


            //Se o ativo possuir patrocinadora, faz filtragem por ele...
            if cdsRoteiros.FieldByName('IDPATRO').AsInteger > 0 then
              sSQL := sSQL +
               ' and rd.IDPATRO = ' + cdsRoteiros.FieldByName('IDPATRO').AsString;


            if cdsRoteiros.FieldByName('FLGOPERACAO').AsString = 'D' then
              sSQL := sSQL +
               ' and    ld.operacao     =  5                                      ' +
               ' and    ld.debcre       = ' + QuotedStr( Iff(
                cdsRoteiros.FieldByName('RECPAG').AsString = 'P', 'D', 'C' ) )      +
               ' and    ld.numlancto    = ( select min( ld2.numlancto )           ' +
               '                            from   lanctodocum ld2                ' +
               '                            where  ld2.operacao = 5               ' +
               '                              and  ld2.coddocumento = ld.coddocumento)';


            if cdsRoteiros.FieldByName('FLGOPERACAO').AsString = 'E' then
              sSQL := sSQL +
               ' and    ld.operacao     =  5                                      ' +
               ' and    ld.estorno      is not null                               ' +
               ' and    ld.debcre       = ' + QuotedStr( Iff(
                cdsRoteiros.FieldByName('RECPAG').AsString = 'P', 'C', 'D' ) );


            if cdsRoteiros.FieldByName('FLGOPERACAO').AsString = 'P' then
              sSQL := sSQL +
               ' and    ld.operacao     =  5                                      ' +
               ' and    ld.debcre       = ' + QuotedStr( Iff(
                cdsRoteiros.FieldByName('RECPAG').AsString = 'P', 'D', 'C' ) )      +
               ' and    ld.numlancto    > ( select min( ld2.numlancto )           ' +
               '                            from   lanctodocum ld2                ' +
               '                            where  ld2.operacao = 5               ' +
               '                              and  ld2.coddocumento = ld.coddocumento)';

           
            sSQL := sSQL +
               ' and   not exists ( select * from cprotapurado c2 where c2.coddocumento = d.coddocumento ) ' +
               ' and   cr.idcproteiro  = ' + cdsRoteiros.FieldByName('IDCPROTEIRO').AsString +
               ' order by d.coddocumento ' ;

            cdsDocumentos.Data := GetDataPacket( sSQL );

            //Para cada documento, recupera os rateios e apura as entradas
            cdsDocumentos.First;
            while not cdsDocumentos.Eof do
            begin

              //Insere, no dataset de roteiros, os dados apurados
              cdsRoteirosApurados.Append;
              cdsRoteirosApurados.FieldByName('IDCPROTAPURADO').AsInteger := iRot;
              cdsRoteirosApurados.FieldByName('NOME').AsString            := cdsRoteiros.FieldByName('NOME').AsString;
              cdsRoteirosApurados.FieldByName('DTAPURACAO').AsDateTime    := dData;
              cdsRoteirosApurados.FieldByName('NOMEUSUARIO').AsString     := sNomeUsuario;
              cdsRoteirosApurados.FieldByName('FLGSTATUS').AsString       := 'A';
              cdsRoteirosApurados.FieldByName('SITUACAO').AsString        := 'Apurado';
              cdsRoteirosApurados.FieldByName('IDCPROTEIRO').AsInteger    := cdsRoteiros.FieldByName('IDCPROTEIRO').AsInteger;
              cdsRoteirosApurados.FieldByName('IDUSUARIO').AsInteger      := iIdUsuario;
              cdsRoteirosApurados.FieldByName('IDCPATIVO').AsInteger      := cdsRoteiros.FieldByName('IDCPATIVO').AsInteger;
              cdsRoteirosApurados.FieldByName('NOMEATIVO').AsString       := cdsRoteiros.FieldByName('NOMEATIVO').AsString;
              cdsRoteirosApurados.FieldByName('FLGTIPOAPUR').AsString     := 'D';
              cdsRoteirosApurados.FieldByName('TIPOAPUR').AsString        := 'Por documento';
              cdsRoteirosApurados.FieldByName('DTEXECUCAO').AsDateTime    := dAgora;
              cdsRoteirosApurados.FieldByName('OBSERVACAO').AsString      := '';
              cdsRoteirosApurados.FieldByName('DATALANCTO').AsDateTime    := cdsDocumentos.FieldByName('DATALANCTO').AsDateTime;
              cdsRoteirosApurados.FieldByName('CODDOCUMENTO').AsInteger   := cdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger;
              cdsRoteirosApurados.FieldByName('NODOCUMENTO').AsString     := cdsDocumentos.FieldByName('NODOCUMENTO').AsString;
              cdsRoteirosApurados.FieldByName('CODDOCUMENTO').AsString    := cdsDocumentos.FieldByName('CODDOCUMENTO').AsString;
              cdsRoteirosApurados.FieldByName('NUMLANCTO').AsInteger      := cdsDocumentos.FieldByName('NUMLANCTO').AsInteger;
              cdsRoteirosApurados.FieldByName('FLGOPERACAO').AsString     := cdsRoteiros.FieldByName('FLGOPERACAO').AsString;
              cdsRoteirosApurados.FieldByName('OPERACAO').AsString        := iff( cdsRoteiros.FieldByName('FLGOPERACAO').AsString = 'D', 'Baixa Documento',
                                                                             iff( cdsRoteiros.FieldByName('FLGOPERACAO').AsString = 'E', 'Estorno Baixa',
                                                                             'Próxima Baixa' ) );
              cdsRoteirosApurados.Post;

              //Recupera os rateios DAQUELE PLANO E PATRO
              sSQL :=
               ' select   r.coddocumento             ,    ' +
               '          r.idrateiodocum            ,    ' +
               '          r.codtiprecdes             ,    ' +
               '          r.idpessoa                 ,    ' +
               '          r.recpag                   ,    ' +
               '          t.descricao as descrecdes  ,    ' +
               '          nvl( r.valor, 0 ) as valor      ' +
               ' from     rateiodocum     r          ,    ' +
               '          tiporecebdesemb t               ' +
               ' where    r.codtiprecdes = t.codtiprecdes ' +
               '   and    r.recpag       = t.recpag       ' +
               '   and    r.idpessoa     = t.idpessoa     ' +
               '   and    r.coddocumento = ' + cdsDocumentos.FieldByName('CODDOCUMENTO').AsString;

              if cdsRoteiros.FieldByName('IDPLANOPREV').AsInteger > 0 then
                sSQL := sSQL + ' and r.IDPLANOPREV  = ' + cdsRoteiros.FieldByName('IDPLANOPREV').AsString;

              if cdsRoteiros.FieldByName('IDPATRO').AsInteger > 0 then
                sSQL := sSQL + ' and r.IDPATRO  = ' + cdsRoteiros.FieldByName('IDPATRO').AsString;

              cdsRateio.Filtered := False;
              cdsRateio.Filter   := '';  
              cdsRateio.Data := GetDataPacket( sSQL );

              ProcessaEntradas;

              Dec( iRot );

              cdsDocumentos.Next;

            end;

          end;


          //Apurações pelo Controle Financeiro
          if cdsRoteiros.FieldByName('FLGORIGEM').AsString = 'F' then
          begin

            //Recupera todos os rateios de lançamentos financeiros com
            //desembolso/recebimento indicado como principal para o rateio corrente
            sSQL :=
             ' select mv.codlancfinanc ,                    ' +
             '        mv.numchqbordero ,                    ' +
             '        mv.datalancfinan                      ' +
             ' from   cproteiro    cr  ,                    ' +
             '        movimfinanc  mv  ,                    ' +
             '        rateiofinanc rt                       ' +
             ' where  mv.codlancfinanc = rt.codlancfinanc   ' +
             '   and  cr.codtiprecdes  = rt.codtiprecdes    ' +
             '   and  rt.recpag        = cr.recpag          ' +
             '   and  cr.flgativo      = ''S''              ' +
             '   and  mv.datalancfinan = to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData ) ) + ', ''dd/mm/yyyy'' ) ' +
             ' and   cr.idcproteiro  = ' + cdsRoteiros.FieldByName('IDCPROTEIRO').AsString +
             ' and   not exists ( select * from cprotapurado c2 where c2.codlancfinanc = mv.codlancfinanc ) ' ;

            //Se o ativo possuir plano, faz filtragem por ele...
            if cdsRoteiros.FieldByName('IDPLANOPREV').AsInteger > 0 then
              sSQL := sSQL +
               ' and rt.IDPLANOPREV = ' + cdsRoteiros.FieldByName('IDPLANOPREV').AsString;

            //Se o ativo possuir patrocinadora, faz filtragem por ele...
            if cdsRoteiros.FieldByName('IDPATRO').AsInteger > 0 then
              sSQL := sSQL +
               ' and rt.IDPATRO = ' + cdsRoteiros.FieldByName('IDPATRO').AsString;   

            sSQL := sSQL +  
             ' order by mv.codlancfinanc ' ;

            cdsMovFinan.Data := GetDataPacket( sSQL );

            //Para cada movimento, recupera os rateios e apura as entradas
            cdsMovFinan.First;
            while not cdsMovFinan.Eof do
            begin
              //Insere, no dataset de roteiros, os dados apurados
              cdsRoteirosApurados.Append;
              cdsRoteirosApurados.FieldByName('IDCPROTAPURADO').AsInteger := iRot;
              cdsRoteirosApurados.FieldByName('NOME').AsString            := cdsRoteiros.FieldByName('NOME').AsString;
              cdsRoteirosApurados.FieldByName('DTAPURACAO').AsDateTime    := dData;
              cdsRoteirosApurados.FieldByName('NOMEUSUARIO').AsString     := sNomeUsuario;
              cdsRoteirosApurados.FieldByName('FLGSTATUS').AsString       := 'A';
              cdsRoteirosApurados.FieldByName('SITUACAO').AsString        := 'Apurado';
              cdsRoteirosApurados.FieldByName('IDCPROTEIRO').AsInteger    := cdsRoteiros.FieldByName('IDCPROTEIRO').AsInteger;
              cdsRoteirosApurados.FieldByName('IDUSUARIO').AsInteger      := iIdUsuario;
              cdsRoteirosApurados.FieldByName('IDCPATIVO').AsInteger      := cdsRoteiros.FieldByName('IDCPATIVO').AsInteger;
              cdsRoteirosApurados.FieldByName('NOMEATIVO').AsString       := cdsRoteiros.FieldByName('NOMEATIVO').AsString;
              cdsRoteirosApurados.FieldByName('FLGTIPOAPUR').AsString     := 'F';
              cdsRoteirosApurados.FieldByName('TIPOAPUR').AsString        := 'Por lançamento financeiro';
              cdsRoteirosApurados.FieldByName('DTEXECUCAO').AsDateTime    := dAgora;
              cdsRoteirosApurados.FieldByName('OBSERVACAO').AsString      := '';
              cdsRoteirosApurados.FieldByName('DATALANCTO').AsDateTime    := cdsMovFinan.FieldByName('DATALANCFINAN').AsDateTime;
              cdsRoteirosApurados.FieldByName('CODLANCFINANC').AsInteger  := cdsMovFinan.FieldByName('CODLANCFINANC').AsInteger;
              cdsRoteirosApurados.FieldByName('NODOCUMENTO').AsString     := cdsMovFinan.FieldByName('NUMCHQBORDERO').AsString;
              cdsRoteirosApurados.Post;


              //Recupera os rateios DAQUELE PLANO E PATRO
              sSQL :=
               ' select   r.idrateiofinanc           ,     ' +
               '          r.codtiprecdes             ,     ' +
               '          r.idpessoa                 ,     ' +
               '          r.recpag                   ,     ' +
               '          t.descricao as descrecdes  ,     ' +
               '          nvl( r.valor, 0 ) as valor       ' +
               ' from     rateiofinanc    r          ,     ' +
               '          tiporecebdesemb t                ' +
               ' where    r.codtiprecdes  = t.codtiprecdes ' +
               '   and    r.recpag        = t.recpag       ' +
               '   and    r.idpessoa      = t.idpessoa     ' +               
               '   and    r.codlancfinanc = ' + cdsMovFinan.FieldByName('CODLANCFINANC').AsString;

              if cdsRoteiros.FieldByName('IDPLANOPREV').AsInteger > 0 then
                sSQL := sSQL + ' and r.IDPLANOPREV  = ' + cdsRoteiros.FieldByName('IDPLANOPREV').AsString;

              if cdsRoteiros.FieldByName('IDPATRO').AsInteger > 0 then
                sSQL := sSQL + ' and r.IDPATRO  = ' + cdsRoteiros.FieldByName('IDPATRO').AsString;

              cdsRateio.Data := GetDataPacket( sSQL );

              ProcessaEntradas;

              Dec( iRot );

              cdsMovFinan.Next;
            end;

          end;

          dData := dData + 1;
        end;

        //Executa ações de notificação de passo executado
        if Assigned( ProcessoPasso ) then
          ProcessoPasso;

        cdsRoteiros.Next;
      end;

      //Se não houver roteiros, sai do processo
      if cdsRoteiros.IsEmpty then
        exit;

      //Registra execuções
      dData := dtDe;
      while dData <= dtAte do
      begin
        cdsRoteiros.First;
        while not cdsRoteiros.Eof do
        begin
          if dData < cdsRoteiros.FieldByName('DTABERT').AsDateTime then
          begin
            cdsRoteiros.Next;
            Continue;
          end;

          cdsExecRoteiros.First;
          if cdsExecRoteiros.Locate( 'IDCPATIVO;DTREF', VarArrayOf([cdsRoteiros.FieldByName('IDCPATIVO').AsInteger, dData ]), [] ) then
          begin
            cdsExecRoteiros.Edit;
          end
          else
          begin
            cdsExecRoteiros.Append;
            cdsExecRoteiros.FieldByName('IDCPEXECROT').AsInteger := iExec;
            cdsExecRoteiros.FieldByName('IDCPATIVO').AsInteger   := cdsRoteiros.FieldByName('IDCPATIVO').AsInteger;
            cdsExecRoteiros.FieldByName('DTREF').AsDateTime      := dData;
            cdsExecRoteiros.FieldByName('FLGSTATUS').AsString    := 'E';
            cdsExecRoteiros.FieldByName('STATUS').Asstring       := 'Executado';
            cdsExecRoteiros.FieldByName('ATIVO').AsString        := cdsRoteiros.FieldByName('NOMEATIVO').AsString;
            Dec( iExec );
          end;
          cdsExecRoteiros.FieldByName('IDUSUARIO').AsInteger   := iIdUsuario;
          cdsExecRoteiros.FieldByName('NOMEUSUARIO').AsString  := IntToStr( iIdUsuario );
          cdsExecRoteiros.FieldByName('DTEXECUCAO').AsDateTime := dAgora;
          cdsExecRoteiros.Post;
          cdsRoteiros.Next;
        end;
        dData := dData + 1;
      end;

      cdsExecRoteiros.First;
      while not cdsExecRoteiros.Eof do
      begin
        cdsRoteirosApurados.First;
        while not cdsRoteirosApurados.Eof do
        begin
          if   ( cdsExecRoteiros.FieldByName('IDCPATIVO').AsInteger = cdsRoteirosApurados.FieldByName('IDCPATIVO').AsInteger   )
           and ( cdsExecRoteiros.FieldByName('DTREF').AsDateTime    = cdsRoteirosApurados.FieldByName('DTAPURACAO').AsDateTime ) then
          begin
            cdsRoteirosApurados.Edit;
            cdsRoteirosApurados.FieldByName('IDCPEXECROT').AsInteger := cdsExecRoteiros.FieldByName('IDCPEXECROT').AsInteger; 
            cdsRoteirosApurados.Post;
          end;
          cdsRoteirosApurados.Next;
        end;
        cdsExecRoteiros.Next;
      end;


      //Indica que a apuração das etapas foi concluída
      iQtdePassos := cdsRoteirosApurados.RecordCount;
      if Assigned( EtapasApuradas ) then
        EtapasApuradas;

      //Executa o cálculo das movimentações
      cdsRoteirosApurados.First;
      while not cdsRoteirosApurados.Eof do
      begin

        //Cria um dataset apenas com as entradas deste roteiro
        cdsEntAux.Data := cdsEntradasApuradas.Data;
        cdsEntAux.EmptyDataSet;
        cdsEntradasApuradas.First;
        while not cdsEntradasApuradas.Eof do
        begin
          if cdsEntradasApuradas.FieldByName('IDCPROTAPURADO').AsInteger = cdsRoteirosApurados.FieldByName('IDCPROTAPURADO').AsInteger then
          begin
            cdsEntAux.Append;
            for i := 0 to ( cdsEntradasApuradas.FieldCount - 1 ) do
              cdsEntAux.Fields[i].Value := cdsEntradasApuradas.Fields[i].Value;
            cdsEntAux.Post;
          end;
          cdsEntradasApuradas.Next;
        end;

        //Processa as movimentações do roteiro atual
        cdsMovtoAux.Close;
        cdsMovtoAux.Data := ProcessaMovimentacoes( cdsRoteirosApurados.FieldByName('IDCPROTAPURADO').AsInteger,
         cdsEntAux.Data, CtrlRoteiro.CarregaCpRTpMovim( cdsRoteirosApurados.FieldByName('IDCPROTEIRO').AsInteger ) );

        //Se não houve movimentações...
        if cdsMovtoAux.Active and ( not cdsMovtoAux.IsEmpty ) then
        begin

          //Pega a estrutura do dataset de movimentações
          if not cdsMovimentacoesExecutadas.Active then
          begin
            cdsMovimentacoesExecutadas.Data := cdsMovtoAux.Data;
            cdsMovimentacoesExecutadas.EmptyDataSet;
          end;

          cdsMovtoAux.First;
          while not cdsMovtoAux.Eof do
          begin
            cdsMovimentacoesExecutadas.Append;
            for i := 0 to ( cdsMovtoAux.FieldCount - 1 ) do
              cdsMovimentacoesExecutadas.FieldByName( cdsMovtoAux.Fields[i].FieldName ).Value := cdsMovtoAux.Fields[i].Value;

            cdsMovimentacoesExecutadas.Post;

            cdsMovtoAux.Next;
          end;

        end;

        //Marca o roteiro como "executado"
        cdsRoteirosApurados.Edit;
        cdsRoteirosApurados.FieldByName('FLGSTATUS').AsString := 'E';
        cdsRoteirosApurados.Post;

        //Executa ações de notificação de passo executado
        if Assigned( ProcessoPasso ) then
          ProcessoPasso;

        cdsRoteirosApurados.Next;
      end;

      //Executa ações de pós-processamento
      if Assigned( ProcessoTermino ) then
        ProcessoTermino;

      Result := True;

    finally
      cdsAux.Free;
      cdsRoteiros.Free;
      cdsDocumentos.Free;
      cdsEntRot.Free;
      cdsRateio.Free;
      cdsAlterador.Free;
      cdsMovtoAux.Free;
      cdsEntAux.Free;
      cdsMovFinan.Free;
      cdsTipoRecDes.Free;
    end;

  except
    On E : Exception do
    begin
      if InTransaction then Rollback;
      MessageInfo := E.Message;
      Result := False;
      exit;
    end;
  end;
end;

end.
