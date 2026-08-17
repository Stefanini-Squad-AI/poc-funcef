unit uCtrlImportAcreDecreValor;
{*******************************************************************************
******************************** REGISTRO DE ALTERAÇÕES ************************
********************************************************************************
--------------------------------------------------------------------------------
Nº SOL......: 142552
Nº KINTANA..: 911795
Data........: 14/09/2011
Responsável.: Helen V. Bianchi/Leandro
Descrição...: Criação do uCtrl
-------------------------------------------------------------------------------}

interface

uses uCmControlObject,DbClient,SysUtils,ComObj,Gauges,Forms,Classes,uCtrlBem,uCmClientDataSet,
     uSistema,uCtrlPadroes,uCtrlCafxContab,DB,uCtrlParamCAF,uCtrlFechamentoProRata,uDBAcrescimoValor,
     uCtrlHistMovBem,uCtrlMovAcrescimoValor;

Type
  TCtrlImportAcreDecreValor = class(TCmControlObject)
  private
   intExercicio,intPeriodo  : Integer;
   bCtaxCCusto :Boolean;  
   strlErro    : TStringList;
   CtrlMovAcrescimoValor : TCtrlMovAcrescimoValor;
   ParamCAF   : TCtrlParamCAF;      
   // --> Interrompe a inserção dos dados
   FbInterrompe :Boolean;   
   // --> hora inicial de inserção dos dados
   FHr_Inicial : TDateTime;   
   // --> total de erros gerados durante a inserção
   FTotal_Erros :Integer;
   // --> Log de erros durante a gravação
   FLog :TStringList;
   // --> Controle do Caf
   CafxContab : TCtrlCafxContab;
   // --> Controle dos Bens
   Bem : TCtrlBem;
   // --> ClientDataSet do Bem
   cdsBem : TCmClientDataSet;
   // --> ClientDataSet responsavel por manipular os dados
   FcdsExcel: TClientDataSet;
   // --> Indica a barra de progresso a ser utilizada
   FBProgresso : TGauge;
   // --> Array Dinamico que indica o nome dos campos
   FCampos : TStringList;
   // --> Total de registros que foram importados
   FTotal_Importado:integer;
   // --> Total de Registros a serem importados
   FTotal_Importar:integer;
   // --> Indica o ClientDataSet responsavel para armazenar os dados
   procedure SetcdsExcel(const Value: TClientDataSet);
   // --> Indica a barra de progresso a ser utilizada
   procedure SetbProgresso(const Value: TGauge);
   // --> Inclui campos sequenciais no StringList
   procedure SetCampos(Value: TStringList);
   // --> Pega ID da Pessoa
   function ValidaBem(strPlaca:String):Boolean;
   // --> Valida se o registro a ser importado do Excel é Valido
   function ValidaCampos:Boolean;
   // --> Lista dados dos bens
   function ListaBem(strPlaca:String):Variant;
  public
   //Constutor da Classe
   constructor Create; override;
   //Destrutor da Classe
   destructor  Destory;
   // --> ClientDataSet que armazenara os dados da importação
   property cdsExcel:TClientDataSet read FcdsExcel write SetcdsExcel;
   // --> Barra de progresso a ser utilizada
   property bProgresso:TGauge read FbProgresso write SetbProgresso;
   // --> Indica os campos a serem utilizados para importação
   property Campos : TStringList read FCampos write SetCampos;
   //Total de registros a serem importados
   property Total_Importar:integer read FTotal_Importar;
   //Log da Control
   property Log : TStringList read FLog;
   // --> Total de Registros importados durante a inserção
   property Total_Importado:Integer read FTotal_Importado;
   // --> total de erros durante a importação
   property Total_Erros:Integer read FTotal_erros;   
   //Retornar dados de uma planilha EXCEL em data no CLienteDataset
   function ImportarPlanilhaEXCEL(StrCaminho:string):Boolean;
   // Faz a importação dos dados do excel para o banco de daos efetivamente
   function ImportaDados:Boolean;
   // Interrompe a importação de dados
   function InterromperImportacao:boolean;   
  end;

