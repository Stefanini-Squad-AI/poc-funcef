(*******************************************************************************
 20/01/99
  Criação de Parametro para indicação de impressora default para Cheque/Bloqueto
 11/02/99
  Implementação dos Métodos
         procedure MotaSelectForCli(MontaSelect: TMontaSelect;sRecPag:String);
         procedure FazerConsultaForCli(MontaSelect: TMontaSelect;Display: TEdit);
         E Do Form  TFrmProcuraCliFor para Otimizar os Combos de Busca a Clientes
         e fornecedores, passando para montaselect;
 25/02/99
  Criação da Propriedade IdTipoCliAdianto para indicação do Tipo de CLiente Para
  Adiantamento;
  Criação do Método Modulo.BuscaParamCap;
 22/03/1999 - 02.06.01
 Criação e inicialização da propriedade HistPadFinan;

 (...)

 13/10/1999 - 2.13.14 (R)
   Impementação da propriedade ContaNaoIdentificado que inicializada pelo método
   BuscaParamCap com a conta contábil dos lançamentos não identificados definida
   no ParamFinanc.
 20/12/1999 - 2.13.16
   Inclusao da propriedade IdTipoProcRad que indentifica a existencia de um
   processo de controle de pagamentos
 04/01/2000 - 2.15.01
   Implementação do método ExisteRegularizacao onde é verificado se ocorreu a
   regularização de um adiandamento ou se um documento possui regularização
   através do parâmetro código do documento;
 15/05/200 - Alterações Funcef
   Criação das propriedades...
   IdReports           :Integer
   OrigemCm            :Integer
   NomeReport          :String
   FormEventos         :String
   FormParam           :String
   PpReports           :String
   CodDocumento        :LongInt
   ...para contemplar a implementação do Parâmetro do Sistema "Relatório para Espelho de Documento";
  10/10/2000
   Inclusão do método ValidaDataPagtoRecto;
*******************************************************************************)

unit UModulo;

interface

Uses
  SysUtils, Forms, Controls,MontaSelect,StdCtrls, Wwdbigrd, Wwdbgrid, dBaseDados,
  WwQuery, Classes, Windows, filectrl, uIntegraBack, ppCtrls, Dialogs, uDiasUteis;

