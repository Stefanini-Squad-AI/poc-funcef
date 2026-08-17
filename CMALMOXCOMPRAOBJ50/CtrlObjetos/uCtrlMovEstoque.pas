{---------------------------------------------------------------------------------
 Data      : 21.06.2006
 Autor     : Antonio Marcos (amf)
 Pendência : ???
 Descrição : Alteração na Const MSG_CONTROL_VALIDADE.
 ---------------------------------------------------------------------------------
 Rotina    : GeraMovimento
 Data      : 25/03/2004
 Autor     : Marchetti
 Pendência : 16111
 Descrição : CodTipoMov = 'A' não gravar IDMOVENTRADA
 ---------------------------------------------------------------------------------
// Atualizado por: andre tavares - 22/01/2004 - pendência 15218
}
unit uCtrlMovEstoque;

Interface

Uses DB, Classes, uDataBase,uCmDbObject, uCmControlObject,
     uMidasUtil, sysUtils, dbclient, uSistema,DMovEstoque,
     uDbCustoMed, uDbMoviment, uDbLoteVali, uDbSaldo, jclMath,
     uCtrlUnMedida ;

Const
   ZERO = 0.00;

   MSG_MOV_DEPOIS_DATAREP  = 'Este lançamento está depois da data de represamento. NÃO influenciará na contagem física';
   MSG_CONTAGEM_ABERTA     = 'Existe uma contagem aberta para este item. Este lançamento influenciará na analise das diferenças de contagem';
   MSG_INTEGRACAO_CONTABIL = 'Proibido movimentação. Pois a integração da contabalidade já foi efetuada na data ';
   MSG_PROIBIDO_MOVIMENTO  = 'Proibido movimentação. Pois o último inventário nesta unidade de Custeio foi feito em ';
   //amf 21.06.2006 ???   MSG_CONTROL_VALIDADE    = 'Proibido movimentação. Produto controla valideda e a data de validade não preenchida';
   //amf 21.06.2006 ??? - Acerto da mensagem
   MSG_CONTROL_VALIDADE    = 'Proibido movimentação. Produto controla validade e a data de validade não está preenchida';

Type
   TTipoLanc = ( tlEntrada , tlSaida, tlEntradaCusto );

Type TCustoMed = Class(TObject)
     Public
        CodCusteio  : LongInt;
        CodArtigo   : String;
        SaldoQtdeUC : Double;
        CustoMedio  : Double;
     End;
Type TMoviment = Class(TObject)
     Public
        IDMOV            : Double;
        CODTIPOMOV       : String;
        CODARTIGO        : String;
        CODALMOXARIFADO  : LongInt;
        DATAMOV          : TDateTime;
        QTDEMOV          : Double;
        VALORMOV         : Double;
        CUSTOMEDIOMOV    : Double;
        SALDOQTDEMOV     : Double;
        CODALMOXTRANSF   : LongInt;
        FLGENTRADACUSTO  : String;
        CODCUSTEIO       : Integer;
     End;

Type
  TCtrlMovEstoque = Class(TCmControlObject)
  Protected
     Procedure AfterInitialize; Override;
     procedure DoChangeDataBase; Override;
  Private
    _DtmMovEstoque : TDtmMovEstoque;
  //----------------------------------------------------------------------------
  // Classes de Persistência
  //----------------------------------------------------------------------------
    _DbCustoMed : TDbCustoMed;
    _DbMoviment : TDbMoviment;
    _DbLoteVali : TDbLoteVali;
    _DbSaldo    : TDbSaldo;
    _UnMedida   : TCtrlUnMedida;
  //----------------------------------------------------------------------------
    {**
      Gerar o novo Saldo de Quantida do Artigo no Almoxarifado
      Caso o Arigo não tenha saldo ( não exista na tabela)
      ele insere o Artigo na tabela.
    **}
    Function CalculaSaldo( IdPessoa        : Integer;
                           QtdeMov         : Double;
                           CodArtigo       : String;
                           DataMov         : TDateTime;
                           CodAlmoxarifado : Double;
                           Var bInsert     : Boolean ) : Double;
    {**
      Verifica se a data esta dentro do perído represado. Caso não
      não altera o saldo.
    **}
    Function VerifDataRepresa( IdPessoa : Integer;
                               Data     : TDateTime ) : Boolean;
    {**
      Calcula o novo custo medio e Atualizar a tabela de custo médio
      caso o artigo não exista, ele incluído.
    **}
    Function CalculaCustoMedio ( IdPessoa   : Integer;
                                 TipoLanc   : TTipoLanc;
                                 CodCusteio : LongInt;
                                 CodArtigo  : String;
                                 DataMov    : TDateTime;
                                 QtdeMov    : Double;
                                 ValorMov   : Double ) : Double;
   {**
      Corrige problemas de arredondamento das casas decimais
   **}
   Function ConvNum( n : Double ) : Double;
   {**
     Verifica se a data esta dentro do perído já integrado com a
     contabilidade
   **}
   Function VerifIntegraContab( IdPessoa : Integer;
                                Data     : TDateTime;
                                Var Dt   : TDateTime ) : Boolean;
   {**
     Verifica se a data esta dentro do perído represado. Caso não
     não altera o saldo.
   **}
   Function VerifDataInvent( IdPessoa   : Integer;
                             CodCusteio : Integer;
                             Data       : TDateTime;
                             Var Dt     : TDateTime ) : Boolean;

   {**
      Pega Centro de custo do almoxarifado
   **}
   Procedure GetCCAlmoxarifado( CodAlmoxarifado    : Integer;
                                Var CodCentroCusto : String;
                                Var IdEmpresa      : Integer );
   {**
      Pega o codigo da unidade de medida padrão (a de custo)
   **}
   function GetCodMedCusto(CodArtigo: String): String;

  Public
    constructor Create;  Override;
    Destructor  Destroy; Override;
    {**
       Entra com o saldo do lote do produto. Caso não existe
       cria.
    **}
    Function EntraLoteVali( CodAlmoxarifado : Integer;
                            CodArtigo       : String;
                            DataVali        : TDateTime;
                            QtdeMov         : Double ) : boolean;
    {**
       Executa a transferência do saldo do lote do produto
       Para outro almoxarifado.
    **}
    Function SaiLoteVali( CodAlmoxarifado : Integer;
                          CodArtigo       : String;
                          DataVali        : TDateTime;
                          QtdeMov         : Double;
                          CodAlmoxTransf  : Integer ) : boolean;
   {**
      Informa o saldo do lote na data determinada
   **}
    Function InfoSaldoLoteVali( CodAlmoxarifado : Integer;
                                CodArtigo       : String;
                                Data            : TDateTime = 0 ) : Double;
   {**
      Gera os lançamentos no almoxariofado
   **}
    Function  GeraMovimento( TipoLanc        : TTipoLanc;  // Indica se o Movimento é Entrada /Saída
                             IdPessoa        : Integer;    // Empresa próprietária
                             ValorMov        : Double;     // Valor Movimentado
                             QtdeMov         : Double;     // Quantidade Movimentado
                             CodCusteio      : LongInt;    // Unidade de Custeio do Almoxarifado de Origem
                             CodAlmoxarifado : longint;    // Almoxarifado de Origem
                             CodArtigo       : String;     // Artigo Movimentado
                             Lote            : String;     // Lote do Artigo
                             CodTipoMov      : String;     // Tipo da Movimentacao
                             CodMedida       : String;     // Unidade de Media Utilizada
                             DataValidade    : TDateTime;  // Data de Validade do Artigo (só Entrada)
                             DataMov         : TDateTime;  // Data da Movimentação
                             NumDocumento    : String;     // Número do documento
                             CentroCusto     : String;     // Centro de Custo
                             IdEmpresa       : LongInt;    // IdPessoa do Centro de Custo
                             CodAlmoxTransf  : longint;    // Almoxarifado de Destino ( caso seja Transferência )
                             UnidNegoc       : longint) : Double; // Indica a Atividade e Projeto.
     {**
        Pega a data de implantação do sistema
     **}
     Function GetDataImplantacao(IdPessoa : Integer) : TDateTime;
     {**
        Pega a data de Represamento do sistema
     **}
     Function GetDataRepresa(IdPessoa : Integer) : TDateTime;

     {**
        Atualizalção em massa da tabela moviment
     **}
     Function AtualizaSaldo ( IdPessoa        : Integer;
                              Data            : TDateTime;
                              CodArtigo       : String;
                              CodAlmoxarifado : LongInt ) : Double;
     {**
        Busca os ultimos movimentos dos almoxarifado na sua  unidade
        de custeito. Através da ultima movimentação antes da data
        determinada. Após posicionamos a table de CUSTOMED. Na ultima
        movimentação antes da data deteriminada. Para poder recalcular
        os preços médios.
     **}
     Function GeraRetroativo ( IdPessoa  : Integer;
                               Data      : TDateTime;
                               CodArtigo : String ) : Boolean;
     {**
        Pega a última data dentro do período represado, ou seja, a
        última data válida para influenciar o saldo do produto.
     **}
     Function GetUltDataMovRepresado( IdPessoa  : Integer;
                                      CodArtigo : String ) : TDateTime;
     {**
        Atualiza a movimentação com o movimento de entrada e
        a plano contábil
     **}
     Function UpdMovimento( IdMov        : Double;
                            IdMovEntrada : Double;
                            PlnCodigo    : Integer ) : Boolean;
     {**
        Informa o saldo do artigo no almoxarifado dererminado.
     **}
     Function InfoSaldo ( IdPessoa        : Integer;
                          CodArtigo       : String;
                          codAlmoxarifado : LongInt;
                          Data            : TDateTime ) : Double;
     {**
        Verifica se o produto contrala a validade
     **}
     Function TestaValidade( CodProduto : String ) : Boolean;
  End;