implementation

{ TCtrlImportAcreDecreValor }

constructor TCtrlImportAcreDecreValor.Create;
begin                         
  inherited;
  // --> Instanciando Objetos
  CtrlMovAcrescimoValor := TCtrlMovAcrescimoValor.Create;
  CtrlMovAcrescimoValor.InitializeAs(Padroes);
  Bem := TCtrlBem.Create;
  bem.InitializeAs(Padroes);
  CafxContab := TCtrlCafxContab.Create;
  CafxContab.InitializeAs(Padroes);
  ParamCAF   := TCtrlParamCAF.Create;
  ParamCaf.InitializeAs(Padroes);
  cdsBem := TCmClientDataSet.Create(Application);
  strlErro := TStringList.Create;
  FLog := TStringList.Create;
  // Criando clientdataSets temporarios
end;

destructor TCtrlImportAcreDecreValor.Destory;
begin
  // --> Destruindo Objetos objetos
  FreeAndNil(FCampos);
  FreeAndNil(Bem);
  FreeAndNil(cdsBem);
  FreeAndNil(strlErro);
  FreeAndNil(FLog);
  FreeAndNil(ParamCAF);
  FreeAndNil(CtrlMovAcrescimoValor);
  FreeAndNil(CafxContab);
end;

function TCtrlImportAcreDecreValor.ImportaDados: Boolean;
var
   bolDecrescimo,bolIncluido:Boolean;
   intTipoDespesa:Integer;
begin
  Log.Clear;
  try
     Result := false;
     try
        //Consistências
        if not cdsExcel.Active then
           raise Exception.Create('Não há dados para serem importados');
           
        if not cdsExcel.RecordCount = 0 then
           raise Exception.Create('Não há dados para serem importados');
           
        //Totalizadores
        FTotal_Erros      := 0;
        FTotal_Importado  := 0;
        FHr_Inicial       := Now;
        FbInterrompe      := false;

        //Progresso
        bProgresso.MinValue := 0;
        bProgresso.Progress := 0;
        bProgresso.MaxValue := FTotal_Importar;
        Application.ProcessMessages;        

        //LOG
        Log.Clear;
        Log.Add('==============================================================');
        Log.Add('IMPORTAÇÃO DE ACRÉSCIMO/DECRÉSCIMO DE VALOR VIA PLANILHA EXCEL');
        Log.Add('Total de dados a serem importados: ' +  IntToStr(Total_Importar));
        Log.Add('Data: ' + FormatDateTime('dd/mm/yyyy',Now));
        Log.Add('==============================================================');
        Log.Add('');
        
        cdsExcel.First;
        while not cdsExcel.Eof do
        begin
        
           //Interrromper Importação
           if (FbInterrompe) then
           begin
            Break;
           end;

           // MOVIMENTACAO --> A = Acrescimo, D = Decrescimo
           if (cdsExcel.FieldByName('MOVIMENTACAO').AsString = 'D') then
              bolDecrescimo := True
           else
              bolDecrescimo := False;
         
           Log.Add('XLS LINHA - ' + IntToStr(cdsExcel.RecNo+1) + '----------------------------------------------');

           cdsBem.Data := ListaBem(cdsExcel.FieldByName('PLACA').AsString);

           try
            // --> Se o registro for válido pelas consistencias iniciais tenta executar o acrescimo de valor...
            // --> Caso contrário nem tenta fazer a inclusão...
            if cdsExcel.FieldByName('REGISTROVALIDO').AsBoolean then
            begin
             // --> Faz a inserção dos dados
             bolIncluido := CtrlMovAcrescimoValor.ExecutaAcrescimoValor(cdsBem.FieldByName('IDMODULO').asFloat,
                                                                       cdsBem.FieldByName('IDPESSOA').asFloat,
                                                                       Sistema.IdUsuario,
                                                                       cdsBem.FieldByName('IDBEM').asFloat,
                                                                       cdsExcel.FieldByName('DT_MOVIMENTACAO').AsDateTime,
                                                                       cdsExcel.FieldByName('TIPO_MOVIMENTACAO').AsInteger,
                                                                       cdsExcel.FieldByName('VALOR').AsFloat,
                                                                       copy(cdsExcel.FieldByName('DESCRICAO').AsString,1,60),
                                                                       bolDecrescimo);
             end//if..then
             else
              bolIncluido := False;
             
             if bolIncluido then
             begin
              Log.Add('Registro incluído com sucesso!');
              Log.Add('');
              FTotal_Importado := FTotal_Importado +1;
             end //if..then
             else
             begin
              Log.Add('Registro não incluído com sucesso!');
              Log.Add(CtrlMovAcrescimoValor.MessageInfo);
              Log.Add('');              
              FTotal_Erros := FTotal_Erros +1;
             end;//else..end
             
           except on E: Exception do
               Log.Add(E.Message);
           end; //try..except

           cdsExcel.Next;

        end;//while..do

        //Log
        Log.Add('');
        Log.Add('');
        Log.Add('==============================================================');
        Log.Add('TOTALIZAÇÃO');
        Log.Add('');
        Log.Add('Duração........................................: ' + FormatDateTime('hh:nn:ss',Now - FHr_Inicial));
        Log.Add('Total de registros do excel...........: ' + IntToStr(Total_Importar));
        Log.Add('Total de registros importados.......: ' + IntToStr(Total_Importado));
        Log.Add('Total de erros...............................: ' + IntToStr(Total_Erros));
        Log.Add('==============================================================');
           
         Result := true;        
          
      except
      end; //try..except
     finally
        FbInterrompe := false;
        Application.ProcessMessages;
     end; //try..finally       
