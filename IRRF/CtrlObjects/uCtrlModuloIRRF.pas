//Analista.: Higor Nayde Ferreira
//Pendência: SOL: 259373/17635 - ppm: 1008348
//Data.....: 06/08/2015
//Rotina...: CalcProxDiaSemana/CalcDataIni/CalcDataFim
//Descricao: Adequação de Geração de Darf CSLL / PIS / COFINS
//------------------------------------------------------------------------------
//Analista.: Higor Nayde Ferreira
//Pendência: SOL: 257630 - ppm: 984314
//Data.....: 28/07/2015
//Rotina...: CalcProxDiaSemana/CalcDataIni/CalcDataFim
//Descricao: Adequação de Geração de Darf CSLL / PIS / COFINS
//------------------------------------------------------------------------------
//Analista.: Bruno Bastos
//Pendência: SOL: 101670 - Kintana: 451499
//Data.....: 27/11/2008
//Rotina...: CalcProxDiaSemana
//Descricao: Alterar o vencimento do DARF de Imposto de Renda para o último dia
//           útil do segundo decêndio.
//------------------------------------------------------------------------------
//Analista.: Paulo Ramos
//Pendência: 23914
//Data.....: 08/12/2006
//Rotina...: CalcDataIni, CalcDataFim, CalcProxDiaSemana
//Descricao: Tratar nos meses 2006/12 e 2007/12 a geração e o pagamento de DARF
//           por decêndio. Este é um período de transição definido pela SRF.
//------------------------------------------------------------------------------
//Analista.: Bruno Bastos
//Pendência: 22927
//Data.....: 27/07/2006
//Rotina...: CalcProxDiaSemana
//Descricao: Para CSLL/PIS/Confins testo agora se o dia da datafim é dia 15. Se verdadeiro
//           atribuo a datavenc o último dia do mês.
//------------------------------------------------------------------------------
//Analista.: Bruno Bastos
//Pendência: 22203
//Data.....: 04/05/2006
//Rotina...: CalcProxDiaSemana
//Descricao: Para IOF troquei as rotinas feriado e diautil da diasuteis pela
//           somadiasuteis da mesma unit.
//------------------------------------------------------------------------------
//Analista.: Bruno Bastos
//Pendência: 22071
//Data.....: 12/04/2006
//Rotina...: CalcProxDiaSemana, CalcDataIni, CalcDataFim
//Descricao: Utilizar novo período para CSLL/PIS/COFINS.
//------------------------------------------------------------------------------
//Analista.: Bruno Bastos
//Pendência: 21442
//Data.....: 24/02/2006
//Rotina...: CalcProxDiaSemana, CalcDataIni, CalcDataFim
//Descricao: Utilizar novo período de para IRRF.
//------------------------------------------------------------------------------
//Analista.: Paulo Ramos
//Pendência: 21328
//Data.....: 24/01/2006
//Rotina...: Calculo dos dias para IOF
//Descricao: Utilizar periodo de apuração de 10 dias para IOF. Lei 11196 de 21/11/2005
//------------------------------------------------------------------------------
//Analista.: Bruno Bastos
//Pendencia: 19615
//Rotina...: CalcDataIni
//Descrição: Mostrar a data de domingo e não de segunda-feira.
//------------------------------------------------------------------------------
//Analista.: Marchetti
//Pendencia: 17462 e 17463
//Rotina...: CalcProxDiaSemana, CalcDataIni, CalcDataFim
//Descrição: Altera o intervalo de busca para quinzenal quando CSLL/PIS/COFINS
//------------------------------------------------------------------------------