implementation

{ TCtrlMovEstoque }

function TCtrlMovEstoque.AtualizaSaldo(IdPessoa: Integer; Data: TDateTime;
  CodArtigo: String; CodAlmoxarifado: Integer): Double;
Var
    rSaldoQtde    : Double; // Saldo da quantidade em esto no Almoxarifado
    rSaldoRepresa : Double; // É o saldo do Artigo até a data represa
begin
   CodArtigo := Copy (CodArtigo + '               ',1,14);
   Try
      With _DtmMovEstoque Do
         Begin
            // Pega o ultimo movimento antes da data determinada.
            spSaldoRepresado.Prepare;
            spSaldoRepresado.ParamByName('DATAMOV').AsDate            := Data;
            spSaldoRepresado.ParamByName('CODARTIGO').AsString        := CodArtigo;
            spSaldoRepresado.ParamByName('CODALMOXARIFADO').AsInteger := CodAlmoxarifado;

            cds.Data := spSaldoRepresado.Data;

            rSaldoQtde    := ConvNum(cds.FieldByName('SALDO').asFloat);
            rSaldoRepresa := ConvNum(cds.FieldByName('SALDO').asFloat);

            spAtualizaSaldo.Prepare;
            spAtualizaSaldo.ParamByName('DATAMOV').AsDate            := Data;
            spAtualizaSaldo.ParamByName('CODARTIGO').AsString        := CodArtigo;
            spAtualizaSaldo.ParamByName('CODALMOXARIFADO').AsInteger := CodAlmoxarifado;

            cds.Data := spAtualizaSaldo.Data;
            cds.First;

            While Not cds.Eof Do
               Begin
                  rSaldoQtde := ConvNum(rSaldoQtde) + ConvNum(cds.FieldByName('QTDEMOV').asFloat);

                  spUpdSaldoMov.Prepare;
                  spUpdSaldoMov.ParamByName('SALDOQTDEMOV').asFloat := StrToFloat( FormatFloat('#0.00000',rSaldoQtde ) );
                  spUpdSaldoMov.ParamByName('IDMOV').asFloat        := cds.FieldByName('IDMOV').asFloat;

                  If Not ExecSQL( spUpdSaldoMov.SQLChanged,True ) Then
                     Raise Exception.Create( MessageInfo );

                  If Not VerifDataRepresa(IdPessoa, cds.FieldByName('DATAMOV').asDateTime) Then
                     rSaldoRepresa := ConvNum(rSaldoQtde);
                  cds.Next;
               End;
               If Not VerifDataRepresa( IdPessoa, Data ) Then
                  Begin
                     _DbSaldo.CodArtigo.AsString        := CodArtigo;
                     _DbSaldo.CodAlmoxarifado.AsInteger := codAlmoxarifado;
                     If _DbSaldo.LoadFromDb Then
                        Begin
                           _DbSaldo.SaldoQtde.AsFloat  := ConvNum(StrToFloat( FormatFloat('#0.00000',rSaldoRepresa)));

                           If Not _DbSaldo.Update Then
                              Raise Exception.Create( _DbSaldo.MessageInfo );
                        End;
                  End;
            Result := ConvNum(rSaldoQtde);
         End;
   Except
      On E : Exception Do
      Begin
          MessageInfo := E.Message;
          Raise;
      End;
   End;
end;

function TCtrlMovEstoque.CalculaCustoMedio(IdPessoa : Integer; TipoLanc: TTipoLanc;
  CodCusteio: Integer; CodArtigo: String; DataMov: TDateTime; QtdeMov,
  ValorMov: Double): Double;
Var
  NovoSaldoQtde : Double;