end;

function TCtrlImportAcreDecreValor.ImportarPlanilhaEXCEL(
  StrCaminho: string): Boolean;
var
  Excel:Variant;
  bFinalizouExcel:boolean;
  linha,Cont:integer;
  intConversao:Integer;
  realConversao:Real;
  DtConversao:TDateTime;
  intTipo:Integer;
  strAuxiliar :String;
  bolRegistro :Boolean;
begin
     // Excel[linha,Coluna];
     intTipo      :=0; // --> 1 = Inteiro, 2 = String, 3 = Float, 4 = DateTime
     bolRegistro  := True;
     Result := False;
     
     // --> Verifica se existe mesmo o Arquivo...
     if not FileExists(Trim(StrCaminho)) then
        raise Exception.Create('O arquivo não existe com caminho informado.');

     // --> Verifica 
     if not cdsExcel.Active then
        raise Exception.Create('Clientdataset de excel não está pronto.');

     try
        cdsExcel.EmptyDataSet;

        // Cria o objeto
        Excel := CreateOleObject('Excel.application');
        // Abre o Arquivo
        Excel.WorkBooks.Open(StrCaminho);
        // Vai para a ultima linhda do Excel
        Excel.workbooks[1].sheets[1].Cells.SpecialCells($0000000B, EmptyParam).Activate;
        bFinalizouExcel := false;
        // Indica a partir de qual linha começar a pegar os registros
        linha := 2;

        //Pega total de linhas a serem importadas
        FTotal_Importar := Excel.ActiveCell.Row;

        //Progresso
        bProgresso.Progress := 0;
        bProgresso.MinValue := 0;
        bProgresso.MaxValue := FTotal_Importar;
        Application.ProcessMessages;

