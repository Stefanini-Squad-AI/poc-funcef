{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 28/01/2002                             }
{*******************************************************}
//  pendência 19923 - faz importação de cotação de moeda de planilha excel
//  pendencia 19455 14/09/2005 - inclui o campo observacao


{
Alterações:
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
// *****************************************************************************
// Autor(a)    :  Luis Ferrari
// Data        :  23/03/2023
// Pendência   :  SIG 130171
// Rotina      :  ImportaPlanilha
// Descricao   :  Retirado a obrigatoriedade de todos os campos da tela.
//------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
SIG:  123747
Data: 10/03/2022
Nome: Ewerton Beltramini
Descrição:  Alteração para permitir que a data de inicio seja igual a data de fim na função ImportaPlanilha.
-----------------------------------------------------------------------------------------------------------
}



unit uCtrlCotacaoMoeda;

interface

Uses Classes, DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject,
     uCmControlObject, uDbCotacaoMoeda, uCmClientDataset, OleServer, Excel97, ComObj, wwQuery;

Type
  TCtrlCotacaoMoeda = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbCotacaoMoeda: TDbCotacaoMoeda;
    Fcds: TClientDataSet;
    FbCancelaImport: boolean;
    procedure Setcds(const Value: TClientDataSet);
    procedure SetbCancelaImport(const Value: boolean);

  Public
    Property cds: TClientDataSet read Fcds write Setcds;

    Property bCancelaImport: boolean read FbCancelaImport write SetbCancelaImport;
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------
    Function  ListaCotacaoMoeda( IdMoeda: Double = 0 ): OleVariant;
    Function  ListaCotacaoMoedasRef( IdCotacaoMoeda: Double = 0 ): OleVariant;
    Function  Gravar: Boolean;
    function  ValidaPeriodo( fCodMoeda: Double; dData, dDatafim: TDateTime; idcotacao: Double = 0 ): Boolean;
    Function  TestarCotacaoMoeda( rCodMoeda: Double; dDataLanc: TDateTime;
              bExato: Boolean; var rValorCota: Double ): Boolean;
    Function  ListaCotacoesIntervalo( const rCodMoeda: Double; const dInicio, dFim: TDateTime;
                                      const sAnoMesIni: String = ''; const sAnoMesFim: String = '' ): OleVariant;

    // início  pendência 19923 - faz importação de cotação de moeda de planilha excel
    Function ImportaPlanilha(const sNomeArquivo: String; const linhaIni: integer;
                             const ColDataInicio: string; const ColDataFim: string;
                             const ColValor: string; const ColMesRef: string;
                             const ColPrazo: string; const iMoeCodigo: integer;
                             const idUsuario: integer): oleVariant;

    function GravaImportacao(const bSobrescerve: boolean; const ovDados: olevariant): boolean;
    // fim - pendência 19923 - faz importação de cotação de moeda de planilha excel
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlCotacaoMoeda.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarCotacaoMoeda( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbCotacaoMoeda, [], [] );
        Msg    := _DbCotacaoMoeda.MessageInfo;

        If Not Result Then
            Raise Exception.Create( Msg );

        Commit;
     Except
        On E:Exception Do
        Begin
           Rollback;
           Result := False;
           MessageInfo := E.Message;
        End;
     End;
  End;
end;

constructor TCtrlCotacaoMoeda.Create;
begin
  inherited;
  FbCancelaImport := false;
  _DbCotacaoMoeda := TDbCotacaoMoeda.Create(Self);
  FCds     := TClientDataSet.Create( nil );
end;

destructor TCtrlCotacaoMoeda.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbCotacaoMoeda.Free;

  inherited;
end;

procedure TCtrlCotacaoMoeda.DoChangeDataBase;
begin
  inherited;
  _DbCotacaoMoeda.DataBaseName := DatabaseName;
end;