begin
   CodArtigo := Copy(CodArtigo +'                ',1,14);
   Try
      If VerifDataRepresa( IdPessoa, DataMov ) Then
         Begin
             QtdeMov  := 0;
             ValorMov := 0;
         End;
      _DbCustoMed.CodCusteio.AsFloat := CodCusteio;
      _DbCustoMed.CodArtigo.AsString := CodArtigo;

      If _DbCustoMed.LoadFromDb Then
         Begin
            NovoSaldoQtde  := _DbCustoMed.SaldoQtdeUC.AsFloat + QtdeMov;

            If (TipoLanc = tlEntrada) And (Not IsFloatZero( NovoSaldoQtde )) Then
               _DbCustoMed.CustoMedio.AsFloat := ConvNum( ((_DbCustoMed.CustoMedio.AsFloat * _DbCustoMed.SaldoQtdeUC.AsFloat) + ValorMov ) / NovoSaldoQtde );

            _DbCustoMed.SaldoQtdeUC.AsFloat := NovoSaldoQtde;

            If Not _DbCustoMed.Update Then
               Raise Exception.Create(_DbCustoMed.MessageInfo);
         End
      Else
         Begin
            _DbCustoMed.CodCusteio.AsFloat := CodCusteio;
            _DbCustoMed.CodArtigo.AsString := CodArtigo;

            If QtdeMov = 0 Then { Teste para Ver se há alteração de Custo Médio}
               _DbCustoMed.CustoMedio.AsFloat := ValorMov
            Else
               _DbCustoMed.CustoMedio.AsFloat := ValorMov /QtdeMov;

            _DbCustoMed.SaldoQtdeUC.AsFloat := QtdeMov;

            If Not _DbCustoMed.Insert Then
               Raise Exception.Create(_DbCustoMed.MessageInfo);
         End;

    // inicio - andre tavares - 22/01/2004 -pendência 15218
    //  Result := _DbCustoMed.CustoMedio.AsFloat;
      Result := convNum(_DbCustoMed.CustoMedio.AsFloat);
    // fim - andre tavares - 22/01/2004 -pendência 15218

   Except
      On E:Exception Do
      Begin
         Result := -1;
         MessageInfo := E.Message;
      End;
   End;
end;

function TCtrlMovEstoque.CalculaSaldo(IdPessoa : Integer; QtdeMov: Double; CodArtigo: String;
  DataMov: TDateTime; CodAlmoxarifado: Double; var bInsert: Boolean): Double;
begin
   bInsert   := False;
   CodArtigo := Copy(CodArtigo +'                ',1,14);
   Try
      If VerifDataRepresa( IdPessoa, DataMov ) Then
         QtdeMov := 0;

      _DbSaldo.CodAlmoxarifado.AsFloat := CodAlmoxarifado;
      _DbSaldo.CodArtigo.AsString      := CodArtigo;
      If _DbSaldo.LoadFromDb Then
         Begin
             _DbSaldo.SaldoQtde.AsFloat := _DbSaldo.SaldoQtde.AsFloat + QtdeMov;

             If Not _DbSaldo.Update Then
                Raise Exception.Create(_DbSaldo.MessageInfo);
         End
      Else
         Begin
             bInsert := True;
             _DbSaldo.CodAlmoxarifado.AsFloat := CodAlmoxarifado;
             _DbSaldo.CodArtigo.AsString      := CodArtigo;
             _DbSaldo.IdPessoa.AsFloat        := IdPessoa;
             _DbSaldo.SaldoQtde.AsFloat       := QtdeMov;

             If Not _DbSaldo.Insert Then
                Raise Exception.Create(_DbSaldo.MessageInfo);
         End;
      // Retorna o novo saldo
      Result := _DbSaldo.SaldoQtde.AsFloat
   Except
      On E:Exception Do
      Begin
         Result := -1;
         MessageInfo := E.Message;
      End;
   End;
end;

function TCtrlMovEstoque.ConvNum( n : Double ): Double;
begin
    // inicio - andre tavares - 22/01/2004 -pendência 15218
    // Result := StrToFloat(Format('%20.5f',[n]));
    Result := StrToFloat(Format('%20.7f',[n]));
    // fim - andre tavares - 22/01/2004 -pendência 15218
end;

constructor TCtrlMovEstoque.Create;
begin
  inherited;
  _DbCustoMed    := TDbCustoMed.Create(Self);
  _DbMoviment    := TDbMoviment.Create(Self);
  _DbLoteVali    := TDbLoteVali.Create(Self);
  _DbSaldo       := TDbSaldo.Create(Self);
  _DtmMovEstoque := TDtmMovEstoque.Create(nil);
  _UnMedida      := TCtrlUnMedida.Create;
end;

destructor TCtrlMovEstoque.Destroy;
begin
   _DbCustoMed.Free;
   _DbMoviment.Free;
   _DbLoteVali.Free;
   _DbSaldo.Free;
   _DtmMovEstoque.Free;
   _UnMedida.Free;
  
   inherited;
end;

procedure TCtrlMovEstoque.DoChangeDataBase;
begin
   inherited;
   _DbCustoMed.DataBaseName := DataBaseName;
   _DbMoviment.DataBaseName := DataBaseName;
   _DbLoteVali.DataBaseName := DataBaseName;
   _DbSaldo.DataBaseName    := DataBaseName;
end;

function TCtrlMovEstoque.EntraLoteVali(CodAlmoxarifado: Integer;
  CodArtigo: String; DataVali: TDateTime; QtdeMov: Double): boolean;
begin
   Result := True;
   Try
      CodArtigo := Copy( CodArtigo+'                ',1,14);

      _DbLoteVali.CodAlmoxarifado.AsInteger := CodAlmoxarifado;
      _DbLoteVali.CodArtigo.AsString        := CodArtigo;
      _DbLoteVali.DataValidade.AsDateTime   := DataVali;
      If _DbLoteVali.LoadFromDb Then
         Begin
            Result := True;
            _DbLoteVali.SaldoLote.AsFloat := _DbLoteVali.SaldoLote.AsFloat + QtdeMov;

            If Not _DbLoteVali.Update Then
               Raise Exception.Create(_DbLoteVali.MessageInfo);
         End
      Else
         Begin
            _DbLoteVali.CodAlmoxarifado.AsInteger := CodAlmoxarifado;
            _DbLoteVali.CodArtigo.AsString        := CodArtigo;
            _DbLoteVali.DataValidade.AsDateTime   := DataVali;
            _DbLoteVali.SaldoLote.AsFloat := QtdeMov;

            If Not _DbLoteVali.Insert Then
               Raise Exception.Create(_DbLoteVali.MessageInfo);
         End;
   Except
      On E:Exception Do
      Begin
         Result := False;
         MessageInfo := E.Message;
      End;
   End;

end;

function TCtrlMovEstoque.GeraMovimento(TipoLanc: TTipoLanc;
  IdPessoa: Integer; ValorMov, QtdeMov: Double; CodCusteio,
  CodAlmoxarifado: Integer; CodArtigo, Lote, CodTipoMov, CodMedida: String;
  DataValidade, DataMov: TDateTime; NumDocumento, CentroCusto: String;
  IdEmpresa, CodAlmoxTransf, UnidNegoc: Integer): Double;
Var
   sLoteValidade   : String;   // Indica se o produto tem controle de validade
   rNovoCustoMedio : Double;   // Novo custo médio após uma movimentação de Entrada
   rSaldoQtdeMov   : Double;   // Novo Saldo de Quantidade do Artigo no Almoxarifado origem
   Dt              : TDateTime;// Varial auxiliar usada para mostra datas
   bInsert         : Boolean;  // Indica se Está Inserindo Saldo e Custo Médio
   sEntradaCusto   : String;