// --> Lê o excel todo e joga para um ClientDataSet temporários
// --> enquanto a variavel que controla qual linha iniciar a captura dos dados for menor do que o total de registros a serem importados
        while linha <= FTotal_Importar Do
        begin
        
           bolRegistro := True;
           strlErro.Clear;             
           cdsExcel.Append;
               
           // Preenche ClientDataset
           // Este laço serve para preencher todas as colunas do ClientDataSet de acordo com os campos definidos na StringList
           // Desta forma, podemos alterar a ordem dos campos no Layout...
           for Cont := 0 to Campos.Count - 1 do
           begin
            try
             cdsExcel.FieldByName(Campos.Strings[Cont]).AsString := Excel.workbooks[1].sheets[1].cells[linha,Cont +1].Value;

             // --> Validando a Data
             if cdsExcel.FieldByName(Campos.Strings[Cont]).FieldName = 'DT_MOVIMENTACAO' then
             begin
               try
                  strAuxiliar := FormatDateTime('DD/MM/YYYY',cdsExcel.FieldByName('DT_MOVIMENTACAO').AsDateTime);
               except
                strlErro.Add(cdsExcel.FieldByName('DT_MOVIMENTACAO').DisplayLabel+ ': não é uma data valida.');
                bolRegistro := False;
               end;//if..then
             end//if..then
             else if cdsExcel.FieldbyName(Campos.Strings[Cont]).FieldName = 'MOVIMENTACAO' then
             begin
              if Length(Trim(cdsExcel.FieldbyName(Campos.Strings[Cont]).AsString)) > 1 then
              begin
               strlErro.Add(cdsExcel.FieldbyName(Campos.Strings[Cont]).DisplayLabel + ': deve ser "A" ou "D" ');
               bolRegistro := False;
              end;//if..then
             end //else..if             
            except
             // --> Validando os tipos de dados...
              // --> Inteiro
              if cdsExcel.FieldByName(Campos.Strings[Cont]).DataType = ftinteger  then
              begin
                 intConversao := Excel.workbooks[1].sheets[1].cells[linha,Cont +1].Value;
                 intTipo :=1;
              end//if..then
              // --> Real -- Float
              else if cdsExcel.FieldByName(Campos.Strings[Cont]).DataType = ftFloat then
              begin
               realConversao := Excel.workbooks[1].sheets[1].cells[linha,Cont +1].Value;
               intTipo :=3;
              end//if..then
              // --> Date
              else if cdsExcel.FieldByName(Campos.Strings[Cont]).DataType = ftDateTime then
              begin
               dtConversao := Excel.workbooks[1].sheets[1].cells[linha,Cont +1].Value;
               intTipo :=4;
              end;//if..then            
             case intTipo of
              1: strlErro.Add(cdsExcel.FieldByName(Campos.Strings[Cont]).DisplayLabel + ': deve ser um número inteiro válido!');
              2: strlErro.Add(cdsExcel.FieldByName(Campos.Strings[Cont]).DisplayLabel + ': deve conter somente caracteres!');
              3: strlErro.Add(cdsExcel.FieldByName(Campos.Strings[Cont]).DisplayLabel + ': deve ser um número real válido!');
              4: strlErro.Add(cdsExcel.FieldByName(Campos.Strings[Cont]).DisplayLabel + ': deve ser uma data válida!');
             end;//case..of

            end;//try..except
            
           end; //for..do

           // --> Se ocorreou algum erro de dado, edita o registro para inválido
           if not bolRegistro then
              cdsExcel.FieldByName('REGISTROVALIDO').AsBoolean := bolRegistro;

           // --> Registra Log
           if Trim(strlErro.Text) <> '' then
              cdsExcel.FieldByName('LOG_ERRO').AsString := 'Este registro possui erro(s): ' + #13 + strlErro.Text;
              
           cdsExcel.Post;
               
           Inc(linha);

           //Progresso
           bProgresso.Progress := bProgresso.Progress + 1;
           Application.ProcessMessages;
               
           if linha > FTotal_Importar then
           begin
             bProgresso.Progress := bProgresso.MaxValue;
             cdsExcel.First;
             bFinalizouExcel := True;
           end;//if..then
           
        end; //while..do
        Result := True;
     finally
         if cdsExcel.Active then
         begin
            FTotal_Importar := cdsExcel.RecordCount;
            ValidaCampos;
         end //if..then
         else
            FTotal_Importar := 0;
            
         //Fecha e libera o excel da memoria
         Excel.workbooks.close;
         Excel.Quit; 
         Excel:=Unassigned;
         cdsExcel.First;
        
     end; //try..finally  
