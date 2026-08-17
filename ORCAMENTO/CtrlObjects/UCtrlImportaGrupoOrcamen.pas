// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina......: Toda control
Nº SOL......: 159242
Nº KINTANA..: 1337825
Data........: 16/06/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: CLASSE DE CONTROLE DE IMPORTAÇÃO DE ENTRADA DE DADOS ESPECIAS - P.O.
----------------------------------------------------------------------------------------------------}

unit UCtrlImportaGrupoOrcamen;

interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, uMidasUtil, sysutils, wwQuery, provider,
  Classes, uDbContasOrcamen,  uCMTypes, uFuncoesOrcamento,Windows, Messages,
  Graphics, Controls, Forms, Dialogs, FileCtrl, ComObj,Gauges,
  uCtrlTransacoesPorGrupo,uCtrlPlanPrevContabPatro,uCtrlBlqEntdados,uSistema,
  uCMClientDataSet,uCtrlPadroes,uCtrlCadGrupos,DBaseDados;

Type
  TCtrlImportaGrupoOrcamen = class(TCmControlObject)
  private
    FbInterrompe:boolean;
    FHr_Inicial: TDateTime;
    FTotal_Importado:integer;
    FTotal_Importar:integer;
    FTotal_Erros: integer;
    FcdsExcel: TClientDataSet;
    FbProgresso: TGauge;
    FLog: TStringList;
    FcdsPlanoOrcamen:TClientDataSet;
    FcdsAux:TClientDataSet;
    CtrlCadGrupos : TCtrlCadGrupos;
    procedure SetbProgresso(const Value: TGauge);
    procedure SetcdsExcel(const Value: TClientDataSet);
    function VerificaRegistro(strTabela,strCampo,strValor,strWhere:string):integer;

    //Valida Dados originados do excel
    function ValidarDados:Boolean;
        
    //Gravar o orçamneto no bando de dados
    function GravarOrcamento:Boolean;

    //Carrega ClientDataset
    procedure CarregaClientDataset();

  public
        //Constutor da Classe
        constructor Create(); override;
        //Destrutor da Classe
        destructor  Destory;  
        //Realizar Importação para o Banco de Dados
        function ImportarDados:Boolean;
        //Retornar dados de uma planilha EXCEL em data no CLienteDataset
        function ImportarPlanilhaEXCEL(StrCaminho:string):Boolean;
        //Interromper Importação
        function InterromperImportacao:boolean;
        //ClientDataset que armazena Dados do Excel
        property cdsExcel:TClientDataSet read FcdsExcel write SetcdsExcel;
        //Total de registros a serem importados
        property Total_Importar:integer read FTotal_Importar;
        //Total de registros importados no banco
        property Total_Importado:integer read FTotal_Importado;
        //Barra de Progresso da Tela Principal
        property bProgresso:TGauge read FbProgresso write SetbProgresso;
        //Log da Importação
        property Log: TStringList read FLog;
        //Total de Erros Ocorridos
        property Total_Erros:integer read FTotal_Erros;
end;  


implementation

{ TCtrlImportaGrupoOrcamen }

procedure TCtrlImportaGrupoOrcamen.CarregaClientDataset;
begin
     FcdsPlanoOrcamen.Close;
     FcdsPlanoOrcamen.Data   := GetDataPacket('SELECT * FROM PLANOORCAMENTARIO');

end;

constructor TCtrlImportaGrupoOrcamen.Create;
begin
  inherited;
  //Instancia Objetos
  FLog                    := TStringList.Create;
  FcdsAux                 := TClientDataSet.Create(Application);

  CtrlCadGrupos := TCtrlCadGrupos.Create;
  CtrlCadGrupos.Initialize(DtmBaseDados.dbBaseDados, True,
                            Sistema.ConnectionType,   Sistema.ConnectionSide,
                            Sistema.AppRemoteServer,  True, nil, nil, False);


  FcdsPlanoOrcamen        := TClientDataSet.Create(Application);
end;

destructor TCtrlImportaGrupoOrcamen.Destory;
begin
     //Destroi Objetos
     FreeAndNil(FLog);
     FreeAndNil(FcdsAux);
     FreeAndNil(CtrlCadGrupos);
     FcdsPlanoOrcamen.Close;
     FreeAndNil(FcdsPlanoOrcamen);