begin
   CodTipoMov    := Trim(CodTipoMov);
   CodArtigo     := Copy( CodArtigo + '            ',1, 14);
   sEntradaCusto := 'N';
   If TipoLanc = tlEntradaCusto then
      Begin
         sEntradaCusto := 'S';
         TipoLanc      := tlEntrada;
      end;
   //
   If TipoLanc = tlSaida Then
      Begin
          QtdeMov  := QtdeMov * (-1);
          ValorMov := ValorMov * (-1);
      End;
   Try
       // Verifica se é implantação de saldo
       If (CodTipoMov <> 'Z') Then
          Begin
             With _DtmMovEstoque Do
                Begin
                   spDataTrava.Prepare;
                   spDataTrava.ParamByName('CODARTIGO').AsString        := CodArtigo;
                   spDataTrava.ParamByName('CODALMOXARIFADO').AsInteger := CodAlmoxarifado;

                   cds.Data := spDataTrava.Data;

                   If ( Not cds.IsEmpty ) And ( (CodTipoMov[1] <> 'D') and (CodTipoMov[1] <> 'H') And (CodTipoMov[1] <> 'X') ) Then
                      Begin
                         If VerifDataRepresa(IdPessoa,DataMov) Then
                            MessageInfo := MSG_MOV_DEPOIS_DATAREP
                         Else
                            MessageInfo := 'No dia '+cds.FieldByName('DATATRAVA').AsString + MSG_CONTAGEM_ABERTA;

                         //If (MsgDlg('Confirma o Lançamento','Confirmação',mtConfirmation,[mbOk,mbCancel],0)) = mrCancel then
                         //  Exit;
                      End;
                   If Not VerifIntegraContab(IdPessoa,DataMov, Dt ) Then
                      Raise Exception.Create(MSG_INTEGRACAO_CONTABIL + DateToStr( Dt ));

                   If Not VerifDataInvent( IdPessoa, CodCusteio, DataMov, Dt ) Then
                      Raise Exception.Create(MSG_PROIBIDO_MOVIMENTO + DateToStr( Dt ));
                End;
          End;
   //==========================================================================================================================================================================================================================
   // Converter SaldoQtde e ValorMov para Unidade do Custo Medio
   //==========================================================================================================================================================================================================================
         QtdeMov := _UnMedida.QtdeToUnCustoMedio( CodArtigo, CodMedida, QtdeMov );
   //==========================================================================================================================================================================================================================
   // Verifica o Saldo do Artigo na Tabela. Se não tiver inclui na tabela
   //==========================================================================================================================================================================================================================
         rSaldoQtdeMov := CalculaSaldo( IdPessoa,QtdeMov,CodArtigo,DataMov,
                                        CodAlmoxarifado, bInsert );
         If rSaldoQtdeMov =  -1 Then
            Raise Exception.Create( MessageInfo );
   //==========================================================================================================================================================================================================================
   // Calcula o novo Custo Médio e Saldo Em Quantidade da Unidade de Custeio
   //==========================================================================================================================================================================================================================
         rNovoCustoMedio := CalculaCustoMedio(IdPessoa, TipoLanc,CodCusteio,CodArtigo,DataMov,
                                              QtdeMov,ValorMov );
         If rNovoCustoMedio =  -1 Then
            Raise Exception.Create( MessageInfo );

         if TipoLanc = tlSaida Then
            Begin
               ValorMov := QtdeMov * rNovoCustoMedio;
            End;
   //==========================================================================================================================================================================================================================
   // Gera um movimento de Implantação de Saldo 'Z'. Caso haja movimentação sem implantação de Saldo prévia
   //==========================================================================================================================================================================================================================
         If ( bInsert ) and ( CodtipoMov <> 'Z') Then
            Begin
                Dt := GetDataImplantacao(IdPessoa);
              
                If GeraMovimento(tlEntrada,
                                 IdPessoa,
                                 0,
                                 0,
                                 CodCusteio,
                                 CodAlmoxarifado,
                                 CodArtigo,
                                 Lote,
                                 'Z',
                                 CodMedida,
                                 Dt,
                                 Dt,
                                 '',
                                 CentroCusto,
                                 idEmpresa,
                                 -1,UnidNegoc ) <= 0
                Then
                   Raise Exception.Create( MessageInfo );
            End;
   //==========================================================================================================================================================================================================================
   // Insersão na Tabela Moviment
   //==========================================================================================================================================================================================================================
         _DbMoviment.CODALMOXARIFADO.asInteger := CodAlmoxarifado;
         _DbMoviment.IDPESSOA.asInteger        := IdPessoa;
         _DbMoviment.CODARTIGO.asString        := CodArtigo;
         _DbMoviment.CODTIPOMOV.asString       := CodTipoMov;
         // inicio - andre tavares - 22/01/2004 -pendência 15218
         // _DbMoviment.CUSTOMEDIOMOV.asFloat     := StrToFloat( FormatFloat('#0.00000',rNovoCustoMedio ) );
         _DbMoviment.CUSTOMEDIOMOV.asFloat     := StrToFloat( FormatFloat('#0.0000000',rNovoCustoMedio ) );
         // fim    - andre tavares - 22/01/2004 -pendência 15218
         _DbMoviment.VALORMOV.asFloat          := StrToFloat( FormatFloat('#0.00000',ValorMov ) );
         _DbMoviment.QTDEMOV.asFloat           := StrToFloat( FormatFloat('#0.00000',QtdeMov ) );
         _DbMoviment.SALDOQTDEMOV.asFloat      := StrToFloat( FormatFloat('#0.00000',rSaldoQtdeMov ) );
         _DbMoviment.DATALANCMOV.asDateTime    := Date;
         _DbMoviment.DATAMOV.asDateTime        := DataMov;
         _DbMoviment.NUMDOCUMENTO.asString     := NumDocumento;
         _DbMoviment.FLGENTRADACUSTO.asString  := sEntradaCusto;
         _DbMoviment.UNIDNEGOC.asInteger       := UnidNegoc;
         If UnidNegoc <> 0 Then
            _DbMoviment.UNIDNEGOC.asInteger := UnidNegoc
         Else
            _DbMoviment.UNIDNEGOC.Clear;

         If Trim( CentroCusto ) <> '' Then
            Begin
               _DbMoviment.CODCENTROCUSTO.asString  := CentroCusto;
               _DbMoviment.IDEMPRESA.asInteger      := IdEmpresa;
            End
         Else
            Begin
               _DbMoviment.CODCENTROCUSTO.Clear;
               _DbMoviment.IDEMPRESA.Clear;
            End;
         If CodAlmoxTransf > 0 Then
            _DbMoviment.CODALMOXTRANSF.asInteger := CodAlmoxTransf
         Else
            _DbMoviment.CODALMOXTRANSF.Clear;

         // Pendencia 16111 - Marchetti
         // se CodTipoMov = 'A' não gravar IDMOVENTRADA
         if CodTipoMov = 'A' then _DbMoviment.IdMovEntrada.Clear;
         // Fim Pendencia 16111

         If Not _DbMoviment.Insert Then
            Raise Exception.Create( _DbMoviment.MessageInfo )
         Else
            Result := _DbMoviment.IDMOV.AsFloat;

   //============================================================================
   // Controle de Lote de validade
   //============================================================================
     With _DtmMovEstoque Do
        Begin
           spValidade.Prepare;
           spValidade.ParamByName('CODARTIGO').AsString := CodArtigo;

           cds.Data := spValidade.Data;

           sLoteValidade := cds.FieldByName('LOTEVALIDADE').AsString;
        End;

     if (sLoteValidade = 'T') And ( TipoLanc = tlEntrada) And ( DataValidade = 0 ) And
        ((CodTipoMov = 'A') or (CodTipoMov = 'K') or (CodTipoMov = 'Z')) then
       Raise Exception.Create( MSG_CONTROL_VALIDADE );

     if (sLoteValidade = 'T') And ( TipoLanc = tlEntrada) And
        ((CodTipoMov = 'A') or (CodTipoMov = 'K') or (CodTipoMov = 'Z')) then
         EntraLoteVali(CodAlmoxarifado,CodArtigo,DataValidade,QtdeMov )
     Else
     if (sLoteValidade = 'T') And ( TipoLanc = tlSaida) Then
        SaiLoteVali(CodAlmoxarifado,CodArtigo,0,QtdeMov,CodAlmoxTransf );
   //============================================================================================================================================
   // Atualziação em Massa na Tabela de Saldo
   //============================================================================================================================================
     rSaldoQtdeMov :=  AtualizaSaldo(IdPessoa,DataMov,CodArtigo,CodAlmoxarifado );

   //============================================================================================================================================
   // Atualziação em Massa do Custo Meido e Valor "BACA", se for retroativo
   //============================================================================================================================================
     If (DataMov < GetUltDataMovRepresado( IdPessoa, CodArtigo )) and ( CodtipoMov <> 'Z') Then
        GeraRetroativo(IdPessoa,DataMov,CodArtigo );

   //============================================================================================================================================
   // Geração do Movimento X
   //============================================================================================================================================
     If StrToFloat(Format('%15.5f',[rSaldoQtdeMov])) < StrToFloat(Format('%15.5f',[ZERO])) Then
        Begin
           If Trim(CentroCusto) = '' Then
             Begin
                GetCCAlmoxarifado(CodAlmoxarifado,CentroCusto,idEmpresa);
             End;

           If GeraMovimento(tlEntrada,
                            IdPessoa,
                            (rNovoCustoMedio * rSaldoQtdeMov )*(-1),
                            rSaldoQtdeMov*(-1),
                            CodCusteio,
                            CodAlmoxarifado,
                            CodArtigo,
                            '',
                            'X',
                            GetCodMedCusto(CodArtigo),
                            DataValidade,
                            DataMov,
                            NumDocumento,
                            CentroCusto,
                            idEmpresa,
                            0,UnidNegoc ) <= 0
           Then
              Raise Exception.Create( MessageInfo );
        End;
   Except
      On E:Exception Do
      Begin
         Result := -1;
         MessageInfo := E.Message;
      End;
   End;