unit uCtrlModuloIRRF;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,uDiasUteis, Forms, FileCtrl, uCMFileUtils;
  Type
    TCtrlModuloIRRF = Class(TCmControlObject)

    private
    cdsGeral : TclientDataSet;

    fExisteParametros: Boolean;
    FLancaBaixaFloat: Boolean;
    fObrigaTrdxImposto: Boolean;
    fObrigaTrdxCCxConta: Boolean;
    FExcluiContab: Boolean;
    FCorrigeDocAuto: Boolean;
    FExcluiPlanil: Boolean;
    FTipoBordero: Boolean;
    FEstornaFinanc: Boolean;
    FEmiteLancaBaixa: Boolean;
    fValidaCCBaixa: Boolean;
    FControlaEmisCheque: Boolean;
    FObrigaFormaPagto: Boolean;
    FIdReports: Integer;
    FUnidNegoc: Integer;
    FIdTipoCliAdianto: Integer;
    FOrigemCm: Integer;
    FRamoFornAdianto: Integer;
    FCodAForne: Integer;
    FIdTipoProcRad: Integer;
    FUsuario: Integer;
    FIndiceTipoBordero: Integer;
    fNumLancto: Integer;
    FModeloImpressora: Integer;
    FEmpresaProp: Integer;
    fCodDocCPMF: LongInt;
    fCodDocumento: LongInt;
    fSubContaNaoIdent: LongInt;
    fVlrRetencao: Real;
    fIdForCli: Real;
    fValorZero: Real;
    fIdForCliIni: Real;
    fPpReports: String;
    FsIntegraVHL: string;
    fFormEventos: String;
    FPrevEfet: string;
    FSisCodOrigem: string;
    FImpressoraDefault: string;
    FVersao: string;
    FLancaFinan: string;
    FHistPadFinan: string;
    FLoteBordero: string;
    fFormParam: String;
    FCodPortForma: string;
    fContaNaoIdentificado: String;
    fCodTipRecDes: String;
    fNomeReport: String;
    protected
      procedure DoChangeDataBase; Override;
      procedure AfterInitialize;override;
    public
      sMascaraPlano,
      sMascaraDesemb,sMascDocFis,sMascDocJur,
      sLancFinanc,sEstorna,ObrigaAbc,ObrigaCrespon,sIntegraContab: String;
      iPlano : Integer;
      UnidNegoc : Integer;
      sRecPag:String;
      bTipoOper:Boolean;
      Constructor Create; Override;
      Destructor Destroy; Override;

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
      {Deleta Arquivos}
      Procedure DeletaArquivos(sExtensao:String;FormBase: TForm);
      function  ArredondaParaComparar(rValor:Real;iNumDecimais: Integer):Real;
      function  ContabilizaIdModulo(sOper: string; iCodDoc: LongInt): boolean;
      function  CalcProxDiaSemana(IdPessoa : LongInt; dDataRef : TDateTime; iDiaDesejado : Integer; bDiaUtil : Boolean; const iTipoImposto : Integer = 0) : TDateTime;
      function  CalcDataIni(dDataRef : TDateTime; const iTipoImposto : Integer = 0) : TDateTime;
      function  CalcDataFim(dDataRef : TDateTime; const iTipoImposto : Integer = 0) : TDateTime;
    protected

    End;

implementation

Uses uString,
     uMensErro, uRad;


{ TCtrlModuloIRRF }

procedure TCtrlModuloIRRF.AfterInitialize;
begin
  inherited;
end;

function TCtrlModuloIRRF.ArredondaParaComparar(rValor: Real;
                                           iNumDecimais: Integer): Real;

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
end;

function TCtrlModuloIRRF.CalcDataFim(
  dDataRef: TDateTime;
  const iTipoImposto : Integer = 0): TDateTime;
var iDiaSemana : Integer;
    dDataFim : TDateTime;
    iMesAnt, 
    iAno, iMes, iDia : word;
    sMes : String;