type TModulo = Class
   private
         //FSistema,
         FVersao,
         FSisCodOrigem, FPrevEfet, FLoteBordero, FHistPadFinan, FsIntegraVHL,
         FImpressoraDefault,FCodPortForma,FLancaFinan            :string;
         FEmpresaProp, FCodAForne, FUsuario, FIdTipoCliAdianto,
         FUnidNegoc, FIndiceTipoBordero, FModeloImpressora,
         FRamoFornAdianto                                        :Integer;
         FTipoBordero, FEmiteLancaBaixa, FEstornaFinanc,
         FObrigaFormaPagto, FCorrigeDocAuto, FExcluiContab,
         FControlaEmisCheque                                     :Boolean;
         fValorZero                                              :Real;
         FLancaBaixaFloat, FExcluiPlanil                         :Boolean;
         FIdTipoProcRad                                          :Integer;
         fContaNaoIdentificado                                   :String;
         fNomeReport                                             :String;
         fSubContaNaoIdent                                       :LongInt;
         bCadastraModeloRelat                                    :Boolean;
         fExisteParametros                                       :Boolean;
         fNumLancto                                              :Integer;
         fVlrRetencao                                            :Real;
         fIdForCli                                               :Real;
         fIdForCliIni                                            :Real;
         fIdReports                                              :Integer;
         fOrigemCm                                               :Integer;
         fFormEventos                                            :String;
         fFormParam                                              :String;
         fPpReports                                              :String;
         fCodDocumento                                           :LongInt;
         fObrigaTrdxCCxConta                                     :Boolean;
         fObrigaTrdxImposto                                      :Boolean;
         fCodTipRecDes                                           :String;
         fCodDocCPMF                                             :LongInt;
         fValidaCCBaixa                                          :Boolean;
   public
         sMascaraPlano,
         sMascaraDesemb,sMascDocFis,sMascDocJur,
         sLancFinanc,sEstorna,ObrigaAbc,ObrigaCrespon,sIntegraContab: String;
         iPlano : Integer;
         UnidNegoc : Integer;
         sRecPag:String;
         bTipoOper:Boolean;


         Constructor Create;
         property  ValorZero           :Real    read fValorZero            write fValorZero;
         property  SubContaNaoIdent    :LongInt read fSubContaNaoIdent     write fSubContaNaoIdent;
         property  ImpressoraDefault   :string  read FImpressoraDefault    write FImpressoraDefault;
         property  Versao              :string  read FVersao               write FVersao;
         property  HistPadFinan        :string  read FHistPadFinan         write FHistPadFinan;
         property  SisCodOrigem        :string  read FSisCodOrigem         write FSisCodOrigem;
         property  LoteBordero         :string  read FLoteBordero          write FLoteBordero;
         property  sIntegraVHL         :string  read FsIntegraVHL          write FsIntegraVHL;
         property  PrevEfet            :string  read FPrevEfet             write FPrevEfet;
         property  CodPortForma        :string  read FCodPortForma         write FCodPortForma;
         property  LancaFinan          :string  read FLancaFinan           write FLancaFinan;
         property  ContaNaoIdentificado:String  read fContaNaoIdentificado Write fContaNaoIdentificado;
         property  ModeloImpressora    :Integer read FModeloImpressora     write FModeloImpressora;
         property  EmpresaProp         :Integer read FEmpresaProp          write FEmpresaProp;
         property  Usuario             :Integer read FUsuario              write FUsuario;
         property  IdTipoCliAdianto    :Integer read FIdTipoCliAdianto     write FIdTipoCliAdianto;
         property  UnidNegocc          :Integer read FUnidNegoc            write FUnidNegoc;
         property  CodAForne           :Integer read FCodAForne            write FCodAForne;
         property  IndiceTipoBordero   :Integer read FIndiceTipoBordero    write FIndiceTipoBordero;
         property  RamoFornAdianto     :Integer read FRamoFornAdianto      write FRamoFornAdianto;
         property  TipoBordero         :Boolean read FTipoBordero          write FTipoBordero;
         property  EstornaFinanc       :Boolean read FEstornaFinanc        write FEstornaFinanc;
         property  EmiteLancaBaixa     :Boolean read FEmiteLancaBaixa      write FEmiteLancaBaixa;
         property  ObrigaFormaPagto    :Boolean read FObrigaFormaPagto     write FObrigaFormaPagto;
         property  CorrigeDocAuto      :Boolean read FCorrigeDocAuto       write FCorrigeDocAuto;
         property  ExcluiContab        :Boolean read FExcluiContab         write FExcluiContab;
         property  ControlaEmisCheque  :Boolean read FControlaEmisCheque   write FControlaEmisCheque;
         property  LancaBaixaFloat     :Boolean read FLancaBaixaFloat      Write FLancaBaixaFloat;
         property  ExcluiPlanil        :Boolean read FExcluiPlanil         Write FExcluiPlanil;
         property  CadastraModeloRelat :Boolean read bCadastraModeloRelat  Write bCadastraModeloRelat;
         property  ExisteParametros    :Boolean read fExisteParametros     Write fExisteParametros;
         property  IdTipoProcRad       :Integer read FIdTipoProcRad        Write FIdTipoProcRad;
         property  NumLancto           :Integer read fNumLancto            Write fNumLancto;
         property  VlrRetencao         :Real    read fVlrRetencao          Write fVlrRetencao;
         property  IdForCli            :Real    read fIdForCli             Write fIdForCli;
         property  IdForCliIni         :Real    read fIdForCliIni          Write fIdForCliIni;
         property  IdReports           :Integer read FIdReports            Write FIdReports;
         property  OrigemCm            :Integer read FOrigemCm             Write FOrigemCm;
         property  NomeReport          :String  read fNomeReport           write fNomeReport;
         property  FormEventos         :String  read fFormEventos          write fFormEventos;
         property  FormParam           :String  read fFormParam            write fFormParam;
         property  PpReports           :String  read fPpReports            write fPpReports;
         property  CodDocumento        :LongInt read fCodDocumento         write fCodDocumento;
         property  ObrigaTrdxCCxConta  :Boolean read fObrigaTrdxCCxConta   Write fObrigaTrdxCCxConta;
         property  ObrigaTrdxImposto   :Boolean read fObrigaTrdxImposto    Write fObrigaTrdxImposto;
         property  CodTipRecDes        :String  read fCodTipRecDes         Write fCodTipRecDes;
         property  CodDocCPMF          :LongInt read fCodDocCPMF           write fCodDocCPMF;
         property  ValidaCCBaixa       :Boolean read fValidaCCBaixa        write fValidaCCBaixa;
         procedure BuscaParamCap(iEmpresa: Integer);
         Procedure DeletaArquivos(sExtensao:String;FormBase: TForm);
         Function  GravaNumFatura(iCoddocumento, iNumLancto :LongInt; sNumFatura :String; cTipoDoc: Char; sMascara: String) :Boolean;
         function  DlgData(sCaption,sFrase: String; dDataIni: TdateTime):String;
         function  ArredondaParaComparar(rValor:Real;iNumDecimais: Integer):Real;
         function  VerificaLinhaGrid(Qry:TwwQuery;iTagChave, iTagVazio:Integer;sTabelaMensagem:String;bPermiteChaveVazia:Boolean):Boolean;
         
         
         Function  ValidaDataPagtoRecto(iCoddocumento :LongInt; datapagto:string): Boolean;
         function  ContabilizaIdModulo(sOper: string; iCodDoc: LongInt): boolean;
         function  StatusIsAtivo(IdPessoa: Integer): Boolean;

         function CalcProxDiaSemana(dDataRef : TDateTime; iDiaDesejado : Integer; bDiaUtil : Boolean) : TDateTime;
         function CalcDataIni(dDataRef : TDateTime) : TDateTime;
         function CalcDataFim(dDataRef : TDateTime) : TDateTime;
   End;