end;

function TCtrlMovEstoque.GeraRetroativo(IdPessoa: Integer; Data: TDateTime;
  CodArtigo: String): Boolean;
Var
   lstCustoMed    : TList; // Vetor que Emula a TaBela CUSTOMED
   lstMoviment    : TList; // Vetor que Emula a TaBela MOVIMENT
   x,i            : Integer; // varialvel para indice do Vetor
   idxCM          : Integer; // varialvel para indicar o ultimo registro do Vetor CustoMed
   rSaldoQtde     : Double;  // É o antigo Saldo da unidade de Custeio Antes da Movimentação
   rCustoMed      : Double;  // É o antigo Custo Médio da unidade de Custeio Antes da Movimentação
   rValorEst      : Double;  // É o Valor em estoque por unidade de Custeio.
   rNovoCustoMed  : Double;  // É o Custo Médio da unidade de Custeio Antes da Movimentação após movimentação
   rNovoSaldoQtde : Double;  // É o Saldo da unidade de Custeio Antes da Movimentação após a movimentação
   rNovoValor     : Double;  // É o Novo Valor em estoque por Unidade de Custeio
   rValorMov      : Double;  // É o valor movimentado
   cTipoMov       : Array [0..1] of Char; // Código do tipo de Movimentação.
begin
   Result := True;
   CodArtigo := Copy(CodArtigo+'           ',1,14);
   lstCustoMed := TList.Create;
   lstMoviment := TList.Create;
   Try
      Try
         With _DtmMovEstoque Do
           Begin
              spCustoMed.Prepare;
              spCustoMed.ParamByName('CODARTIGO').asString := CodArtigo;
              spCustoMed.ParamByName('DATAMOV').asDate     := Data;
              spCustoMed.ParamByName('IDPESSOA').asInteger := IdPessoa;

              cds.Data := spCustoMed.Data;
              cds.First;
              While Not Cds.Eof Do
                 Begin
                    spSaldoUC.Prepare;
                    spSaldoUC.ParamByName('CODARTIGO').asString   := CodArtigo;
                    spSaldoUC.ParamByName('DATAMOV').asDate       := Data;
                    spSaldoUC.ParamByName('CODCUSTEIO').asInteger := cds.FieldByName('CODCUSTEIO').asInteger;
                    spSaldoUC.ParamByName('IDPESSOA').asInteger   := IdPessoa;

                    _cds.Data := spSaldoUC.Data;

                    If Not _cds.IsEmpty Then
                       Begin
                          x := lstCustoMed.Add(TCustoMed.Create);
                          TCustoMed(lstCustoMed[x]).CodCusteio  := cds.FieldByName('CODCUSTEIO').asInteger;
                          TCustoMed(lstCustoMed[x]).CodArtigo   := CodArtigo;
                          TCustoMed(lstCustoMed[x]).SaldoQtdeUC := ConvNum(_cds.FieldByName('SALDO').asFloat);
                          TCustoMed(lstCustoMed[x]).CustoMedio  := ConvNum(cds.FieldByName('CUSTOMEDIOMOV').asFloat);
                       End;

                    cds.Next;
                 End;
              spMoviment.Prepare;
              spMoviment.ParamByName('DATA').asDate            := Data;
              spMoviment.ParamByName('DATAREPRESA').asDate     := GetDataRepresa( IdPessoa );
              spMoviment.ParamByName('CODARTIGO').asString     := CodArtigo;
              spMoviment.ParamByName('IDPESSOA').asInteger     := IdPessoa;

              cds.Data := spMoviment.Data;
              If Not cds.IsEmpty Then
                 Begin
                     cds.First;
                     While Not cds.Eof Do
                        Begin
                            x := lstMoviment.Add(TMoviment.Create);

                            TMoviment(lstMoviment[x]).IDMOV           := cds.FieldByName('IDMOV').asFloat;
                            TMoviment(lstMoviment[x]).CODTIPOMOV      := cds.FieldByName('CODTIPOMOV').asString;
                            TMoviment(lstMoviment[x]).CODARTIGO       := cds.FieldByName('CODARTIGO').asString;
                            TMoviment(lstMoviment[x]).CODALMOXARIFADO := cds.FieldByName('CODALMOXARIFADO').asInteger;
                            TMoviment(lstMoviment[x]).DATAMOV         := cds.FieldByName('DATAMOV').asFloat;
                            TMoviment(lstMoviment[x]).QTDEMOV         := cds.FieldByName('QTDEMOV').asFloat;
                            TMoviment(lstMoviment[x]).VALORMOV        := cds.FieldByName('VALORMOV').asFloat;
                            TMoviment(lstMoviment[x]).CUSTOMEDIOMOV   := cds.FieldByName('CUSTOMEDIOMOV').asFloat;
                            TMoviment(lstMoviment[x]).SALDOQTDEMOV    := cds.FieldByName('SALDOQTDEMOV').asFloat;
                            TMoviment(lstMoviment[x]).FLGENTRADACUSTO := cds.FieldByName('FLGENTRADACUSTO').asString;
                            TMoviment(lstMoviment[x]).CODCUSTEIO      := cds.FieldByName('CODCUSTEIO').asInteger;

                            If cds.FieldByName('CODALMOXTRANSF').IsNull Then
                                TMoviment(lstMoviment[x]).CODALMOXTRANSF  := -1
                            else
                                TMoviment(lstMoviment[x]).CODALMOXTRANSF  := cds.FieldByName('CODALMOXTRANSF').asInteger;

                            cds.Next;
                        End;

                     For x := 0 To Pred( lstMoviment.Count ) Do
                        Begin
                           rCustoMed  := 0;
                           rSaldoQtde := 0;
                           rValorEst  := 0;
                           idxCM      := -1;
                           For i := 0 To Pred( lstCustoMed.Count ) Do
                               Begin
                                  If TCustoMed(lstCustoMed[i]).CodCusteio = TMoviment(lstMoviment[x]).CODCUSTEIO Then
                                     Begin
                                        IdxCM := i;
                                        rCustoMed  := ConvNum(TCustoMed(lstCustoMed[IdxCM]).CustoMedio);
                                        rSaldoQtde := ConvNum(TCustoMed(lstCustoMed[IdxCM]).SaldoQtdeUC);
                                        rValorEst  := ConvNum(TCustoMed(lstCustoMed[IdxCM]).SaldoQtdeUC) * ConvNum(TCustoMed(lstCustoMed[IdxCM]).CustoMedio);
                                        Break;
                                     End;
                               End;
                           rNovoCustoMed   := ConvNum(rCustoMed);
                           rNovoSaldoQtde  := ConvNum(rSaldoQtde) + ConvNum(TMoviment(lstMoviment[x]).QTDEMOV);

                           StrPCopy(cTipoMov,TMoviment(lstMoviment[x]).CODTIPOMOV);
                           // Verifica se é transferência e se é sáida
                           if ( cTipoMov[0] in ['A','K','B','S','b','Z','C'] ) or (TMoviment(lstMoviment[x]).FLGENTRADACUSTO = 'S') Then
                              Begin
                                { Movimento de Recebimento de Mercadoria}
                                 rNovoValor    := ConvNum(rValorEst) + ConvNum(TMoviment(lstMoviment[x]).VALORMOV);
                                 rValorMov     := ConvNum(TMoviment(lstMoviment[x]).VALORMOV);

                                 If rNovoSaldoQtde <> 0 Then
                                    rNovoCustoMed := ConvNum(rNovoValor)/ConvNum(rNovoSaldoQtde);
                              End
                           Else
                              Begin
                                 { Os Demais movimentos }
                                 rValorMov  := ConvNum(TMoviment(lstMoviment[x]).QTDEMOV) * ConvNum(rNovoCustoMed);
                              End;
                           TMoviment(lstMoviment[x]).VALORMOV      := ConvNum(rValorMov);
                           TMoviment(lstMoviment[x]).CUSTOMEDIOMOV := ConvNum(rNovoCustoMed);

                           // Atualiza o Saldo  e customedio da Unidade de Custeio
                           If idxCM > -1 Then
                              Begin
                                 TCustoMed(lstCustoMed[IdxCM]).CustoMedio  := ConvNum(rNovoCustoMed);
                                 TCustoMed(lstCustoMed[IdxCM]).SaldoQtdeUC := ConvNum(rNovoSaldoQtde);
                              End;
                           //Grava o valor da entrada no outro almoxarifado.
                           // IF x < Pred(lstMoviment.Count) Then
                           IF (cTipoMov[0]<> 'O') And (cTipoMov[0] <> 'C' ) Then
                              IF    ( TMoviment(lstMoviment[x]).CODALMOXTRANSF <> -1 ) and ( (cTipoMov[0]<> 'B') And (cTipoMov[0] <> 'S' ) )
                                And (( TMoviment(lstMoviment[x+1]).CODTIPOMOV = 'B') Or (TMoviment(lstMoviment[x+1]).CODTIPOMOV = 'S') ) Then
                                    TMoviment(lstMoviment[x+1]).VALORMOV := ConvNum(rValorMov)*(-1);

                         End;

                   // Atualização do Movimentos
                     For x := 0 To Pred( lstMoviment.Count )  Do
                       Begin
                          spUpdMoviment.Prepare;
                          spUpdMoviment.ParamByName('VALORMOV').asFloat      := ConvNum(StrToFloat( FormatFloat('#0.00000',TMoviment(lstMoviment[x]).VALORMOV ) ));
                          // inicio - andre tavares - 22/01/2004 -pendência 15218