Function TCtrlCotacaoMoeda.ListaCotacaoMoeda( IdMoeda: Double ): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT C.IDCOTACAOMOEDA, C.MOECODIGO, M.MOEDESC, C.COTDATA, C.COTDATAFIM, ' +
                'C.INDICEBASE, C.COTVALOR, C.COTMESREF, C.NUMDIASPRAZO, C.IDUSUARIOINCLUSAO, C.OBSERVACAO ' + // ANDRE TAVARES - pendencia 19455 14/09/2005 - inclui o campo observacao
           'FROM MOEDA M, COTACAOMOEDA C ' +
          'WHERE M.MOEINATIVO = ''A'' AND ';

  If IdMoeda <> 0 Then
     Sql := Sql + 'C.MOECODIGO = ' + FloatToStr( IdMoeda ) + ' AND ';

  Sql := Sql + 'M.MOECODIGO = C.MOECODIGO ' +
               'ORDER BY ';

  Sql := Sql + 'M.MOEDESC, C.COTDATA';
  Result := GetDataPacket( Sql );
end;

Function TCtrlCotacaoMoeda.ListaCotacaoMoedasRef(IdCotacaoMoeda: Double): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT C.IDCOTACAOMOEDA, C.MOECODIGO, M.MOEDESC, C.COTDATA, C.COTDATAFIM, ' +
                'C.INDICEBASE, C.COTVALOR, C.COTMESREF, C.NUMDIASPRAZO, C.IDUSUARIOINCLUSAO, C.OBSERVACAO ' + // ANDRE TAVARES - pendencia 19455 14/09/2005 - inclui o campo observacao
           'FROM MOEDA M, COTACAOMOEDA C ' +
          'WHERE M.MOEINATIVO = ''A'' AND ';

  If IdCotacaoMoeda <> 0 Then
     Sql := Sql + 'C.IDCOTACAOMOEDA = ' + FloatToStr( IdCotacaoMoeda ) + ' AND ';

  Sql := Sql + 'M.MOECODIGO = C.MOECODIGO';

  If IdCotacaoMoeda = 0 Then
     Sql := Sql + ' ORDER BY M.MOEDESC, C.COTDATA';

  Result := GetDataPacket( Sql );
end;

procedure TCtrlCotacaoMoeda.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

function TCtrlCotacaoMoeda.ValidaPeriodo( fCodMoeda: Double; dData, dDatafim: TDateTime;
         idcotacao: Double ): Boolean;
var
  sSql: String;
  cdsCotacaoMoeda: TCMClientDataSet;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.ValidaPeriodoCotacaoMoeda( fCodMoeda, dData, ddatafim, idcotacao );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        cdsCotacaoMoeda := TCMClientDataSet.Create( Nil );

        Try
           // Verifica se já existe cotação cotação para a moeda especificada
           // dentro do período especificado
           sSql := 'SELECT IDCOTACAOMOEDA FROM COTACAOMOEDA ' +
                    'WHERE ( MOECODIGO = ' + FloatToStr( fcodMoeda ) + ' ) and ' +
                          '( ( COTDATA <= TO_DATE( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData ) ) + ', ''dd/mm/yyyy'' ) ' +
                             ' AND COTDATAFIM >= TO_DATE( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData ) ) + ', ''dd/mm/yyyy'' ) ) or ' +
                            '( COTDATA <= TO_DATE( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataFim ) ) + ', ''dd/mm/yyyy'' ) ' +
                             ' AND COTDATAFIM >= TO_DATE( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataFim ) ) + ', ''dd/mm/yyyy'' ) ) )';

           If IdCotacao <> 0 Then
              sSql := sSql + ' AND ( IDCOTACAOMOEDA <> ' + FloatToStr( IdCotacao ) + ' ) ';

           cdsCotacaoMoeda.Data := GetDataPacket( sSql );
           Result := cdsCotacaoMoeda.IsEmpty;
        Finally
           cdsCotacaoMoeda.Close;
        End;
     Except
        On E:Exception Do
        Begin
           Result := False;
           MessageInfo := E.Message;
        End;
     End;
  End;
End;

function TCtrlCotacaoMoeda.TestarCotacaoMoeda( rCodMoeda: Double;
         dDataLanc: TDateTime; bExato: Boolean; var rValorCota: Double ): Boolean;