var Modulo : TModulo;

implementation

Uses uDataBase, uString,
     uSistema, uMensErro, uRad, uFuncaoGeral;

Constructor TModulo.Create;
Begin
  Inherited Create;
  fValorZero            := 0;
  fIdReports            := 0;
  fOrigemCm             := 0;
  fCodDocumento         := 0;
  fNomeReport           := '';
  fFormEventos          := '';
  fFormParam            := '';
  fPpReports            := '';
  fCodTipRecDes         := '';
  fExisteParametros     := False;
  fObrigaTrdxCCxConta   := False;
  fObrigaTrdxImposto    := False;
  fCodDocCPMF           := 0;
  fValidaCCBaixa        := False;
End;

function TModulo.ContabilizaIdModulo(sOper: string; iCodDoc: LongInt): Boolean;
begin
  Result := True;
  if Trim(sOper) = '5' then
    if FazQuery(DtmBaseDados.Qry,
                'SELECT IDMODULO FROM DOCUMENTO WHERE CODDOCUMENTO = '+
                IntToStr(iCodDoc)) then
      if DtmBaseDados.Qry.FieldByName('IDMODULO').AsInteger = 127 then
        Result := False;
end;

function TModulo.ArredondaParaComparar(rValor:Real;iNumDecimais: Integer):Real;
Var
  sMascara, sAuxValor:String;
Begin
    If iNumDecimais < 0 then
       sMascara := '%17.0f'
    Else
       sMascara := '%17.' + IntToStr(iNumDecimais) + 'f';

    sAuxValor := trim(Format(sMascara,[rValor]));

    while Pos('.',sAuxValor) <> 0 Do
             Delete(sAuxValor,Pos('.',sAuxValor),1);

    Result := StrToFloat(sAuxValor)
End;

function TModulo.DlgData(sCaption,sFrase: String; dDataIni: TdateTime):String;
Begin
End;