begin
  inherited;

  if iTipoImposto = 2 then //IOF
  begin
    DecodeDate(dDataRef, iAno, iMes, iDia);
    if (iDia >= 1) and (iDia <= 10) then
    begin
      iMes:=iMes-1;
      if iMes < 1 then
      begin
        iMes:=12;
        iAno:=iAno-1;
      end;
      dDataFim:=DiasUteis.UltDiaMes(iAno, iMes);
    end
    else
    begin
      if (iDia >= 11) and (iDia <= 20) then
      begin
        dDataFim := EncodeDate(iAno, iMes, 10);
      end
      else
      begin
        dDataFim := EncodeDate(iAno, iMes, 20);
      end;
    end;
    Result:=dDataFim;
  end
  else
  begin
    DecodeDate(dDataRef, iAno, iMes, iDia);
    if iTipoImposto = 0 then // É IRRF
    begin
      if ((iAno = 2006) and (iMes = 12) and (iDia >= 10)) or
         ((iAno = 2007) and (iMes =  1) and (iDia <= 31)) or
         ((iAno = 2007) and (iMes = 12) and (iDia >= 10)) or
         ((iAno = 2008) and (iMes =  1) and (iDia <= 31)) then
      //APURAR POR DECÊNDIO
      begin
        if (iDia >= 1) and (iDia <= 10) then
        begin
          iMes:=iMes-1;
          if iMes < 1 then
          begin
            iMes:=12;
            iAno:=iAno-1;
          end;
          dDataFim:=DiasUteis.UltDiaMes(iAno, iMes);
        end
        else
        begin
          if (iDia >= 11) and (iDia <= 20) then
            dDataFim := EncodeDate(iAno, iMes, 10)
          else
            dDataFim := EncodeDate(iAno, iMes, 20);
        end;
        Result:=dDataFim;
      end
      else
      //APURAR POR MÊS
      begin
        iMes := iMes - 1;
        If iMes = 0 Then
        Begin
          iMes := 12;
          iano := iAno - 1;
        End;
        dDataFim := DiasUteis.UltDiaMes(iAno,iMes);
        Result   := dDataFim;
      end;
    end
    else
    begin
      if iTipoImposto <> 1 then // Não é PIS/COFINS/CSLL
      begin
         DecodeDate(dDataRef, iAno, iMes, iDia);
         iMes     := iMes - 1;
         iAno     := StrToInt(Copy(FormatDateTime('dd/mm/yyyy', dDataRef), 7, 4));
         If iMes = 0 Then
         Begin
           iMes := 12;
           iano := iAno - 1;
         End;
         dDataFim := DiasUteis.UltDiaMes(iAno,iMes);
         Result   := dDataFim;
      end
      else
      begin
         DecodeDate(Date, iAno, iMes, iDia);
         //Higor Nayde SOL 257630 - ppm: 984314
         {iMesAnt := iMes;
         if (iDia >= 1) and (iDia <= 15) then
         begin
            iMes := iMes - 1;
            //qdo mês fevereiro pegaria mês dezembro do ano anterior
            if iMes < 1 then
            //qdo mês fevereiro pegaria mês dezembro do ano anterior-FIM
            begin
               iMes := 12;
               iAno := iAno - 1;
            end;
            dDataFim := DiasUteis.UltDiaMes(iAno,iMes);

            if ((ddataref - ddatafim) < 15) and (iMesAnt = 3) and (not DiasUteis.AnoBissexto(iAno)) or
               ((ddataref - ddatafim) = 1)  and (iMesAnt = 3) and (DiasUteis.AnoBissexto(iAno)) Then
              dDataFim := EncodeDate(iAno,iMes, 15);
         end
         else
         begin
            dDataFim := EncodeDate(iAno, iMes, 15);
         end;}
         dDataFim:=EncodeDate(iAno, iMes, 1);        //Higor Nayde SOL 257630 - ppm: 984314
         DecodeDate(dDataFim-1, iAno, iMes, iDia);   //Higor Nayde SOL 257630 - ppm: 984314
         dDataFim := DiasUteis.UltDiaMes(iAno,iMes); //Higor Nayde SOL 257630 - ppm: 984314
         Result := dDataFim;
      end;
    end;
  end;
end;

function TCtrlModuloIRRF.CalcDataIni(dDataRef: TDateTime; const iTipoImposto : Integer = 0): TDateTime;
var iDiaSemana : Integer;
    ddiferenca, dDataIni   : TDateTime;
    iMesAnt, 
    iAno, iMes, iDia : word;
    sMes : String;