var
  sSql: String;
  cdsCotacaoMoeda: TCMClientDataSet;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.TestarCotacaoMoeda( rCodMoeda, dDataLanc, bExato, rValorCota );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        cdsCotacaoMoeda := TCMClientDataSet.Create( Nil );

        Try
           sSql := 'SELECT M.MOECODIGO, C.COTVALOR, C.COTDATA, M.MOEDESC, M.MOESIGLA ' +
                     'FROM MOEDA M, COTACAOMOEDA C ' +
                    'WHERE M.MOECODIGO = ' + FloatToStr( rCodMoeda );

           If bExato Then
              sSql := sSql + ' AND ( TO_DATE( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataLanc ) ) + ', ''dd/mm/yyyy'' ) >= C.COTDATA )' +
                             ' AND ( TO_DATE( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataLanc ) ) + ', ''dd/mm/yyyy'' ) <= DECODE( C.COTDATAFIM, NULL, C.COTDATA, C.COTDATAFIM ) )' +
                             ' AND M.MOECODIGO = C.MOECODIGO(+)'
           Else
              sSql := sSql + ' AND ( C.COTDATA <= TO_DATE( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataLanc ) ) + ', ''dd/mm/yyyy'' ) )' +
                             ' AND M.MOECODIGO = C.MOECODIGO(+)' +
                             ' ORDER BY C.COTDATA DESC';

           cdsCotacaoMoeda.Data := GetDataPacket( sSql );
           cdsCotacaoMoeda.First;
           Result := True;

           If cdsCotacaoMoeda.IsEmpty Then Begin
              Result      := False;
              rValorCota  := 0;
              MessageInfo := 'Moeda não Cadastrada.';
           End;

           If Result Then Begin
              If cdsCotacaoMoeda.FieldByName( 'COTVALOR' ).IsNull Then Begin
                 Result      := False;
                 rValorCota  := 0;
                 MessageInfo := 'Não existe cotação cadastrada para a Moeda ' +
                                cdsCotacaoMoeda.FieldByName( 'MOEDESC' ).AsString;

                 If bExato Then
                    MessageInfo := MessageInfo + ' no'
                 Else
                    MessageInfo := MessageInfo + ' anterior ao';

                 MessageInfo := MessageInfo + ' dia ' + FormatDateTime( 'dd/mm/yyyy', dDataLanc ) + '. Verifique.';
              End Else
                 rValorCota := cdsCotacaoMoeda.FieldByName( 'COTVALOR' ).AsFloat;
           End;
        Finally
           cdsCotacaoMoeda.Free;
        End;
     Except
        On E:Exception Do
        Begin
           Result := False;
           MessageInfo := E.Message;
        End;
     End;
  end;
end;

//========================================================================================
// Função para buscar cotações em um período
// Data: 01/07/2002
//----------------------------------------------------------------------------------------
// Parâmetros :
//       rCodMoeda : ID da Moeda
//       dInicio   : Data Inicial        ( -1 )
//       dFim      : Data Final          ( -1 )
//       sAnoMesIni: Mes e Ano Inicial   ( null )
//       sAnoMesFim: Mes e Ano Final     ( null )
//
// Retorno : Conjunto de Cotações ( OLEVariant )
//----------------------------------------------------------------------------------------
function TCtrlCotacaoMoeda.ListaCotacoesIntervalo( const rCodMoeda: Double;
         const dInicio, dFim: TDateTime; const sAnoMesIni, sAnoMesFim: String): OleVariant;
var
  sSql: String;