procedure TModulo.BuscaParamCap(iEmpresa: Integer);
Begin
End;

Function TModulo.VerificaLinhaGrid(Qry:TwwQuery; iTagChave, iTagVazio:Integer;sTabelaMensagem:String;bPermiteChaveVazia:Boolean):Boolean;
Var X:Integer;
    sChave: String;
    ListaChave: TStrings;
Begin
   ListaChave := TStringList.Create;

   If Qry.IsEmpty Then
   Begin
      Result := True;
      Exit;
   End;

   Try
      Qry.First;
      While Not Qry.Eof Do
      Begin
          sChave := '';
          For X:=0 To Qry.FieldCount - 1 Do
              If (Qry.Fields[X].Tag = iTagChave) Or (Qry.Fields[X].Tag = iTagVazio) Then
              Begin
                 sChave  := sChave + Trim(Qry.Fields[X].AsString);
                 If (Not bPermiteChaveVazia) And (Qry.Fields[X].Tag <> iTagVazio) Then
                 Begin
                     If Qry.Fields[X].IsNull Then
                     Begin
                       Application.MessageBox(PChar('O Campo ' + Qry.Fields[X].DisPlayLabel + ' do Cadastro de ' + sTabelaMensagem + ' não foi informado'),'Atenção',Mb_IconInformation);
                       Result := False;
                       Exit;
                     End;
                 End;
              End;
          If ListaChave.IndexOf(sChave) <> -1 Then
          Begin
               Application.MessageBox(PChar('O Cadastro de ' + sTabelaMensagem + ' contém um registro repetido'),'Atenção',Mb_IconInformation);
               Result := False;
               Exit;
          End
          Else
            If sChave = '' Then
            Begin
               Application.MessageBox(Pchar('O Cadastro de ' + sTabelaMensagem + ' contém um registro não preenchido'),'Atenção',Mb_IconInformation);
               Result := False;
               Exit;
            End
            Else
               ListaChave.Add(sChave);
          Qry.Next;
      End;
      Qry.First;
      Result := True;
   Finally
      ListaChave.Free;
   End;
End;

Procedure TModulo.DeletaArquivos(sExtensao:String;FormBase: TForm);
Var
    X:Integer;
    ListaArqTemp: TFileListBox;
Begin
    ListaArqTemp := TFileListBox.Create(Application);
    try
     ListaArqTemp.Visible := False;
     ListaArqTemp.Parent := FormBase;
     ListaArqTemp.Mask := '*.' + sExtensao;
     ListaArqTemp.Refresh;
     For X:= 0 To ListaArqTemp.Items.Count - 1 Do
    Finally
     ListaArqTemp.Free;
    End;
End;



Function TModulo.GravaNumFatura(iCoddocumento, iNumLancto :LongInt; sNumFatura :String; cTipoDoc: Char; sMascara: String) :Boolean;
Var
    sAuxNumFatura    :String;
    sSql             :String;
    Ano,Mes,Dia      :String;
    wAno,wMes,wDia   :Word;
    iAux, X, iPosFin :Integer;
    sValSeq          :String;