end;

function TCtrlImportaGrupoOrcamen.GravarOrcamento: Boolean;
begin
         Result := CtrlCadGrupos.CadGruposInclui(
                                        cdsExcel.FieldByName('DESCRICAO_GRUPO').AsString,
                                        cdsExcel.FieldByName('IDPLANOORCAMEN').AsString,
                                        cdsExcel.FieldByName('FLAG_POSITIVO_NEGATIVO').AsString,
                                        cdsExcel.FieldByName('FLAG_RESULTADO').AsString,
                                        cdsExcel.FieldByName('FLAG_ANALITICO_SINTETICO').AsString,
                                        cdsExcel.FieldByName('CODIGO_GRUPO').AsString,
                                        cdsExcel.FieldByName('ID_FORMULA').AsString);
end;

function TCtrlImportaGrupoOrcamen.ImportarDados: Boolean;
begin
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

           //LOG
           Log.Clear;
           Log.Add('==============================================================');
           Log.Add('IMPORTAÇÃO DE GRUPOS ORÇAMENTÁRIOS VIA PLANILHA EXCEL');
           Log.Add('Total de dados a serem importados: ' +  IntToStr(Total_Importar));
           Log.Add('Data: ' + FormatDateTime('dd/mm/yyyy',Now));
           Log.Add('==============================================================');
           Log.Add('');

           //Progresso
           bProgresso.MinValue := 0;
           bProgresso.Progress := 0;
           bProgresso.MaxValue := FTotal_Importar;
           Application.ProcessMessages;

           //Carrega ClientDataset
           CarregaClientDataset();

           //Loop
           cdsExcel.First;
           cdsExcel.IndexFieldNames := 'LINHA_EXCEL';

           while not cdsExcel.Eof Do
           begin
                //Interrromper Importação
                if (FbInterrompe) then
                begin
                   Break;
                end;

                Log.Add('XLS LINHA - ' + cdsExcel.fieldbyname('LINHA_EXCEL').AsString + '----------------------------------------------');

                //Validar Dados
                if ValidarDados then
                begin
                     //Importar no Banco
                     if GravarOrcamento() then
                     begin
                        FTotal_Importado := FTotal_Importado + 1;
                        Log.Add('Registro importado com sucesso.')
                     end
                     else
                     begin
                        FTotal_Erros := FTotal_Erros + 1;
                        Log.Add('Registro NÃO importado (ERRO).');
                        FTotal_Erros := FTotal_Erros + 1;
                     end;
                end
                else
                begin
                    //Erro na Validação dos Dados
                    Log.Add('Registro NÃO importado (DADOS INVÁLIDOS).');
                end;

                //Próximo
                cdsExcel.Next;
                bProgresso.Progress := bProgresso.Progress + 1;
                Application.ProcessMessages;
           end;

           //Log
           Log.Add('');
           Log.Add('');
           Log.Add('==============================================================');
           Log.Add('TOTALIZAÇÃO');
           Log.Add('');
           Log.Add('Duração........................................: ' + FormatDateTime('hh:nn:ss',Now - FHr_Inicial));
           Log.Add('Total de registros do excel...........: ' + IntToStr(Total_Importar));
           Log.Add('Total de registros importados.......: ' + IntToStr(Total_Importado));
           Log.Add('Total de erros...............................:' + IntToStr(Total_Erros));
           Log.Add('==============================================================');
           
           Result := true;
        except
        end;
     finally
        FbInterrompe := false;
        Application.ProcessMessages;
     end;
end;

function TCtrlImportaGrupoOrcamen.ImportarPlanilhaEXCEL(
  StrCaminho: string): Boolean;
var
  Excel:Variant;
  aux:string;
  bFinalizouExcel:boolean;
  linha:integer;