Begin
  // Define Parametros
  sSql := 'SELECT M.MOECODIGO, C.COTVALOR, C.COTMESREF, C.COTDATA, M.MOEDESC, M.MOESIGLA, ' +
                 '( SUBSTR( C.COTMESREF, 3, 4 ) || SUBSTR( C.COTMESREF, 1, 2 ) ) AS ANOMES, C.OBSERVACAO ' + // ANDRE TAVARES - pendencia 19455 14/09/2005 - inclui o campo observacao
            'FROM COTACAOMOEDA C, MOEDA M ' +
           'WHERE C.MOECODIGO = ' + FloatToStr( rCodMoeda );

  If sAnoMesIni <> '' Then
     sSql := sSql + ' AND ( SUBSTR( C.COTMESREF, 3, 4 ) || SUBSTR( C.COTMESREF, 1, 2 ) ) >= ' + QuotedStr( sAnoMesIni );

  If sAnoMesFim <> '' Then
     sSql := sSql + ' AND ( SUBSTR( C.COTMESREF, 3, 4 ) || SUBSTR( C.COTMESREF, 1, 2 ) ) <= ' + QuotedStr( sAnoMesFim );

  If dInicio > 0 Then
     sSql := sSql + ' AND C.COTDATA >= TO_DATE( ' + QuotedStr( FormatDateTime( 'DD/MM/YYYY', dInicio ) ) + ', ''DD/MM/YYYY'')';

  If dFim > 0 Then
     sSql := sSql + ' AND C.COTDATA <= TO_DATE( ' + QuotedStr( FormatDateTime( 'DD/MM/YYYY', dFim ) ) + ', ''DD/MM/YYYY'')';

  sSql := sSql + ' AND C.MOECODIGO = M.MOECODIGO' +
                 ' ORDER BY C.COTDATA';
  Result := GetDataPacket( sSql );
end;



// início  pendência 19923 - faz importação de cotação de moeda de planilha excel
Function TCtrlCotacaoMoeda.ImportaPlanilha(const sNomeArquivo: String; const linhaIni: integer;
                                           const ColDataInicio: string; const ColDataFim: string;
                                           const ColValor: string; const ColMesRef: string;
                                           const ColPrazo: string; const iMoeCodigo: integer;
                                           const idUsuario: integer): oleVariant;

type
  TRegCotacao = Record
                  DataInicio : TdateTime;
                  DataFim    : TdateTime;
                  Valor      : Double;
                  Prazo      : Double;
                  MesRef     : string;
                  CodMoeda   : Double;
                  Importa    : boolean;
                End;

Const
  VetorEnumerado  : Array['A'..'Z'] Of Integer = (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26);

Var
  ExcelApp, Sheet : Variant;
  i, j, z, totlinhas, totcolunas, vMoeCodigo  : Integer;
  wDecimal   : Char;
  aRegCotacao: array of TRegCotacao;
  _cdsRedistro : TcmClientDataset;
  sMsgLog : string;
  _cdsmoeda : TCMclientDataSet;
  Qry : TwwQuery;