Begin
    StartTransacao;
    sAuxNumFatura := sNumFatura;

    If (sMascara <> '') Then
    Begin
       sAuxNumFatura := sMascara;
       DecodeDate(Date,wAno,wMes,wDia);

       Ano  := IntToStr(wAno);
       Mes := IntToStr(wMes);
       Dia := IntToStr(wDia);

       If Length(Dia) = 1 Then
          Dia := '0' + Dia;

       If Length(Mes) = 1 Then
          Mes := '0' + Mes;


       If Length(Mes) = 1 Then
          Mes := '0' + Mes;

       If Length(Dia) = 1 Then
          Mes := '0' + Dia;

       iAux := Pos('DD',upperCase(sAuxNumFatura));
       If  iAux <> 0 Then
       Begin
           sAuxNumFatura[iAux] := Dia[1];
           sAuxNumFatura[iAux + 1] := Dia[2];
       End;

       iAux := Pos('MM',upperCase(sAuxNumFatura));
       If  iAux <> 0 Then
       Begin
           sAuxNumFatura[iAux] := Mes[1];
           sAuxNumFatura[iAux + 1] := Mes[2];
       End;

       iAux := Pos('YYYY',upperCase(sAuxNumFatura));
       If  iAux <> 0 Then
       Begin
           sAuxNumFatura[iAux] := Ano[1];
           sAuxNumFatura[iAux + 1] := Ano[2];
           sAuxNumFatura[iAux + 2] := Ano[3];
           sAuxNumFatura[iAux + 3] := Ano[4];
       End;

       iAux := Pos('YY',upperCase(sAuxNumFatura));
       If  iAux <> 0 Then
       Begin
           sAuxNumFatura[iAux] := Ano[3];
           sAuxNumFatura[iAux + 1] := Ano[4];
       End;

       iAux := Pos('#',upperCase(sAuxNumFatura));
       iPosFin := 0;
       If  iAux <> 0 Then
       Begin
           While Pos('#',upperCase(sAuxNumFatura)) <> 0 Do
           Begin
               iPosFin := Pos('#',upperCase(sAuxNumFatura));
               sAuxNumFatura[iPosFin] := '0';
           End;

           sValSeq := IntToStr(LeultRegistro(nil,'CERTFICADORETENCAO'));
           For X:=Length(sValSeq) DownTo 1 Do
           Begin
               sAuxNumFatura[iPosFin] := sValSeq[x];
               Dec(iPosFin);
           End;
       End;

       sSql := 'UPDATE LANCTODOCUM SET NUMRECIBO = ''' + sAuxNumFatura + ''', FLGFATEMITIDA = ''S''' +
               ' WHERE (CODDOCUMENTO = ' + IntToStr(iCodDocumento) + ') AND ' +
               '       (NUMLANCTO = ' + IntToStr(iNumLancto) + ')';

       Result := ((Trim(sAuxNumFatura) <> '') And (ExecutarQuery(DtmBaseDados.Qry,sSql)));
    End
    Else
    Begin
       If InputQuery('Atenção','Digite o Nº de controle Documento a ser impresso',sAuxNumFatura) Then
       Begin
          Case cTipoDoc of
          'F','C':
             sSql := 'UPDATE LANCTODOCUM SET NUMFATURA = ''' + sAuxNumFatura + ''', FLGFATEMITIDA = ''S''' +
                     ' WHERE (CODDOCUMENTO = ' + IntToStr(iCodDocumento) + ') AND ' +
                     '       (NUMLANCTO = ' + IntToStr(iNumLancto) + ')';
          'R':
             sSql := 'UPDATE LANCTODOCUM SET NUMRECIBO = ''' + sAuxNumFatura + ''', FLGFATEMITIDA = ''S''' +
                     ' WHERE (CODDOCUMENTO = ' + IntToStr(iCodDocumento) + ') AND ' +
                     '       (NUMLANCTO = ' + IntToStr(iNumLancto) + ')';
          End;

          Result := ((Trim(sAuxNumFatura) <> '') And (ExecutarQuery(DtmBaseDados.Qry,sSql)));
       End
       Else
          Result := False;
    End;

    If Result Then
       CommitTransacao
    Else
       RollbackTransacao;
End;