//                          spUpdMoviment.ParamByName('CUSTOMEDIOMOV').asFloat := ConvNum(StrToFloat( FormatFloat('#0.00000',TMoviment(lstMoviment[x]).CUSTOMEDIOMOV)));
                          spUpdMoviment.ParamByName('CUSTOMEDIOMOV').asFloat := ConvNum(StrToFloat( FormatFloat('#0.0000000',TMoviment(lstMoviment[x]).CUSTOMEDIOMOV)));
                          // fim - andre tavares - 22/01/2004 -pendência 15218
                          spUpdMoviment.ParamByName('IDMOV').asFloat         := TMoviment(lstMoviment[x]).IDMOV;

                          If Not ExecSQL(spUpdMoviment.SQLChanged,True) Then
                             Raise Exception.Create( MessageInfo );
                       End;
                   // Atualiza CustoMedio
                    For x := 0 To Pred( lstCustoMed.Count ) Do
                       Begin
                          spUpdCustoMed.Prepare;
                          // inicio - andre tavares - 22/01/2004 -pendência 15218
                          //spUpdCustoMed.ParamByName('CUSTOMEDIO').asFloat   := ConvNum(StrToFloat( FormatFloat('#0.00000',TCustoMed(lstCustoMed[x]).CustoMedio)) );
                          spUpdCustoMed.ParamByName('CUSTOMEDIO').asFloat   := ConvNum(StrToFloat( FormatFloat('#0.0000000',TCustoMed(lstCustoMed[x]).CustoMedio)) );
                          // fim - andre tavares - 22/01/2004 -pendência 15218
                          spUpdCustoMed.ParamByName('SALDOQTDEUC').asFloat  := ConvNum(StrToFloat( FormatFloat('#0.00000',TCustoMed(lstCustoMed[x]).SaldoQtdeUC)) );
                          spUpdCustoMed.ParamByName('CODCUSTEIO').asInteger := TCustoMed(lstCustoMed[x]).CodCusteio;
                          spUpdCustoMed.ParamByName('CODARTIGO').asString   := TCustoMed(lstCustoMed[x]).CodArtigo;

                          If Not ExecSQL(spUpdCustoMed.SQLChanged,True) Then
                             Raise Exception.Create( MessageInfo );
                       End;

                 End;
         End;
      Except
         On E:Exception Do
         Begin
            Result := False;
            MessageInfo := E.Message;
         End;
      End;
   Finally
      lstCustoMed.Clear;
      lstCustoMed.Free;
      lstMoviment.Clear;
      lstMoviment.Free;
   End;