end;

function TCtrlImportAcreDecreValor.InterromperImportacao: boolean;
begin
     Log.Add('');
     Log.Add('ATENÇÃO: Importação Interrompida.');
     Log.Add('');
     FbInterrompe := true;
end;

function TCtrlImportAcreDecreValor.ListaBem(strPlaca: String): Variant;
var
   strSQL:String;
begin
   // --> Verifica os campos necessarios para validar o BEM de acordo com a PLACA
   strSQL := ' SELECT  B.IDBEM,                    '+
             '         B.IDMODULO,                 '+
             '         B.CONTROLE,                 '+
             '         B.FLGSAIDATEMP,             '+
             '         B.BAIXATOTAL,               '+
             '         G.FLGIMOVEL,                '+
             '         B.IDPESSOA                  '+
             ' FROM BEM B, GRUPO G                 '+
             '  WHERE B.PLACA = ' + QuotedStr(strPlaca) +
             ' AND B.IDGRUPO = G.IDGRUPO(+) ' ;
   cdsBem.Close;
   Result := GetDataPacket( strSQl );
end;

procedure TCtrlImportAcreDecreValor.SetbProgresso(const Value: TGauge);
begin
   FbProgresso := Value;
end;


procedure TCtrlImportAcreDecreValor.SetCampos(Value: TStringList);
begin
   FCampos := Value;
end;

procedure TCtrlImportAcreDecreValor.SetcdsExcel(const Value: TClientDataSet);
begin
   FcdsExcel := Value;
end;

function TCtrlImportAcreDecreValor.ValidaBem(strPlaca: String): Boolean;
var
   strSQL:String;
begin
   Result := True;
   cdsBem.Data := ListaBem(cdsExcel.FieldByName('PLACA').AsString);
   // --> Verifica os valores do campo, caso passe pela o if, retorna a função como False e o registro torna-se inválido
   if cdsBem.FieldByName('CONTROLE').AsString  = 'F' then
   begin
    Result := False;
    strlErro.Add('Bem em Controle Físico');
   end; //if..then

   // --> Verifica se o bem está em saída temporária
   if cdsBem.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
   begin
    Result := False;
    strlErro.Add('Bem em Saída Temporária');
   end;//else..if

   // --> Verifica se o bem está baixado
   if cdsBem.FieldByName('BAIXATOTAL').AsString = 'S' then
   begin
    Result := False;
    strlErro.Add('Bem Baixado');
   end;//else..if
end;

function TCtrlImportAcreDecreValor.ValidaCampos: Boolean;
var
 Cont,
 intTipo:Integer;
 strTipoMovimento:String;
 dt: TDateTime;