begin
     Result := False;

     if not FileExists(Trim(StrCaminho)) then
        raise Exception.Create('O arquivo não existe com caminho informado.');

     if not cdsExcel.Active then
        raise Exception.Create('Clientdataset de excel não está pronto.');

     try
        cdsExcel.EmptyDataSet;

        Excel := CreateOleObject('Excel.application'); //cria o objeto
        Excel.WorkBooks.Open(StrCaminho);  //abre o arquivo
        bFinalizouExcel := false;
        linha := 2;
        
        //Total a importar
        FTotal_Importar := 1;
        aux := 'XXX';
        while Trim(aux) <> '' DO
        begin
             aux := Trim(Excel.workbooks[1].sheets[1].cells[FTotal_Importar,'B'].Value);
             FTotal_Importar := FTotal_Importar + 1;
        end;

        //Progresso
        bProgresso.Progress := 0;
        bProgresso.MinValue := 0;
        bProgresso.MaxValue := FTotal_Importar;
        Application.ProcessMessages;


        while not bFinalizouExcel Do
        begin
             aux := Trim(Excel.workbooks[1].sheets[1].cells[linha,'B'].Value);

             if Trim(aux) <> '' then
             begin
               //Preenche ClientDataset
               cdsExcel.Append;
               cdsExcel.FieldByName('PLANO_ORCAMENTARIO').AsString       := Excel.workbooks[1].sheets[1].cells[linha,'A'].Value;
               cdsExcel.FieldByName('CODIGO_GRUPO').AsString             := aux;
               cdsExcel.FieldByName('DESCRICAO_GRUPO').AsString          := Excel.workbooks[1].sheets[1].cells[linha,'C'].Value;
               cdsExcel.FieldByName('FLAG_ANALITICO_SINTETICO').AsString := Excel.workbooks[1].sheets[1].cells[linha,'D'].Value;
               cdsExcel.FieldByName('FLAG_POSITIVO_NEGATIVO').AsString   := Excel.workbooks[1].sheets[1].cells[linha,'E'].Value;
               cdsExcel.FieldByName('FLAG_RESULTADO').AsString           := Excel.workbooks[1].sheets[1].cells[linha,'F'].Value;
               cdsExcel.FieldByName('ID_FORMULA').AsString               := Excel.workbooks[1].sheets[1].cells[linha,'G'].Value;
               cdsExcel.FieldByName('LINHA_EXCEL').AsInteger          := linha;
               cdsExcel.Post;
               Inc(linha);

               //Progresso
               bProgresso.Progress := bProgresso.Progress + 1;
               Application.ProcessMessages;
             end
             else
             begin
               bProgresso.Progress := bProgresso.MaxValue;
               cdsExcel.First;
               bFinalizouExcel := True;
             end;
        end;
        Result := True;
     finally
         if cdsExcel.Active then
            FTotal_Importar := cdsExcel.RecordCount
         else
            FTotal_Importar := 0;
         Excel.workbooks.close;   //fechas
     end;
end;

function TCtrlImportaGrupoOrcamen.InterromperImportacao: boolean;
begin

end;

procedure TCtrlImportaGrupoOrcamen.SetbProgresso(const Value: TGauge);
begin
  FbProgresso := Value;
end;

procedure TCtrlImportaGrupoOrcamen.SetcdsExcel(
  const Value: TClientDataSet);
begin
  FcdsExcel := Value;
end;

function TCtrlImportaGrupoOrcamen.ValidarDados: Boolean;
var
    aux:string;
    tot_log:integer;
    Dt:TDateTime;