begin
  inherited;
  if iTipoImposto = 2 then //IOF
  begin
    DecodeDate(dDataRef, iAno, iMes, iDia);
    if (iDia >= 1) and (iDia <= 10) then
    begin
      iMes:=iMes-1;
      if iMes < 1 then
      begin
        iMes:=12;
        iAno:=iAno-1;
      end;
      dDataIni := EncodeDate(iAno, iMes, 21);
    end
    else
    begin
      if (iDia >= 11) and (iDia <= 20) then
      begin
        dDataIni := EncodeDate(iAno, iMes, 1);
      end
      else
      begin
        dDataIni := EncodeDate(iAno, iMes, 11);
      end;
    end;
    Result:=dDataIni;
  end
  else
  begin
    DecodeDate(dDataRef, iAno, iMes, iDia);
    if iTipoImposto = 0 then // É IRRF
    begin
      if ((iAno = 2006) and (iMes = 12) and (iDia >= 10)) or
         ((iAno = 2007) and (iMes =  1) and (iDia <= 31)) or
         ((iAno = 2007) and (iMes = 12) and (iDia >= 10)) or
         ((iAno = 2008) and (iMes =  1) and (iDia <= 31)) then
      //APURAR POR DECÊNDIO
      begin
        if (iDia >= 1) and (iDia <= 10) then
        begin
          iMes:=iMes-1;
          if iMes < 1 then
          begin
            iMes:=12;
            iAno:=iAno-1;
          end;
          iDia := 21;
        end
        else
        begin
          if (iDia >= 11) and (iDia <= 20) then
            iDia := 1
          else
            iDia := 11
        end;
        dDataIni := EncodeDate(iAno, iMes, iDia);
        Result:=dDataIni;
      end
      else
      //APURAR POR MÊS
      begin
        iMes := iMes - 1;
        If iMes = 0 Then
        Begin
          iMes := 12;
          iano := iAno - 1;
        End;
        Result := EncodeDate(iAno, iMes, 1);
      end;
    end
    else
    begin
      if iTipoImposto <> 1 then // Não é PIS/COFINS/CSLL
      begin
        iMes   := StrToInt(copy(FormatDateTime('dd/mm/yyyy', dDataRef), 4, 2));
        iMes   := iMes - 1;
        iAno   := StrToInt(copy(FormatDateTime('dd/mm/yyyy', dDataRef), 7, 4));
        If iMes = 0 Then
        Begin
          iMes := 12;
          iano := iAno - 1;
        End;
        Result := EncodeDate(iAno, iMes, 1);
      end
      else
      begin
        DecodeDate(Date, iAno, iMes, iDia);
        //Higor Nayde SOL 257630 - ppm: 984314
        {iMesAnt := iMes;
        if (iDia >= 1) and (iDia <= 15) then
        begin
          iMes := iMes - 1;
          //qdo mês fevereiro pegaria mês dezembro do ano anterior
          if iMes < 1 then
          //qdo mês fevereiro pegaria mês dezembro do ano anterior-FIM
          begin
            iMes := 12;
            iAno := iAno - 1;
          end;
          dDataIni:=EncodeDate(iAno, iMes, 16);

          If (((ddataref - ddataini) < 30)  and (imes = 2) and (iMesAnt = 2)) or
             (((idia > 1) and (idia < 3))   and (imes = 2) and (iMesAnt = 3)) or
             ((idia < 14) and (imes = 2)    and (iMesAnt = 3) and (DiasUteis.AnoBissexto(iAno))) Then
            dDataIni:=EncodeDate(iAno, iMes, 1);
        end
        else
        begin
          dDataIni:=EncodeDate(iAno, iMes, 1);
        end;} //Higor Nayde SOL 257630 - ppm: 984314
        dDataIni:=EncodeDate(iAno, iMes, 1);          //Higor Nayde SOL 257630 - ppm: 984314
        DecodeDate(dDataIni-1, iAno, iMes, iDia);          //Higor Nayde SOL 257630 - ppm: 984314
        dDataIni:=EncodeDate(iAno, iMes, 1); 
        Result := dDataIni;
      end;
    end;
  end;
end;

function TCtrlModuloIRRF.CalcProxDiaSemana(IdPessoa : integer;
                                           dDataRef: TDateTime;
                                           iDiaDesejado: Integer;
                                           bDiaUtil: Boolean;
                                           const iTipoImposto : Integer = 0): TDateTime;
Var
  Ssql : string;
  iNumDias, iDiaSemana : Integer;
  ddataaux,
  dDataVencto, dDataIni, dDataFim : TDateTime;
  iDia, iMes, iAno,vDia : word;
  sMes : String;
  i, iContaDias: integer;