begin
  // --> Estas validações são feitas por prevenção de erros ao fazer a importação definitivamente...
  // --> Valida Campo a Campo se estão preenchidos
  dt           :=0;
  intExercicio :=0;
  intPeriodo   :=0;
  cdsExcel.First;
  while not cdsExcel.Eof do
  begin

    Result := True;
    strlErro.Clear;
    if cdsExcel.FieldByName('REGISTROVALIDO').AsBoolean then
    begin
    
      // --> 1º - Primeiro Nivel de Validação...
      // --> Verifica se tem algum campo que não está preenchido, caso não esteja preenchido o registro se torna inválido
      for Cont := 0 to Campos.Count - 1 do
      begin
       if Trim(cdsExcel.FieldByName(Campos.Strings[Cont]).AsString) = '' then
       begin
        Result := False;
        strlErro.Add(cdsExcel.FieldByName(Campos.Strings[Cont]).DisplayLabel + ': está em branco');      
       end;
      end; //for..do
      // --> 1º - Fim do Primeiro Nivel

      // --> 2º  - Segundo Nível de Validação...
      // --> Valor menor igual a zero
      if cdsExcel.FieldByName('VALOR').asFloat <=0 then
      begin
       Result := False;
       strlErro.Add(' Valor é menor ou igual à zero.');
      end; //if..then
      
      // --> 2º -  Fim do Segundo nível de validação

      // --> 3º  - Segundo Nível de Validação...
      // --> Data inválida
      if cdsExcel.FieldByName('DT_MOVIMENTACAO').AsDateTime <=0 then
      begin
       Result := False;
       strlErro.Add('Data de Movimentação está com formato incorreto.');
      end; //if..then
      // --> 3º -  Fim do 3º Nível de validação

      // --> 4º - Segundo Nível  de Validação
      // --> Validando a PLACA do bem
      // --> Só entra na validação da Placa
      if cdsExcel.FieldByName('PLACA').AsString <> '' then
      begin
       if Bem.PlacaIdBem(Sistema.IdEmpresa,cdsExcel.FieldByName('PLACA').AsString) <=0 then
       begin
         Result := False;
         strlErro.Add('Placa inexistente');
       end;  //if..then
      end; //if..then

      // --> Após validar se a placa é valida, faz validação de outros dados do bem
      // --> Procedimentos feitos na propria tela de FmtMovAcrescimoValor
      if Result then
      begin
       if not ValidaBem(cdsExcel.FieldByName('PLACA').AsString) then
        Result := False;
      end;
      // --> 4º -  Fim do 2º Nivel

      // --> 5º - Validando Data no CAF
      if Result then
      begin
       if cdsExcel.FieldByName('MOVIMENTACAO').AsString  = 'A' then
          strTipoMovimento := '9' // Acrescimo
       else
           strTipoMovimento := '95'; //Decrescimo

       if not Bem.VerificaPeriodoCAF(cdsBem.FieldByName('IDPESSOA').AsFloat,
                                     cdsBem.FieldByname('IDBEM').AsFloat,
                                     cdsBem.FieldByName('FLGIMOVEL').AsInteger,
                                     strTipoMovimento,
                                     cdsExcel.FieldByName('DT_MOVIMENTACAO').AsDateTime,
                                     dt,
                                     dt,
                                     True) then
       begin
        Result := False;
        strlErro.Add(Bem.MessageInfo);
       end;//if..then
      end;//if..then

      // --> Verificando Periodo Contábil
      if Result then
      begin
       if not CafxContab.VerificaPeriodoContabil(cdsBem.FieldByName('IDPESSOA').AsFloat,
                                                 cdsExcel.FieldByName('DT_MOVIMENTACAO').AsDateTime,
                                                 intExercicio,
                                                 intPeriodo) then
       begin
        Result := False;
        strlErro.Add(CafxContab.MessageInfo);
       end;//if..then
      end;//if..then
      // --> 5º - Fim do 5º Nivel

      // --> Caso algum campo seja inválidado, edita o registro para inválido
      // --> Editando Registro Valido ou Inválido
      cdsExcel.Edit;

      if Result = False then
      begin
       if cdsExcel.FieldByName('LOG_ERRO').AsString = EmptyStr then
          cdsExcel.FieldByName('LOG_ERRO').AsString := 'Este registro possui erro(s): ' + #13 + strlErro.Text
       else
          cdsExcel.FieldByName('LOG_ERRO').AsString := cdsExcel.FieldByName('LOG_ERRO').AsString + strlErro.Text;
                 
       cdsExcel.FieldByName('REGISTROVALIDO').AsBoolean := False;
      end //if..then
      else
       cdsExcel.FieldByName('REGISTROVALIDO').AsBoolean := True;

      cdsExcel.Post;

      // --> Fim da Edição do Registro Inválido
    end;//if..then

   cdsExcel.Next;

  end; //while..not
end;

end.