end;

function TCtrlMovEstoque.GetDataImplantacao(IdPessoa: Integer): TDateTime;
begin
  Result := 0;
  With _DtmMovEstoque Do
    Begin
       spGetDataImplantacao.Prepare;
       spGetDataImplantacao.ParamByName('IDPESSOA').AsInteger := IdPessoa;

       cds.Data := spGetDataImplantacao.Data;

       If (Not cds.IsEmpty) And ( Not cds.FieldByName('DATAIMPLANTA').IsNull ) Then
           Result :=  cds.FieldByName('DATAIMPLANTA').asDateTime;
    End;
end;

function TCtrlMovEstoque.GetDataRepresa(IdPessoa: Integer): TDateTime;
begin
  Result := 0;
  With _DtmMovEstoque Do
    Begin
       spVerifDataRepresa.Prepare;
       spVerifDataRepresa.ParamByName('IDPESSOA').AsInteger := IdPessoa;

       cds.Data := spVerifDataRepresa.Data;

       If (Not cds.IsEmpty) And ( Not cds.FieldByName('DATAREPRESA').IsNull ) Then
           Result :=  cds.FieldByName('DATAREPRESA').asDateTime;
    End;
end;

function TCtrlMovEstoque.InfoSaldoLoteVali(CodAlmoxarifado: Integer;
  CodArtigo: String; Data: TDateTime): Double;
begin
  CodArtigo := Copy( CodArtigo+'                ',1,14);
  With _DtmMovEstoque Do
    Begin

       spLoteValidade.ParamByName('CODALMOXARIFADO').AsInteger := CodAlmoxarifado;
       spLoteValidade.ParamByName('CODARTIGO').AsString        := CodArtigo;

       If Data > 0 Then
          spLoteValidade.ParamByName('DATAVALIDADE').AsDate := Data
       Else
          spLoteValidade.ParamByName('DATAVALIDADE').ClearLine;

       spLoteValidade.Prepare;
       
       _cds.Data := spLoteValidade.Data;

       Result := _cds.FieldByName('SALDOLOTE').asDateTime;

       _cds.Close;
    End;
end;

function TCtrlMovEstoque.GetUltDataMovRepresado(IdPessoa: Integer;
  CodArtigo: String): TDateTime;
Var
   dDataRep : TDateTime; // Data de Represa
Begin
    CodArtigo := Copy(CodArtigo + '           ',1,14);
    //
    dDataRep := GetDataRepresa( IdPessoa );
    With _DtmMovEstoque Do
       Begin
          spUltDataMovRepresado.Prepare;
          spUltDataMovRepresado.ParamByName('DATAMOV').asDateTime := dDataRep;
          spUltDataMovRepresado.ParamByName('CODARTIGO').asString := CodArtigo;

          cds.Data := spUltDataMovRepresado.Data;

          Result := cds.FieldByName('DATAMOV').asDateTime;
       End;
end;

function TCtrlMovEstoque.SaiLoteVali(CodAlmoxarifado: Integer;
  CodArtigo: String; DataVali: TDateTime; QtdeMov: Double;
  CodAlmoxTransf: Integer): boolean;
Var
   rQtdeBaixada  : Double; // Saldo baixado até a determinada data
   rQtdePositivo : Double;
   cdsAux        : TClientDataSet;
begin
  CodArtigo     := Copy( CodArtigo+'                ',1,14);
  Result        := False;
  rQtdeBaixada  := 0;
  rQtdePositivo := Abs(QtdeMov);
  cdsAux        := TClientDataSet.Create(nil);
  Try
     Try
        With _DtmMovEstoque Do
           Begin
              spLoteValidade.Prepare;

              If DataVali <= 0 Then
                 spLoteValidade.ParamByName('DATAVALIDADE').ClearLine;

              spLoteValidade.Prepare;

              spLoteValidade.ParamByName('CODALMOXARIFADO').AsInteger := CodAlmoxarifado;
              spLoteValidade.ParamByName('CODARTIGO').AsString        := CodArtigo;

              If DataVali > 0 Then
                 spLoteValidade.ParamByName('DATAVALIDADE').AsDate := DataVali;

              cdsAux.Data := spLoteValidade.Data;

              spLoteValidade.UnPrepare;
           End;
        If Not cdsAux.IsEmpty Then
           Begin
              cdsAux.First;
              While (Not cdsAux.EOF) And (rQtdeBaixada < rQtdePositivo) Do
                 Begin
                     If ((QtdeMov *(-1))-rQtdeBaixada ) >= cdsAux.FieldByName('SALDOLOTE').asFloat Then
                        Begin
                            If CodAlmoxTransf > 0 Then
                              Begin
                                 EntraLoteVali(CodAlmoxTransf,CodArtigo,cdsAux.FieldByName('DATAVALIDADE').AsDateTime,cdsAux.FieldByName('SALDOLOTE').asFloat);
                              End;
                            rQtdeBaixada := rQtdeBaixada + cdsAux.FieldByName('SALDOLOTE').asFloat;
                            cdsAux.Delete;
                        End
                     Else
                        Begin
                           If CodAlmoxTransf > 0 then
                             Begin
                                If Not EntraLoteVali(CodAlmoxTransf,CodArtigo,cdsAux.FieldByName('DATAVALIDADE').AsDateTime,((QtdeMov *(-1))-rQtdeBaixada )) Then
                                   Raise Exception.Create( MessageInfo );
                             End;
                           cdsAux.Edit;
                           cdsAux.FieldByName('SALDOLOTE').asFloat := StrToFloat(FormatFloat('#0.00000',(cdsAux.FieldByName('SALDOLOTE').asFloat - ((QtdeMov *(-1))-rQtdeBaixada ))));
                           cdsAux.Post;
                           rQtdeBaixada := rQtdeBaixada + (rQtdePositivo - rQtdeBaixada );
                           cdsAux.Next;
                        End;
                 End;
           End
        Else
           Begin
              If QtdeMov > 0 Then
                 Begin
                    If Not EntraLoteVali(CodAlmoxarifado,CodArtigo,Date,QtdeMov) Then
                       Raise Exception.Create( MessageInfo );
                 End;
           End;
        If cdsAux.ChangeCount > 0 Then
          Begin
             Result := ApplyCds(cdsAux,_DbLoteVali,[],[]);
             If Not Result Then
                Raise Exception.Create( _DbLoteVali.MessageInfo );
          End;

        Result := True;
     Except
         On E:Exception Do
         Begin
            Result := False;
            MessageInfo := E.Message;
         End;
      End;
  Finally
     cdsAux.Free;
  End;