begin
  inherited;
  if iTipoImposto = 2 then //IOF
  begin
    DecodeDate(dDataRef, iAno, iMes, iDia);
    if (iDia >= 1) and (iDia <= 10) then
    begin
      iMes:=iMes-1;
      if iMes < 1 then
      begin
        iMes:=12;
        iAno:=iAno-1;
      end;
      dDataFim:=DiasUteis.UltDiaMes(iAno, iMes);
    end
    else
    begin
      if (iDia >= 11) and (iDia <= 20) then
      begin
        dDataFim:=EncodeDate(iAno, iMes, 10);
      end
      else
      begin
        dDataFim:=EncodeDate(iAno, iMes, 20);
      end;
    end;

    iContaDias:=iDiaDesejado;
    dDataVencto:=dDataFim;

    if bDiaUtil then
    Begin
      Ssql := 'SELECT ES.IDPAIS, ES.CODESTADO, EP.IDCIDADES           '+
              '  FROM PESSOA P, ENDPESS EP, CIDADES C, ESTADO ES,     '+
              '       EMPRESAPROP E                                   '+
              ' WHERE (E.IDPESSOA = '+IntToStr(IdPessoa)+') '+
              '   AND (P.IDPESSOA = E.IDPESSOA) '+
              '   AND (P.IDENDCOMERCIAL = EP.IDENDERECO) '+
              '   AND (EP.IDCIDADES = C.IDCIDADES) '+
              '   AND (C.IDESTADO = ES.IDESTADO)';
      cdsGeral.data := GetDataPacket(Ssql);

      dDataVencto := DiasUteis.SomaDiasUteis(dDataVencto, iContaDias,
                                             cdsGeral.FieldByName('IDCIDADES').AsInteger,
                                             cdsGeral.FieldByName('IDPAIS').AsInteger,
                                             cdsGeral.FieldByName('CODESTADO').AsString,
                                             False, True, False);

      Result := dDataVencto;
    end
    else
      result:=dDataFim + iDiaDesejado;
  end
  else
  begin
    DecodeDate(dDataRef, iAno, iMes, iDia);
    if iTipoImposto = 0 then // É IRRF
    begin
      if ((iAno = 2006) and (iMes = 12) and (iDia >= 10)) or
         ((iAno = 2007) and (iMes =  1) and (iDia <= 31)) or
         ((iAno = 2007) and (iMes = 12) and (iDia >= 10)) or
         ((iAno = 2008) and (iMes =  1) and (iDia <= 31)) then
      //APURAR POR DECÊNDIO
      begin
        //FORÇAR QUE NO MÊS DE JANEIRO A APURAÇÃO REALIZE O ÚLTIMO DECÊNDIO DE DEZEMBRO.
        if ((iAno = 2007) and (iMes =  1) and (iDia <= 31)) or
           ((iAno = 2008) and (iMes =  1) and (iDia <= 31)) then
          iDia:=10;
        if (iDia >= 1) and (iDia <= 10) then
        begin
          iMes:=iMes-1;
          if iMes < 1 then
          begin
            iMes:=12;
            iAno:=iAno-1;
          end;
          dDataFim:=DiasUteis.UltDiaMes(iAno, iMes);
        end
        else
        begin
          if (iDia >= 11) and (iDia <= 20) then
          begin
            dDataFim:=EncodeDate(iAno, iMes, 10);
          end
          else
          begin
            dDataFim:=EncodeDate(iAno, iMes, 20);
          end;
        end;

        iContaDias:=iDiaDesejado;
        dDataVencto:=dDataFim;

        if bDiaUtil then
        Begin
          Ssql := 'SELECT ES.IDPAIS, ES.CODESTADO, EP.IDCIDADES           '+
                  '  FROM PESSOA P, ENDPESS EP, CIDADES C, ESTADO ES,     '+
                  '       EMPRESAPROP E                                   '+
                  ' WHERE (E.IDPESSOA = '+IntToStr(IdPessoa)+') '+
                  '   AND (P.IDPESSOA = E.IDPESSOA) '+
                  '   AND (P.IDENDCOMERCIAL = EP.IDENDERECO) '+
                  '   AND (EP.IDCIDADES = C.IDCIDADES) '+
                  '   AND (C.IDESTADO = ES.IDESTADO)';
          cdsGeral.data := GetDataPacket(Ssql);
          dDataVencto := DiasUteis.SomaDiasUteis(dDataVencto, iContaDias,
                                                 cdsGeral.FieldByName('IDCIDADES').AsInteger,
                                                 cdsGeral.FieldByName('IDPAIS').AsInteger,
                                                 cdsGeral.FieldByName('CODESTADO').AsString,
                                                 False, True, False);
          Result := dDataVencto;
        end
        else
          result:=dDataFim + iDiaDesejado;
      end
      else
      //APURAR POR MÊS
      begin
        dDataIni := EncodeDate(iAno, iMes, 1);
        dDataFim := DiasUteis.UltDiaMes(iAno, iMes);
        //Bruno Bastos - SOL: 101670 - Kintana:451499 - dDataRef := EncodeDate(iAno, iMes, 10);
        dDataRef := EncodeDate(iAno, iMes, 20); //Bruno Bastos - SOL: 101670 - Kintana:451499
        Result   := dDataFim;
        if bDiaUtil then
        Begin
          Ssql := 'SELECT ES.IDPAIS, ES.CODESTADO, EP.IDCIDADES           '+
                  '  FROM PESSOA P, ENDPESS EP, CIDADES C, ESTADO ES,     '+
                  '       EMPRESAPROP E                                   '+
                  ' WHERE (E.IDPESSOA = '+IntToStr(IdPessoa)+') '+
                  '   AND (P.IDPESSOA = E.IDPESSOA) '+
                  '   AND (P.IDENDCOMERCIAL = EP.IDENDERECO) '+
                  '   AND (EP.IDCIDADES = C.IDCIDADES) '+
                  '   AND (C.IDESTADO = ES.IDESTADO)';
          cdsGeral.data := GetDataPacket(Ssql);

          while DiasUteis.Feriado(dDataRef,
                                  cdsGeral.FieldByName('IDCIDADES').AsInteger,
                                  cdsGeral.FieldByName('IDPAIS').AsInteger,
                                  cdsGeral.FieldByName('CODESTADO').AsString,
                                  False,True) do
          begin
            dDataRef := dDataRef - 1;
          end;
          while not DiasUteis.DiaUtil(dDataRef,
                                      cdsGeral.FieldByName('IDCIDADES').AsInteger,
                                      cdsGeral.FieldByName('IDPAIS').AsInteger,
                                      cdsGeral.FieldByName('CODESTADO').AsString,
                                      False,True,False) do
          begin
            dDataRef := dDataRef - 1;
          end;
          Result := dDataRef;
        end;
      end;
    end
    else
    begin
      if iTipoImposto <> 1 then // Não é PIS/COFINS/CSLL
      begin
        dDataIni := EncodeDate(iAno, iMes, 1);
        dDataFim := DiasUteis.UltDiaMes(iAno, iMes);
        dDataRef := EncodeDate(iAno, iMes, 10);
        Result   := dDataFim;
        if bDiaUtil then
        Begin
          Ssql := 'SELECT ES.IDPAIS, ES.CODESTADO, EP.IDCIDADES           '+
                  '  FROM PESSOA P, ENDPESS EP, CIDADES C, ESTADO ES,     '+
                  '       EMPRESAPROP E                                   '+
                  ' WHERE (E.IDPESSOA = '+IntToStr(IdPessoa)+') '+
                  '   AND (P.IDPESSOA = E.IDPESSOA) '+
                  '   AND (P.IDENDCOMERCIAL = EP.IDENDERECO) '+
                  '   AND (EP.IDCIDADES = C.IDCIDADES) '+
                  '   AND (C.IDESTADO = ES.IDESTADO)';
          cdsGeral.data := GetDataPacket(Ssql);

          while DiasUteis.Feriado(dDataRef,
                                  cdsGeral.FieldByName('IDCIDADES').AsInteger,
                                  cdsGeral.FieldByName('IDPAIS').AsInteger,
                                  cdsGeral.FieldByName('CODESTADO').AsString,
                                  False,True) do
          begin
            dDataRef := dDataRef - 1;
          end;
          while not DiasUteis.DiaUtil(dDataRef,
                                      cdsGeral.FieldByName('IDCIDADES').AsInteger,
                                      cdsGeral.FieldByName('IDPAIS').AsInteger,
                                      cdsGeral.FieldByName('CODESTADO').AsString,
                                      False,True,False) do
          begin
            dDataRef := dDataRef - 1;
          end;
          Result := dDataRef;
        end;
      end
      else     // é PIS/COFINS/CSLL
      begin         //Higor Nayde SOL 257630 - ppm: 984314 Inicio
        DecodeDate(dDataRef, iAno, iMes, iDia);
        dDataFim := DiasUteis.UltDiaMes(iAno,iMes);

        vDia := 20;
        //Higor Nayde SOL SOL: 259373/17635 - ppm: 1008348 Retirado (iMes+1)
        while not DiasUteis.DiaUtil(IdPessoa, EncodeDate(iAno, iMes, vDia), false,False,False) do
        begin
          vDia := vDia - 1;
        end;

         //Higor Nayde SOL: 259373/17635 - ppm: 1008348 FHBS - Retirado (iMes+1)
        dDataVencto := StrToDate(IntToStr(vDia)+'/'+IntToStr(iMes) +'/'+IntToStr(iAno));
        {if iDia = 15 Then
          dDataVencto := DiasUteis.UltDiaMes(iAno,iMes)
        else
          dDataVencto := dDataFim + 15;        }
         //Higor Nayde SOL 257630 - ppm: 984314 fim
        if bDiaUtil then
        Begin
          Ssql := 'SELECT ES.IDPAIS, ES.CODESTADO, EP.IDCIDADES           '+
                  '  FROM PESSOA P, ENDPESS EP, CIDADES C, ESTADO ES,     '+
                  '       EMPRESAPROP E                                   '+
                  ' WHERE (E.IDPESSOA = '+IntToStr(IdPessoa)+') '+
                  '   AND (P.IDPESSOA = E.IDPESSOA) '+
                  '   AND (P.IDENDCOMERCIAL = EP.IDENDERECO) '+
                  '   AND (EP.IDCIDADES = C.IDCIDADES) '+
                  '   AND (C.IDESTADO = ES.IDESTADO)';
          cdsGeral.data := GetDataPacket(Ssql);
          //

          while DiasUteis.Feriado(dDataVencto,
                                  cdsGeral.FieldByName('IDCIDADES').AsInteger,
                                  cdsGeral.FieldByName('IDPAIS').AsInteger,
                                  cdsGeral.FieldByName('CODESTADO').AsString,
                                  False,True) do
          begin
            dDataVencto := dDataVencto - 1;
          end;
          while not DiasUteis.DiaUtil(dDataVencto,
                                      cdsGeral.FieldByName('IDCIDADES').AsInteger,
                                      cdsGeral.FieldByName('IDPAIS').AsInteger,
                                      cdsGeral.FieldByName('CODESTADO').AsString,
                                      False,True,False) do
          begin
            dDataVencto := dDataVencto - 1;
          end;
          Result := dDataVencto;
        end;
      end;
    end;
  end;