begin

  sMsgLog := '';
  FbCancelaImport := false;
  wDecimal         := DecimalSeparator;
  DecimalSeparator := ',';
  totlinhas := 0;
  totcolunas := 0;
  _cdsRedistro := TcmClientDataset.Create(nil);
  _cdsRedistro.close;
  _cdsRedistro.data := getDataPacket (' SELECT * FROM COTACAOMOEDA WHERE 1 = 2 ');
   //------------------------------------------------------------------------------
   // Tenta Abrir o Arquivo
   // conseguindo ou não Fecha o Arquivo
   try

     DoProgresso(['Conectando-se ao Microsoft Excel... ',
                        0,                  // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                        0,            // Mínimo de Registros  (em cima)
                        0,            // Total de Registros   (em cima)
                        0,           // Registro Atual        (em cima)
                        '',
                        '']
                        );


     // Conecta com o Excel
     ExcelApp := IDispatch(ExcelApp);
     ExcelApp := CreateOleObject('Excel.Application');
     ExcelApp.Visible := False;

     { Abre Arquivo Excel }
     ExcelApp.Workbooks.Open(sNomeArquivo,0);

      { Seleciona pasta da planilha a utulizar (Localizada abaixo da planilhja)  }
      try
        Sheet := ExcelApp.Workbooks[1].WorkSheets[copy(ExtractFileName(sNomeArquivo), 1, pos('.', ExtractFileName(sNomeArquivo))-1 )];
      except
        try
          Sheet := ExcelApp.Workbooks[1].WorkSheets['Plan1'];
        except
          try
            Sheet := ExcelApp.Workbooks[1].WorkSheets['Planilha1'];
          except
            try
              Sheet := ExcelApp.Workbooks[1].WorkSheets['Sheet1'];
            except;
              messageInfo := 'Os nomes da planilha deve ser "Plan1" ou "Sheet1" ou "Planilha1".';
              sMsgLog := sMsgLog + #13 + messageInfo;
            end;
          end;
        end;
      end;
      DoProgresso(['Importando dados da planila Excel... ',
                        0,             // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                        0,            // Mínimo de Registros  (em cima)
                        0,            // Total de Registros   (em cima)
                        0,           // Registro Atual        (em cima)
                        '',
                        '----- Início da importação  ----- '+#13#13+ sMsgLog +#13 ]
                        );
      sMsgLog := '';

      // Pausa para Abrir a Planilha a Importacao
      totlinhas := INTEGER(Sheet.UsedRange.Rows.Count);
      totcolunas := Sheet.UsedRange.columns.Count;
      setLength(aRegCotacao, (totlinhas - linhaIni) + 1);
      // Inicia a importaçao para o vetor
      j := linhaIni;
      for z := 0 to Sheet.UsedRange.columns.Count - 1 do
      Begin
      // Inicio SIG 130171 Ferrari
      // Pegar codigo da moeda
        if iMoeCodigo < 1 then
          begin
            Qry := TwwQuery.Create(nil);
            Qry.DataBaseName := 'baseDados';
            Qry.Close;
            Qry.Sql.Clear;
            Qry.Sql.Add('SELECT MOECODIGO from MOEDA WHERE MOESIGLA = '+ QuotedStr(Trim(Sheet.Cells[1,(z + 5)])));
            Qry.Open;

            vMoeCodigo :=  Qry.FieldByName('MOECODIGO').asInteger;
          end;
      // FIM SIG 130171
        setLength(aRegCotacao, (totlinhas - linhaIni) + 1);
        j := linhaIni;
        aRegCotacao[i].Importa := True;
        for i := 0 to (length(aRegCotacao) - 1) do
        begin
          { Sheet.Cells[LINHA, COLUNA] }
          if j <= totlinhas then
          begin
            aRegCotacao[i].Importa := True;
            if FbCancelaImport then
              break;
            try
  //  Inicio SIG 130171 Ferrari
              if ColDataInicio <> '' then
                aRegCotacao[i].DataInicio := strToDate(Trim(Sheet.Cells[j,VetorEnumerado[ColDataInicio[1]]]))
              else
                aRegCotacao[i].DataInicio := strToDate(Trim(Sheet.Cells[j,VetorEnumerado['A']]));
            except
              sMsgLog := messageInfo;
            end;
            try
              if ColDataFim <> '' then
                aRegCotacao[i].DataFim := strToDate(Trim(Sheet.Cells[j,VetorEnumerado[ColDataFim[1]]]))
              else
                aRegCotacao[i].DataFim := strToDate(Trim(Sheet.Cells[j,VetorEnumerado['B']]));
            except
              sMsgLog := messageInfo;
            end;
            try
              if ColValor <> '' then
                aRegCotacao[i].Valor := StrToFloat(Trim(Sheet.Cells[j,VetorEnumerado[ColValor[1]]]))
              else if Trim(Sheet.Cells[j,z + 5]) <> ''  then
                aRegCotacao[i].Valor := StrToFloat(Trim(Sheet.Cells[j,z + 5]))
              else
                aRegCotacao[i].Importa := false;
            except
              sMsgLog := messageInfo;
            end;
            try
              if ColPrazo <> '' then
                aRegCotacao[i].Prazo := StrToFloat(Trim(Sheet.Cells[j,VetorEnumerado[ColPrazo[1]]]))
              else
                aRegCotacao[i].Prazo := StrToFloat(Trim(Sheet.Cells[j,VetorEnumerado['D']]));
            except
              sMsgLog := messageInfo;
            end;
            try
              if ColMesRef <> '' then
                aRegCotacao[i].MesRef := (Trim(Sheet.Cells[j,VetorEnumerado[ColMesRef[1]]]))
              else
                aRegCotacao[i].MesRef := (Trim(Sheet.Cells[j,VetorEnumerado['C']]));
            except
              sMsgLog := messageInfo;
            end;
  //  FIM SIG 130171

            j := j + 1;
          end;
        end;
{      end;

      // Fecha o Arquivo Independente do resultado da Operacao
   finally
     DecimalSeparator :=  wDecimal;
     ExcelApp.Workbooks[1].Close(False);
     ExcelApp.Quit;
   end;
}
       try
         //passa os dados do vetor para um clientDataSet
    //     _cdsRedistro.close;
    //     _cdsRedistro.data := getDataPacket (' SELECT * FROM COTACAOMOEDA WHERE 1 = 2 ');

         for i := 0 to (length(aRegCotacao) - 1) do
         begin
           if FbCancelaImport then
             break;

           try
             if trim(aRegCotacao[i].MesRef) = '' then
             begin
               sMsgLog := sMsgLog + #13 + 'Erro na importação da linha '+ intToStr(linhaIni + i)+ '. O campo "Mês Referncia" está em branco.';
             end;

             if aRegCotacao[i].DataInicio = 0 then
             begin
               sMsgLog := sMsgLog + #13 + 'Erro na importação da linha '+ intToStr(linhaIni + i)+ '. O campo "Data Início" está em branco.';
             end;

             if aRegCotacao[i].DataFim = 0 then
             begin
               sMsgLog := sMsgLog + #13 + 'Erro na importação da linha '+ intToStr(linhaIni + i)+ '. O campo "Data Fim" está em branco.';
             end;

             if (aRegCotacao[i].DataFim < aRegCotacao[i].DataInicio) then
             begin
               sMsgLog := sMsgLog + #13 + 'Erro na importação da linha '+ intToStr(linhaIni + i)+ '. O valor do campo "Data Início" não pode ser maior que o valor do campo "Data Fim"';
             end;

             if not (aRegCotacao[i].Valor >= 0) then
             begin
               sMsgLog := sMsgLog + #13 + 'Erro na importação da linha '+ intToStr(linhaIni + i)+ '. O campo "Valor da Cotação" está em branco.';
             end;

             if (trim(aRegCotacao[i].MesRef) <> '') and (aRegCotacao[i].DataInicio > 0)
             //and (aRegCotacao[i].DataFim > 0) and (aRegCotacao[i].DataFim > aRegCotacao[i].DataInicio) then      //Ewerton Beltramini - 10/03/2022 - SIG 123747
             and (aRegCotacao[i].DataFim > 0) and (aRegCotacao[i].DataFim >= aRegCotacao[i].DataInicio)            //Ewerton Beltramini - 10/03/2022 - SIG 123747
             and (aRegCotacao[i].Importa) then    //   SIG 130171 Ferrari
             begin
               sMsgLog := 'Importada a linha '+ intToStr(linhaIni + i);
               _cdsRedistro.Append;
               _cdsRedistro.fieldByName('MOECODIGO').asInteger         := vMoeCodigo;
               _cdsRedistro.fieldByName('IDUSUARIOINCLUSAO').asInteger := idUsuario;
               _cdsRedistro.fieldByName('COTMESREF').asString  := formatdateTime('MMYYYY', strToDate('01/'+aRegCotacao[i].MesRef));
               _cdsRedistro.fieldByName('COTDATAFIM').asString         := formatDateTime('DD/MM/YYYY', aRegCotacao[i].DataFim);
               _cdsRedistro.fieldByName('COTDATA').asString            := formatDateTime('DD/MM/YYYY', aRegCotacao[i].DataInicio);
               _cdsRedistro.fieldByName('COTVALOR').asFloat            := aRegCotacao[i].Valor;
               _cdsRedistro.fieldByName('NUMDIASPRAZO').asFloat        := aRegCotacao[i].Prazo;
               _cdsRedistro.Post;
             end;


             DoProgresso(['Importando dados da planila Excel... ',
                                1,                          // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                                0,                          // Mínimo de Registros  (em cima)
                                length(aRegCotacao) - 1,    // Total de Registros   (em cima)
                                i,                          // Registro Atual        (em cima)
                                '',
                                sMsgLog +#13 ] );
             sMsgLog := '';

           except
             on E:Exception do
             begin
               messageInfo := e.Message;
               sMsgLog := '***' + MessageInfo;
             end;
           end;
         end;

    //     result := _cdsRedistro.Data;
       finally
    //     _cdsRedistro.free;

         DoProgresso(['Importando dados da planila Excel... ',
                            2,                             // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                            0,                            // Mínimo de Registros  (em cima)
                            (length(aRegCotacao) - 1),    // Total de Registros   (em cima)
                            i,                            // Registro Atual        (em cima)
                            '',
                            #13#13 + '----- Fim da importação  ----- ' ] );
       end;
      end;

      // Fecha o Arquivo Independente do resultado da Operacao
   finally
     DecimalSeparator :=  wDecimal;
     ExcelApp.Workbooks[1].Close(False);
     ExcelApp.Quit;
   end;
   sMsgLog := '***' + MessageInfo;
   result := _cdsRedistro.Data;
end;
// fim - faz importação de cotação de moeda de planilha excel

procedure TCtrlCotacaoMoeda.SetbCancelaImport(const Value: boolean);
begin
  FbCancelaImport := Value;
end;

// início  - pendência 19923 - faz gravação da importação
function TCtrlCotacaoMoeda.GravaImportacao(const bSobrescerve: boolean; const ovDados: olevariant): boolean;
var _cds : TCMclientDataSet;
    sMsg : string;
begin
  _cds := TCMclientDataSet.Create(nil);
  _cds.Data := ovDados;
  fCds.data := getDataPacket (' SELECT * FROM COTACAOMOEDA WHERE 1 = 2 ');

  messageInfo := '';
  sMsg := '';
  result := false;

  try
    StartTransaction;
    _cds.first;
    while (not _cds.eof) do
    begin
      if bSobrescerve then
        execSql(' DELETE FROM COTACAOMOEDA '+
                ' WHERE MOECODIGO = '+ _Cds.fieldByName('MOECODIGO').asString + ' AND '+
                ' COTMESREF = '+ quotedStr(_Cds.fieldByName('COTMESREF').asString) +' AND '+
                ' COTDATA =  TO_DATE('+ quotedStr(_Cds.fieldByName('COTDATA').asString) +', ''DD/MM/YYYY'') AND '+
                ' COTDATAFIM = TO_DATE(' + quotedStr(_Cds.fieldByName('COTDATAFIM').asString) +', ''DD/MM/YYYY'')');

      fCds.Append;
      fCds.fieldByName('MOECODIGO').asString  := _Cds.fieldByName('MOECODIGO').asString;
      fCds.fieldByName('COTMESREF').asString  := _Cds.fieldByName('COTMESREF').asString;
      fCds.fieldByName('COTDATA').asString    := _Cds.fieldByName('COTDATA').asString;
      fCds.fieldByName('COTDATAFIM').asString := _Cds.fieldByName('COTDATAFIM').asString;
      fCds.fieldByName('COTVALOR').asString   := _Cds.fieldByName('COTVALOR').asString;
      fCds.fieldByName('NUMDIASPRAZO').asString   := _Cds.fieldByName('NUMDIASPRAZO').asString;
      fCds.fieldByName('IDUSUARIOINCLUSAO').asString   := _Cds.fieldByName('IDUSUARIOINCLUSAO').asString;
      fCds.Post;
      try
        ApplyCds( fcds, _DbCotacaoMoeda, [], [] );
        fCds.CancelUpdates;
      except
        if Pos('XAK1COTACAOMOEDA', _DbCotacaoMoeda.MessageInfo) > 1 then
        begin
          sMsg := sMsg + ' A Cotacao do Mês Ref.: '+ _Cds.fieldByName('COTMESREF').asString +
                         ' Data Início: '+_Cds.fieldByName('COTDATA').asString +
                         ' Data Final: '+_Cds.fieldByName('COTDATAFIM').asString +
                         ' Valor: '+_Cds.fieldByName('COTVALOR').asString +
                         ' não foi gravado pois já existe cotação nestas datas.'+#13;
        end
        else
        begin
          messageInfo := _DbCotacaoMoeda.messageInfo;
          break;
        end;
      end;

      _Cds.Next;
    end;//while

    Commit;
    result := true;
    _cds.free;
    MessageInfo := MessageInfo+ #13 + sMsg;
    except
      On E:Exception Do
      Begin
         Rollback;
         Result := False;
         _cds.free;
         MessageInfo := E.Message + ' A importação não foi gravada.';
      End;
  end;
end;
// fim - pendência 19923 - faz gravação da importação

end.