end;

function TCtrlMovEstoque.VerifDataInvent(IdPessoa, CodCusteio: Integer;
  Data: TDateTime; var Dt: TDateTime): Boolean;
begin
  With _DtmMovEstoque Do
    Begin
       spVerifDataInvent.Prepare;
       spVerifDataInvent.ParamByName('IDPESSOA').AsInteger   := IdPessoa;
       spVerifDataInvent.ParamByName('CODCUSTEIO').AsInteger := CodCusteio;

       _cds.Data := spVerifDataInvent.Data;

       If (Not _cds.IsEmpty) And ( Not _cds.FieldByName('DATAULTINVENTARIO').IsNull ) Then
          Begin
             Result :=  Data >= _cds.FieldByName('DATAULTINVENTARIO').asDateTime;
             Dt     := _cds.FieldByName('DATAULTINVENTARIO').asDateTime;
          end
       Else
          Result := True;

       _cds.Close;
    End;
end;

function TCtrlMovEstoque.VerifDataRepresa(IdPessoa : Integer; Data: TDateTime ): Boolean;
begin
  With _DtmMovEstoque Do
    Begin
       spVerifDataRepresa.Prepare;
       spVerifDataRepresa.ParamByName('IDPESSOA').AsInteger := IdPessoa;

       _cds.Data := spVerifDataRepresa.Data;

       If (Not _cds.IsEmpty) And ( Not _cds.FieldByName('DATAREPRESA').IsNull ) Then
          Result :=  Data > _cds.FieldByName('DATAREPRESA').asDateTime
       Else
          Result := False;

       _cds.Close;
    End;
end;

function TCtrlMovEstoque.VerifIntegraContab(IdPessoa: Integer;
  Data: TDateTime; var Dt: TDateTime): Boolean;
begin
  With _DtmMovEstoque Do
    Begin
       spVerifIntegraContab.Prepare;
       spVerifIntegraContab.ParamByName('IDPESSOA').AsInteger := IdPessoa;

       _cds.Data := spVerifIntegraContab.Data;

       If (Not _cds.IsEmpty) And ( Not _cds.FieldByName('DATAULTINTEGRA').IsNull ) Then
          Begin
             Result :=  Data > _cds.FieldByName('DATAULTINTEGRA').asDateTime;
             Dt     :=  _cds.FieldByName('DATAULTINTEGRA').asDateTime;
          End
       Else
          Result := True;

       _cds.Close;
    End;

end;

procedure TCtrlMovEstoque.GetCCAlmoxarifado(CodAlmoxarifado: Integer;
  var CodCentroCusto: String; var IdEmpresa: Integer);
begin
  With _DtmMovEstoque Do
    Begin
       spGetCCAlmoxarifado.Prepare;
       spGetCCAlmoxarifado.ParamByName('CODALMOXARIFADO').AsInteger := CodAlmoxarifado;

       _cds.Data := spGetCCAlmoxarifado.Data;

       CodCentroCusto  :=  _cds.FieldByName('CODCENTROCUSTO').asString;
       IdEmpresa       :=  _cds.FieldByName('IDEMPRESA').AsInteger;

    End;
end;

function TCtrlMovEstoque.UpdMovimento(IdMov, IdMovEntrada: Double;
  PlnCodigo: Integer): Boolean;
begin
  Result := True;
  Try
     _DbMoviment.IdMov.AsFloat := IdMov;

     If _DbMoviment.LoadFromDb Then
        Begin
           _DbMoviment.IdMovEntrada.AsFloat := IdMovEntrada;

           If PlnCodigo > 0 Then
              _DbMoviment.PlnCodigo.AsInteger  := PlnCodigo
           Else
              _DbMoviment.PlnCodigo.Clear;

           If Not _DbMoviment.Update Then
              Raise Exception.Create( _DbMoviment.MessageInfo );
        End;
  Except
     On E:Exception Do
     Begin
        Result := False;
        MessageInfo := E.Message;
     End;
  End;
end;

function TCtrlMovEstoque.InfoSaldo(IdPessoa: Integer; CodArtigo: String;
  codAlmoxarifado: Integer; Data: TDateTime): Double;
begin
  CodArtigo := Copy(CodArtigo + '             ',1,14);
  With _DtmMovEstoque Do
     Begin
        spInfoSaldoMov.Prepare;
        spInfoSaldoMov.ParamByName('CODALMOXARIFADO').asInteger := CodAlmoxarifado;
        spInfoSaldoMov.ParamByName('CODARTIGO').asString        := CodArtigo;
        spInfoSaldoMov.ParamByName('DATAMOV').asDate            := Data;

        cds.Data := spInfoSaldoMov.Data;

        IF Not cds.IsEmpty Then
           Result := cds.FieldByName('SALDOQTDEMOV').asFloat
        Else
           Result := 0;

     End;
end;

function TCtrlMovEstoque.TestaValidade(CodProduto: String): Boolean;
begin
  Result := False;

  CodProduto := Copy(CodProduto + '        ' ,1,6);

  With _DtmMovEstoque Do
     Begin
        spTestaValidade.Prepare;
        spTestaValidade.ParamByName('CODPRODUTO').asString := CodProduto;

        cds.Data :=  spTestaValidade.Data;

        If Not cds.IsEmpty Then
           Result := cds.FieldByName('LOTEVALIDADE').AsString = 'T';
     End;
end;

procedure TCtrlMovEstoque.AfterInitialize;
begin
  inherited;
  _UnMedida.InitializeAs( Self );
end;

function TCtrlMovEstoque.GetCodMedCusto(CodArtigo: String): String;
Var
  SQL : String;
begin
   CodArtigo := Copy(CodArtigo+'                ',1,14);

   SQL := ' SELECT P.CODMEDCUSTO '+
          ' FROM PRODUTO P, ARTIGO A '+
          ' WHERE (A.CODARTIGO = '+QuotedStr(CodArtigo)+') '+
          '   AND (A.CODPRODUTO = P.CODPRODUTO) ';

   _Cds.Data := GetDataPacket(SQL);

   Result := _Cds.fieldByName('CODMEDCUSTO').AsString;
end;

end.