end;

function TCtrlModuloIRRF.ContabilizaIdModulo(sOper: string;
                                         iCodDoc: Integer): boolean;
Var
  Ssql : string;
begin
  Result := True;
  if Trim(sOper) = '5' then
    Begin
      Ssql := 'SELECT IDMODULO FROM DOCUMENTO WHERE CODDOCUMENTO = '+
                IntToStr(iCodDoc);
      cdsGeral.data := GetDataPacket(Ssql);
      if cdsGeral.FieldByName('IDMODULO').AsInteger = 127 then
        Result := False;
    end;
end;

constructor TCtrlModuloIRRF.Create;
begin
  inherited;
  cdsGeral := TClientDataSet.Create(nil);
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
end;

procedure TCtrlModuloIRRF.DeletaArquivos(sExtensao: String; FormBase: TForm);
Var
    X:Integer;
    ListaArqTemp: TFileListBox;
Begin
    ListaArqTemp := TFileListBox.Create(Application);
    try
     ListaArqTemp.Visible := False;
     ListaArqTemp.Parent := FormBase;
     ListaArqTemp.Mask := '*.' + sExtensao;
     ListaArqTemp.Directory := Copy(cmGetTempPath,1,Length(cmGetTempPath));
     ListaArqTemp.Refresh;
     For X:= 0 To ListaArqTemp.Items.Count - 1 Do
        DeleteFile(PChar(cmGetTempPath + ListaArqTemp.Items[x]));
    Finally
     ListaArqTemp.Free;
    End;
end;

destructor TCtrlModuloIRRF.Destroy;
begin
  inherited;
  cdsGeral.free;
end;

procedure TCtrlModuloIRRF.DoChangeDataBase;
begin
  inherited;

end;


end.