begin
TRY
         Result    := false;
         tot_log   := Log.Count;

         //Plano orçamentário---------------------------------------------------
         aux := trim(cdsExcel.FieldByName('PLANO_ORCAMENTARIO').AsString);


         if trim(aux) = '' then
         begin
              Log.Add('Plano Orçamentário não informado');
         end
         else
         begin
              if not FcdsPlanoOrcamen.Locate('NOMEPLANOORC',aux,[]) then
                 Log.Add('Plano Orçamentário: "' +  aux  + '"  não localizado.')
              else
              begin
                 //Retorna o ID PlanoOrcamen
                 cdsExcel.Edit;
                 cdsExcel.Fieldbyname('IDPLANOORCAMEN').AsInteger := FcdsPlanoOrcamen.Fieldbyname('IDPLANOORCAMEN').AsInteger;
                 cdsExcel.Post;
              end;
         end;

         //Código de Grupo------------------------------------------------------
         aux := trim(cdsExcel.FieldByName('CODIGO_GRUPO').AsString);

         if trim(aux) = '' then
         begin
              Log.Add('Código do Grupo não informado');
         end
         else
         begin
               if VerificaRegistro('GRUPOORCAMEN','CODGRUPOORC',TRIM(aux), ' AND IDPLANOORCAMEN = '  +  IntToStr(FcdsPlanoOrcamen.Fieldbyname('IDPLANOORCAMEN').AsInteger)   ) > 0 then
                Log.Add('Já existe um grupo orçamentário com o código: ' + aux);
         end;

         //Descrição de Grupo---------------------------------------------------
         aux := trim(cdsExcel.FieldByName('DESCRICAO_GRUPO').AsString);

         if trim(aux) = '' then
         begin
              Log.Add('Descrição de Grupo não informado');
         end;
         {else
         begin
               if VerificaRegistro('GRUPOORCAMEN','NOMEGRUPOORCAMEN',TRIM(aux), ' AND IDPLANOORCAMEN = '  +  IntToStr(FcdsPlanoOrcamen.Fieldbyname('IDPLANOORCAMEN').AsInteger) ) > 0 then
                Log.Add('Já existe um grupo orçamentário com a descrição: ' + aux);
         end;}

         //Flag Analítico e Sintético-------------------------------------------
         aux := trim(cdsExcel.FieldByName('FLAG_ANALITICO_SINTETICO').AsString);

         if trim(aux) = '' then
         begin
              Log.Add('Flag de Analítico ou Sintético não informado.');
         end
         else
         begin
             if ( UpperCase(Trim(aux)) <> 'S' ) and ( UpperCase(Trim(aux)) <> 'A' ) then
               Log.Add('O valor da Flag de Analítico ou Sintético deverá ser '  + QuotedStr('S') + ' ou ' + QuotedStr('A')  );
         end;

         //Flag Positivo/Negativo-----------------------------------------------
         aux := trim(cdsExcel.FieldByName('FLAG_POSITIVO_NEGATIVO').AsString);

         if trim(aux) = '' then
         begin
              Log.Add('Flag de Positivo ou Negativo não informado.');
         end
         else
         begin
             if ( UpperCase(Trim(aux)) <> 'P' ) and ( UpperCase(Trim(aux)) <> 'N' ) then
               Log.Add('O valor da Flag de Positivo ou Negativo deverá ser '  + QuotedStr('P') + ' ou ' + QuotedStr('N')  );
         end;

         //Flag Resultado-------------------------------------------------------
         aux := trim(cdsExcel.FieldByName('FLAG_RESULTADO').AsString);

         if trim(aux) = '' then
         begin
              Log.Add('Flag de Positivo ou Negativo não informado.');
         end
         else
         begin
             if ( UpperCase(Trim(aux)) <> 'S' ) and ( UpperCase(Trim(aux)) <> 'N' ) then
               Log.Add('O valor da Flag de Positivo ou Negativo deverá ser '  + QuotedStr('S') + ' ou ' + QuotedStr('N')  );
         end;

         //IdFormula------------------------------------------------------------

         aux := trim(cdsExcel.FieldByName('ID_FORMULA').AsString);

         if trim(aux) <> '' then
         begin
              if VerificaRegistro('FORMORCADO','IDFORMORCADO',TRIM(aux) , '' ) > 0 then
                Log.Add('Não foi localizado um fórmula orçamentária com o id:  ' + aux);
         end;

         Result := (tot_log = Log.Count);
     EXCEPT
         on E:Exception Do
         begin
             ShowMessage('Erro ao validar dados - ' + E.Message);
         end;
     end;
end;

function TCtrlImportaGrupoOrcamen.VerificaRegistro(strTabela, strCampo,
  strValor,strWhere: string): integer;
begin
     TRY
           Result := -1;
           FcdsAux.Close;
           FcdsAux.Data := GetDataPacket( 'SELECT * FROM ' + TRIM(strTabela) +
                               ' WHERE ' + TRIM(strCampo) + ' = ' + QuotedStr(TRIM(strValor))
                               + ' ' + strWhere);

           Result := FcdsAux.Recordcount;
     EXCEPT
           Result := -1;
     END;
end;

end.