Function TModulo.ValidaDataPagtoRecto(iCoddocumento :LongInt; datapagto:string): Boolean;
begin
   result:= Not FazQuery(dtmBaseDados.qry, 'Select datalancto from lanctodocum where coddocumento='+
                                                inttostr(icoddocumento)+
                                                ' and operacao in (''2'',''3'',''1'',''14'') and '+
                                                ' datalancto > to_date('+#39+datapagto+#39+','+'''dd/mm/yyyy'')');

   If Not Result Then
      MsgDlg('Data do Pagamento Menor que a do Lançamento do documento('+ dtmBaseDados.qry.fieldbyname('datalancto').asstring+')','Erro',mterror,[mbOk],0);

   If dtmBaseDados.qry.Active Then dtmBaseDados.qry.close;
end;

function TModulo.StatusIsAtivo(IdPessoa: Integer): Boolean;
Var
  sNome :String;
begin
  With TwwQuery.Create(Application) Do
    Try
      DataBaseName := 'BaseDados';
      If IntegraBack.RecPag = 'P' Then
      Begin
         Sql.Text := 'SELECT FLGSTATUS FROM EMPRESAFORN WHERE IDFORCLI = ' + FloatToStr(IdPessoa) + ' AND IDPESSOA = ' + IntToStr(Sistema.IdEmpresa);
         sNome := 'Fornecedor\Favorecido';
      End
      Else
      Begin
         Sql.Text := 'SELECT FLGSTATUS FROM EMPRESACLIENTE WHERE IDFORCLI = ' + FloatToStr(IdPessoa) + ' AND IDPESSOA = ' + IntToStr(Sistema.IdEmpresa);
         sNome := 'Cliente';
      End;

      Open;

      Result := IsEmpty Or (Fields[0].AsString <> 'I');

      If Not Result Then
         MsgDlg('Este ' + sNome +' está Inativo. Não é permitido fazer movimentação para o mesmo','Atenção',mtInformation,[mbOk],0);

      Close;
    finally
      free;
    End;
end;

function TModulo.CalcProxDiaSemana(dDataRef : TDateTime; iDiaDesejado : Integer; bDiaUtil : Boolean) : TDateTime;
var iNumDias, iDiaSemana : Integer;
    dDataIni, dDataFim   : TDateTime;
    qryAux : Twwquery;
begin
  inherited;
  iDiaSemana := DayOfWeek(dDataRef);
  dDataIni := dDataRef + (1 - iDiaSemana);
  dDataFim := dDataIni + iDiaDesejado;
  Result   := dDataFim;
  if bDiaUtil then begin
     qryAux := TwwQuery.Create(Application);
     qryAux.DatabaseName := 'BASEDADOS';
     Try
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add('SELECT ES.IDPAIS, ES.CODESTADO, EP.IDCIDADES           ');
        qryAux.SQL.Add('FROM PESSOA P,                                         ');
        qryAux.SQL.Add('     ENDPESS EP,                                       ');
        qryAux.SQL.Add('     CIDADES C,                                        ');
        qryAux.SQL.Add('     ESTADO ES,                                        ');
        qryAux.SQL.Add('     EMPRESAPROP E                                     ');
        qryAux.SQL.Add('WHERE                                                  ');
        qryAux.SQL.Add('    (E.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') AND ');
        qryAux.SQL.Add('    (P.IDPESSOA = E.IDPESSOA) AND                      ');
        qryAux.SQL.Add('    (P.IDENDCOMERCIAL = EP.IDENDERECO) AND             ');
        qryAux.SQL.Add('    (EP.IDCIDADES = C.IDCIDADES) AND                   ');
        qryAux.SQL.Add('    (C.IDESTADO = ES.IDESTADO)                         ');
        qryAux.Open;
        //
        iNumDias := DiasUteis.ContaDiasNaoUteis((dDataIni+1),dDataFim,qryAux.FieldByName('IDCIDADES').AsInteger,
                  qryAux.FieldByName('IDPAIS').AsInteger, qryAux.FieldByName('CODESTADO').AsString,True,
                  True,False);
        Result := dDataFim + iNumDias;
     Finally
        qryAux.Close;
        qryAux.Free;
     end;
  end;
end;

function TModulo.CalcDataIni(dDataRef : TDateTime) : TDateTime;
var iDiaSemana : Integer;
begin
  inherited;
  iDiaSemana := DayOfWeek(dDataRef);
  Result     := dDataRef - iDiaSemana - 5;
end;

function TModulo.CalcDataFim(dDataRef : TDateTime) : TDateTime;
var iDiaSemana : Integer;
begin
  inherited;
  iDiaSemana := DayOfWeek(dDataRef);
  Result     := dDataRef - iDiaSemana;
end;


end.
