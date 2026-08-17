unit uCtrlMapaCota;

interface

Uses SysUtils, uCmControlObject, uCmClientDataSet, uCmTypes, vcf1, Math, udbRentabImob,
     uDiasUteis, JCLSysUtils, classes, uCMFileUtils, JCLStrings,
     uCtrlMapaTIR, uComunsImobiliario, uComunsImobiliarioDB;

const
  fCotaInicial : Extended = 100;

Type
   TCtrlMapaCota = class(TCmControlObject)
   protected
      procedure AfterInitialize; override;
      procedure OnCreateAppServer; override;
   private
      DiasUteis   : TDiasUteis;
      CtrlMapaTIR : TCtrlMapaTIR;
      CtrlImobiliario : TComunsImobiliarioDB;

      FcdsFluxo    : TCMClientDataSet;
      FcdsMapa     : TCMClientDataSet;
      FcdsFluxoSeg : TCMClientDataSet;
      cdsReaval    : TCMClientDataSet;
      cdsFluxoTot  : TCMClientDataSet;
      FdbRentabImob: TdbRentabImob;

      procedure SetdbRentabImob   (const Value: TdbRentabImob);
      procedure SetcdsFluxo       (const Value: TCMClientDataSet);
      procedure SetcdsMapa        (const Value: TCMClientDataSet);
      procedure SetcdsFluxoSeg    (const Value: TCMClientDataSet);

      function LookupMapa         (const iMes,iAno,iSegmento,iIdEmpresa,iIdMoedaCaf,iIdPaisCaf:Integer;
                                   const sPatroPlano:String) : OleVariant;
      function LookupReaval       (const iTipoSegmento:Integer; const sPatroPlano:String; const dDataBase:TDateTime): OLEVariant;
      function LookupReavalFundo  (const sPatroPlano:String; const dDataBase:TDateTime): OLEVariant;
      function MontaVlrAtivo      (const iTipoSegmento:Integer; const sPatroPlano:String; const dDtIni, dDtFim:TDateTime) : Boolean;
      function CompletaFluxo      (sNomeBilhete: string; const iTipoSegmento:Integer; const sPatroPlano:String; const dDtIni, dDtFim: TDateTime) : Boolean;
      function IncluiAlienacao    (const dDtIni, dDtFim: TDateTime; const sPatroPlano:String; const bRenda:Boolean = False): Boolean;
      function IncluiAlienacaoDia (const dDtFim: TDateTime; const sPatroPlano:String; const bRenda:Boolean = False): Boolean;
      function IncluiFundo        (const dDtIni, dDtFim: TDateTime; const sPatroPlano:String): Boolean;
      function IncluiFundoDia     (const dDtFim: TDateTime; const sPatroPlano:String): Boolean;
      function CalculaCota        (sNomeBilhete: string; const sTipo:String; const dDtIni: TDateTime; const iMoedaReal, iMoedaAtuarial: Integer;
                                   const fPercAtuarial:Extended; var cdsFluxoCota: TCMClientDataSet): Boolean;
      function TotalizaFluxoSegmento(sNomeBilhete: string): Boolean;
      function TotalizaFluxoGeral   (sNomeBilhete: string): Boolean;

      function AjustaValorAtivoAlienacao(sNomeBilhete: string): Boolean;
      function LookupParcelasContrato(const iContrato : Integer) : OleVariant;

      function GravaRentabilidadeBI (sNomeBilhete: string; const dDtFim: TDateTime; const sPatroPlano:String;
                                     const iMoedaReal, iMoedaAtuarial, iSegmento: Integer): Boolean;
   public
      constructor Create (const iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso: Integer; const bUsaPlanoPatro: Boolean); reintroduce;
      destructor  Destroy; override;

      property dbRentabImob : TdbRentabImob read FdbRentabImob write SetdbRentabImob;

      property cdsMapa    : TCMClientDataSet read FcdsMapa     write SetcdsMapa;
      property cdsFluxo   : TCMClientDataSet read FcdsFluxo    write SetcdsFluxo;
      property cdsFluxoSeg: TCMClientDataSet read FcdsFluxoSeg write SetcdsFluxoSeg;

      function CalculoGravado(const iMes, iAno, iMoedaReal, iMoedaAtuarial: Integer) : Boolean;
      function ExcluiRentabBI(const iMes, iAno, iMoedaReal, iMoedaAtuarial: Integer) : Boolean;
      function CalculaRentabilidade(sNomeBilhete: string;
                                    const sPatroPlano: String;
                                    const iMes,iAno,iSegmento,iIdEmpresa,iIdMoedaCaf,iIdPaisCaf:Integer;
                                    const iMoedaReal, iMoedaAtuarial: Integer;
                                    const fPercAtuarial:Extended;
                                    const bAlienacaoRenda: Boolean = False;
                                    const bGravaBI: Boolean = False) : Boolean;

   published

end;

implementation


constructor TCtrlMapaCota.Create(const iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso: Integer; const bUsaPlanoPatro: Boolean);
begin
   inherited Create;
   DiasUteis   := TDiasUteis.Create;
   CtrlMapaTIR := TCtrlMapaTIR.Create;
   CtrlImobiliario := TComunsImobiliarioDB.Create(iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso, bUsaPlanoPatro);
   FDbRentabImob := TDBRentabImob.Create( Self );   
end;


procedure TCtrlMapaCota.OnCreateAppServer;
begin
  inherited;
  FCdsMapa  := TCMClientDataSet.Create( nil );
  FCdsFluxo := TCMClientDataSet.Create( nil );
end;


procedure TCtrlMapaCota.AfterInitialize;
begin
   inherited;
   DiasUteis.InitializeAs( Self );
   CtrlMapaTIR.InitializeAs( Self );
   CtrlImobiliario.InitializeAs( Self );
   FDbRentabImob.DataBaseName := DataBaseName;
end;

destructor TCtrlMapaCota.Destroy;
begin
   FreeAndNil( DiasUteis );
   FreeAndNil( CtrlMapaTIR );
   FreeAndNil( CtrlImobiliario );
   FreeAndNil( FDbRentabImob);
   if isAppServer then begin
      FreeAndNil( FCdsMapa );
      FreeAndNil( FCdsFluxo );
   end;
   inherited;
end;



function TCtrlMapaCota.CalculaRentabilidade(sNomeBilhete:String;
                                            const sPatroPlano: String;
                                            const iMes, iAno, iSegmento, iIdEmpresa,
                                                  iIdMoedaCaf, iIdPaisCaf: Integer;
                                            const iMoedaReal, iMoedaAtuarial: Integer;
                                            const fPercAtuarial:Extended;
                                            const bAlienacaoRenda: Boolean = False;
                                            const bGravaBI: Boolean = False) : Boolean;
var dDtIni, dDtFim, dIniAno : TDateTime;
    cdsTemp : TCMClientDataSet;
begin
   Result := True;
   try
      cdsReaval   := TCMClientDataSet.Create(nil);
      cdsFluxoTot := TCMClientDataSet.Create(nil);
      try
         dDtIni  := EncodeDate( iAno, iMes, 1 );
         dDtFim  := DiasUteis.UltDiaMes( iAno, iMes );
         dIniAno := EncodeDate( DiasUteis.ExtraiAno( dDtIni ), 1, 1 );

         DoProgresso ([sNomeBilhete, -1, -1, 'Recuperando dados dos imóveis...']);
         cdsMapa.Data := CtrlMapaTIR.DadosRelatorio(iSegmento,iIdEmpresa,
                                                    iIdMoedaCaf, iIdPaisCaf,
                                                    dDtIni, dDtFim, sPatroPlano, True);

         DoProgresso ([sNomeBilhete, -1, -1, 'Recuperando dados de Alienação...']);
         if not IncluiAlienacao(dDtIni, dDtFim, sPatroPlano, bAlienacaoRenda) then
            raise Exception.Create('Erro ao recuperar os dados de alienação');

         DoProgresso ([sNomeBilhete, -1, -1, 'Recuperando dados de Fundo Imobiliário...']);
         if not IncluiFundo(dDtIni, dDtFim, sPatroPlano) then
            raise Exception.Create('Erro ao recuperar os dados de Fundo Imobiliário');

         DoProgresso ([sNomeBilhete, -1, -1, 'Recuperando receitas e despesas operacionais dos imóveis...']);
         cdsFluxo.Data    := CtrlMapaTIR.ReceitaLiquidaMesAMes(iSegmento, dDtFim,True,True, sPatroPlano, '', True);

         if not IncluiAlienacaoDia(dDtFim, sPatroPlano, bAlienacaoRenda) then
            raise Exception.Create('Erro ao recuperar os dados diários de Alienação');

         if not IncluiFundoDia(dDtFim, sPatroPlano) then
            raise Exception.Create('Erro ao recuperar os dados diários de Fundo de Investimentos');

         // Abre estrutura vazia para criar o fluxo total dos segmentos e geral da carteira
         cdsFluxoSeg.Data := CtrlMapaTIR.ReceitaLiquidaMesAMes(iSegmento, dDtFim,True,True, QuotedStr('....'), '', True);
         cdsFluxoTot.Data := CtrlMapaTIR.ReceitaLiquidaMesAMes(iSegmento, dDtFim,True,True, QuotedStr('....'), '', True);

         // Busca Reavaliações no último dia do período ( atual )
         DoProgresso ([sNomeBilhete, -1, -1, 'Recuperando reavaliações dos imóveis...']);
         if not MontaVlrAtivo(iSegmento, sPatroPlano, dIniAno-1, dDtFim) then
            raise Exception.Create('Erro ao recuperar os dados das reavaliações');

         if not CompletaFluxo(sNomebilhete, iSegmento, sPatroPlano, dIniAno, dDtFim) then
            raise Exception.Create('Erro ao completar os dias do fluxo');

         if not AjustaValorAtivoAlienacao(sNomebilhete) then
            raise Exception.Create('Erro ao ajustar o valor do ativo de alienação');
            
         if not TotalizaFluxoSegmento(sNomebilhete) then
            raise Exception.Create('Erro ao completar o fluxo por segmento');

         if not TotalizaFluxoGeral(sNomebilhete) then
            raise Exception.Create('Erro ao completar o fluxo geral da carteira');

         if not CalculaCota(sNomebilhete, 'IMO', dIniAno, iMoedaReal, iMoedaAtuarial, fPercAtuarial,
                            FcdsFluxo) then
            raise Exception.Create('Erro ao calcular a cota diária por imóvel');

         if not CalculaCota(sNomebilhete, 'SEG', dIniAno, iMoedaReal, iMoedaAtuarial, fPercAtuarial,
                            FcdsFluxoSeg) then
            raise Exception.Create('Erro ao calcular a cota diária por segmento');

         if not CalculaCota(sNomebilhete, 'TOT', dIniAno, iMoedaReal, iMoedaAtuarial, fPercAtuarial,
                            cdsFluxoTot) then
            raise Exception.Create('Erro ao calcular a cota diária geral da carteira');


         if bGravaBI then begin
            if not GravaRentabilidadeBI(sNomeBilhete, dDtFim, sPatroPlano, iMoedaReal, iMoedaAtuarial, iSegmento) then
               raise Exception.Create('Erro ao gravar o calculo da rentabilidade pra BI');
         end;               

         Result := True;
      except
         on E: Exception do begin
            Result := False;
            Messageinfo := e.message;
         end;
      end;
   finally
      FreeAndNil( cdsTemp );
      FreeAndNil( cdsReaval );
      FreeAndNil( cdsFluxoTot );
   end;
end;



function TCtrlMapaCota.IncluiAlienacao( const dDtIni, dDtFim: TDateTime; const sPatroPlano:String;
                                        const bRenda:Boolean = False): Boolean;
var cdsTemp : TCMClientDataSet;
    sSegAlienacao, sIdSegAlienacao, sTitAlienacao : String;
begin
   Result := True;
   try
      try
         cdsTemp := TCMClientDataSet.Create(nil);
         cdsTemp.Data := CtrlMapaTIR.DadosAlienacaoCota( dDtIni, dDtFim, sPatroPlano );

         //Se a alienação for considerada como renda, verifica em qual segmento será inserida
         if bRenda then begin
            cdsMapa.First;
            while not cdsMapa.Eof do begin
               if cdsMapa.FieldByName('FLGTIPOINTERNO').AsString = 'R' then begin
                  sSegAlienacao   := cdsMapa.FieldByName('SEGMENTO').AsString;
                  sIdSegAlienacao := cdsMapa.FieldByName('IDSEGMENTO').AsString;
                  sTitAlienacao   := cdsMapa.FieldByName('TITULO').AsString;
               end;
               cdsMapa.Next;
            end;
         end else begin
            sSegAlienacao   := 'Alienação';
            sIdSegAlienacao := '-1';
            sTitAlienacao   := 'Contrato';
         end;

         if sSegAlienacao = '' then begin
           sSegAlienacao   := 'Segmento não especificado.';
           sIdSegAlienacao := '-1';
           sTitAlienacao   := 'Contrato';
         end;

         //Inclusão dos registros de alienações no dataset principal
         if not cdsTemp.IsEmpty then begin
           while not cdsTemp.Eof do begin
             cdsMapa.Append;
             cdsMapa.FieldByName('SEGMENTO').AsString           := sSegAlienacao;
             cdsMapa.FieldByName('IDSEGMENTO').AsString         := sIdSegAlienacao;
             cdsMapa.FieldByName('TITULO').AsString             := sTitAlienacao;
             cdsMapa.FieldByName('IMOVEL_MESTRE').AsString      := cdsTemp.FieldByName('CONNOME').AsString;
             cdsMapa.FieldByName('IDIMOVEL').AsInteger          := cdsTemp.FieldByName('IDCONTRATOIMOVEL').AsInteger;
             cdsMapa.FieldByName('ORDEM').AsInteger             := iff( bRenda, 1, 2 );
             cdsMapa.FieldByName('ORIGEM').AsInteger            := 2;
             cdsMapa.FieldByName('VALOR_CONTABIL').AsFloat      := CtrlMapaTIR.CalcSaldoDevedor( cdsTemp.FieldByName('IDCONTRATOIMOVEL').AsInteger, -1, dDtFim ) / 1000;
             cdsMapa.FieldByName('ULTREAVALIA').AsFloat         := cdsMapa.FieldByName('VALOR_CONTABIL').AsFloat;
             cdsMapa.FieldByName('RECEITA_LIQUIDA_MES').AsFloat := cdsTemp.FieldByName('RECEITA_LIQUIDA_MES').AsFloat;
             cdsMapa.FieldByName('RECEITA_LIQUIDA_ANO').AsFloat := cdsTemp.FieldByName('RECEITA_LIQUIDA_ANO').AsFloat;
             cdsMapa.Post;

             cdsTemp.Next;
           end;
         end;
      except
         on E: Exception do begin
            Result := False;
            Messageinfo := e.message;
         end;
      end;
   finally
      FreeAndNil( cdsTemp );
   end;
end;


function TCtrlMapaCota.IncluiAlienacaoDia(const dDtFim: TDateTime; const sPatroPlano: String; const bRenda: Boolean): Boolean;
var cdsTemp : TCMClientDataSet;
    sSegAlienacao, sIdSegAlienacao, sTitAlienacao : String;
begin
   Result := True;
   try
      try
         cdsTemp := TCMClientDataSet.Create(nil);
         cdsTemp.Data := CtrlMapaTIR.ReceitaAlienacaoDiaADia(dDtFim, sPatroPlano);

         //Se a alienação for considerada como renda, verifica em qual segmento será inserida
         if bRenda then begin
            cdsMapa.First;
            while not cdsMapa.Eof do begin
               if cdsMapa.FieldByName('FLGTIPOINTERNO').AsString = 'R' then begin
                  sSegAlienacao   := cdsMapa.FieldByName('SEGMENTO').AsString;
                  sIdSegAlienacao := cdsMapa.FieldByName('IDSEGMENTO').AsString;
               end;
               cdsMapa.Next;
            end;
         end else begin
            sSegAlienacao   := 'Alienação';
            sIdSegAlienacao := '-1';
         end;

         if sSegAlienacao = '' then begin
           sSegAlienacao   := 'Segmento não especificado.';
           sIdSegAlienacao := '-1';
         end;

         //Inclusão dos registros do fluxo de alienações no dataset principal
         if not cdsTemp.IsEmpty then begin
           while not cdsTemp.Eof do begin

             cdsFluxo.Append;
             cdsFluxo.FieldByName('IDSEGMENTO').AsString        := sIdSegAlienacao;
             cdsFluxo.FieldByName('IDIMOVELMESTRE').AsInteger   := cdsTemp.FieldByName('IDCONTRATOIMOVEL').AsInteger;
             cdsFluxo.FieldByName('ORIGEM').AsInteger           := 2;
             cdsFluxo.FieldByName('DATALANCTO').AsDateTime      := cdsTemp.FieldByName('DATALANCTO').AsDateTime;
             cdsFluxo.FieldByName('COMPRAVENDA').AsFloat        := 0;
             cdsFluxo.FieldByName('RECEITAMES').AsFloat         := cdsTemp.FieldByName('RECEITA').AsFloat;
             cdsFluxo.FieldByName('DESPESAMES').AsFloat         := cdsTemp.FieldByName('DESPESA').AsFloat;
             cdsFluxo.FieldByName('RECEITALIQUIDA').AsFloat     := cdsTemp.FieldByName('RECEITA').AsFloat - (cdsTemp.FieldByName('DESPESA').AsFloat);
             cdsFluxo.Post;

             cdsTemp.Next;
           end;
         end;

      except
         on E: Exception do begin
            Result := False;
            Messageinfo := e.message;
         end;
      end;
   finally
      FreeAndNil( cdsTemp );
   end;
end;




function TCtrlMapaCota.IncluiFundo(const dDtIni, dDtFim: TDateTime; const sPatroPlano: String): Boolean;
var cdsTemp : TCMClientDataSet;
begin
   Result := True;
   try
      try
         cdsTemp := TCMClientDataSet.Create(nil);
         cdsTemp.Data := CtrlMapaTIR.DadosFundoImob( dDtIni, dDtFim, sPatroPlano );

         //Inclusão dos registros de fundo imobiliário no dataset principal
         if not cdsTemp.IsEmpty then begin
           while not cdsTemp.Eof do begin
             cdsMapa.Append;
             cdsMapa.FieldByName('SEGMENTO').AsString           := 'Fundos Imobiliários';
             cdsMapa.FieldByName('IDSEGMENTO').AsString         := '-2';
             cdsMapa.FieldByName('TITULO').AsString             := 'Fundo';
             cdsMapa.FieldByName('IMOVEL_MESTRE').AsString      := cdsTemp.FieldByName('DESCFUNDOINVEST').AsString;
             cdsMapa.FieldByName('IDIMOVEL').AsInteger          := cdsTemp.FieldByName('IDFUNDOINVEST').AsInteger;
             cdsMapa.FieldByName('ORDEM').AsInteger             := 3;
             cdsMapa.FieldByName('ORIGEM').AsInteger            := 3;
             cdsMapa.FieldByName('VALOR_CONTABIL').AsFloat      := cdsTemp.FieldByName('VALOR_CONTABIL').AsFloat;
             cdsMapa.FieldByName('ULTREAVALIA').AsFloat         := cdsTemp.FieldByName('ULTREAVALIA').AsFloat;
             cdsMapa.FieldByName('RECEITA_LIQUIDA_MES').AsFloat := cdsTemp.FieldByName('RECEITA_LIQUIDA_MES').AsFloat;
             cdsMapa.FieldByName('RECEITA_LIQUIDA_ANO').AsFloat := cdsTemp.FieldByName('RECEITA_LIQUIDA_ANO').AsFloat;
             cdsMapa.Post;

             cdsTemp.Next;
           end;
         end;
      except
         on E: Exception do begin
            Result := False;
            Messageinfo := e.message;
         end;
      end;
   finally
      FreeAndNil( cdsTemp );
   end;
end;


function TCtrlMapaCota.IncluiFundoDia(const dDtFim: TDateTime; const sPatroPlano: String): Boolean;
var cdsTemp : TCMClientDataSet;
    sSegAlienacao, sIdSegAlienacao, sTitAlienacao : String;
begin
   Result := True;
   try
      try
         cdsTemp := TCMClientDataSet.Create(nil);
         cdsTemp.Data := CtrlMapaTIR.ReceitaFundoImobMesAMes(dDtFim, sPatroPlano, True);

         //Inclusão dos registros do fluxo de alienações no dataset principal
         if not cdsTemp.IsEmpty then begin
           while not cdsTemp.Eof do begin

             cdsFluxo.Append;
             cdsFluxo.FieldByName('IDSEGMENTO').AsString        := '-2';
             cdsFluxo.FieldByName('IDIMOVELMESTRE').AsInteger   := cdsTemp.FieldByName('IDFUNDOINVEST').AsInteger;
             cdsFluxo.FieldByName('ORIGEM').AsInteger           := 3;
             cdsFluxo.FieldByName('DATALANCTO').AsDateTime      := cdsTemp.FieldByName('DATALANCTO').AsDateTime;
             cdsFluxo.FieldByName('COMPRAVENDA').AsFloat        := 0;
             cdsFluxo.FieldByName('RECEITAMES').AsFloat         := cdsTemp.FieldByName('RECEITALIQUIDA').AsFloat;
             cdsFluxo.FieldByName('DESPESAMES').AsFloat         := 0;
             cdsFluxo.FieldByName('RECEITALIQUIDA').AsFloat     := cdsTemp.FieldByName('RECEITALIQUIDA').AsFloat;
             cdsFluxo.Post;

             cdsTemp.Next;
           end;
         end;

      except
         on E: Exception do begin
            Result := False;
            Messageinfo := e.message;
         end;
      end;
   finally
      FreeAndNil( cdsTemp );
   end;
end;




function TCtrlMapaCota.CompletaFluxo(sNomeBilhete: string; const iTipoSegmento:Integer; const sPatroPlano:String;
                                                           const dDtIni, dDtFim: TDateTime) : Boolean;
var dFluxo : TDateTime;
    iPos, iTot : Integer;
    fVlrReaval : Extended;
begin
   Result := True;
   try
      try
         cdsMapa.DisableControls;
         cdsFluxo.DisableControls;
         cdsMapa.First;
         iPos := 1;
         iTot := cdsMapa.RecordCount;
         while not cdsMapa.Eof do begin
            DoProgresso ([sNomeBilhete, iPos, iTot, 'Montando Fluxo Diário por Empreendimento...']);

            // Busca e insere no fluxo o valor do ativo no último dia do ano anterior
            cdsReaval.Filtered := False;
            cdsReaval.Filter   := 'IDIMOVELMESTRE = ' + cdsMapa.FieldByName('IDIMOVEL').AsString + ' AND ' +
                                  'IDSEGMENTO = ' + QuotedStr(cdsMapa.FieldByName('IDSEGMENTO').AsString) + ' AND ' +
                                  'ORIGEM   = ' + cdsMapa.FieldByName('ORIGEM').AsString;
            cdsReaval.Filtered := True;

            if cdsReaval.Locate('DATAREAVALIACAO', FormatDateTime('dd/mm/yyyy', (dDtIni-1)), []) then begin
               fVlrReaval     := cdsReaval.FieldByName('ULTREAVALIA').AsFloat;

               cdsFluxo.Insert;
               cdsFluxo.FieldByName('IDIMOVELMESTRE').AsInteger := cdsMapa.FieldByName('IDIMOVEL').AsInteger;
               cdsFluxo.FieldByName('IDSEGMENTO').AsString      := cdsMapa.FieldByName('IDSEGMENTO').AsString;
               cdsFluxo.FieldByName('ORIGEM').AsInteger         := cdsMapa.FieldByName('ORIGEM').AsInteger;
               cdsFluxo.FieldByName('DATALANCTO').AsDateTime    := dDtIni-1;
               cdsFluxo.FieldByName('ATIVO').AsFloat            := fVlrReaval;
               cdsFluxo.Post;
            end;
            cdsFluxo.Filtered := False;
            cdsFluxo.Filter   := 'IDIMOVELMESTRE = ' + cdsMapa.FieldByName('IDIMOVEL').AsString + ' AND ' +
                                 'IDSEGMENTO = ' + QuotedStr(cdsMapa.FieldByName('IDSEGMENTO').AsString) + ' AND ' +
                                 'ORIGEM   = ' + cdsMapa.FieldByName('ORIGEM').AsString;
            cdsFluxo.Filtered := True;

            dFluxo := dDtIni;
            repeat
               // Busca o valor do ativo nas reavaliações
               if cdsReaval.Locate('DATAREAVALIACAO', dFluxo, []) then begin
                  fVlrReaval := cdsReaval.FieldByName('ULTREAVALIA').AsFloat;
               end;

               // Preenche e calcula a cota do dia
               if cdsFluxo.Locate('DATALANCTO',dFluxo, []) then begin
                  cdsFluxo.Edit;
               end else begin
                  cdsFluxo.Insert;
                  cdsFluxo.FieldByName('IDIMOVELMESTRE').AsInteger := cdsMapa.FieldByName('IDIMOVEL').AsInteger;
                  cdsFluxo.FieldByName('IDSEGMENTO').AsString      := cdsMapa.FieldByName('IDSEGMENTO').AsString;
                  cdsFluxo.FieldByName('ORIGEM').AsInteger         := cdsMapa.FieldByName('ORIGEM').AsInteger;
                  cdsFluxo.FieldByName('DATALANCTO').AsDateTime    := dFluxo;
               end;

               cdsFluxo.FieldByName('ATIVO').AsFloat    := fVlrReaval;
               cdsFluxo.Post;

               dFluxo := dFluxo + 1;
            until dFluxo > dDtFim;

            Inc(iPos);
            cdsMapa.Next;
         end;
      except
         on E: Exception do begin
            Result := False;
         end;
      end;
   finally;
      DoProgresso ([sNomeBilhete, -1, -1, '']);
      cdsFluxo.Filtered := False;
      cdsFluxo.Filter   := '';
      cdsMapa.First;
      cdsFluxo.First;
      cdsMapa.EnableControls;
      cdsFluxo.EnableControls;
   end;
end;



function TCtrlMapaCota.TotalizaFluxoSegmento(sNomeBilhete: string): Boolean;
var dFluxo : TDateTime;
    iPos, iTot : Integer;
    fVlrAtivo, fVlrCV, fVlrRec, fVlrDesp, fVlrLiq : Extended;
    sIndexFluxo, sSegmento : String;
    cdsMapaTemp : TCMClientDataSet;
begin
   Result := True;
   try
      try
         cdsMapa.DisableControls;
         cdsFluxo.DisableControls;
         cdsFluxoSeg.DisableControls;
         cdsMapa.First;
         cdsMapaTemp := TCMClientDataSet.Create(nil);
         cdsMapaTemp.Data := cdsMapa.Data;

         // Reorderna o Fluxo já criado, para totalizar o segmento por data
         sIndexFluxo := cdsFluxo.IndexFieldNames;
         cdsFluxo.IndexFieldNames := 'IDSEGMENTO;DATALANCTO';

         iPos := 1;
         iTot := cdsMapaTemp.RecordCount;
         while not cdsMapaTemp.Eof do begin

            DoProgresso ([sNomeBilhete, iPos, iTot, 'Calculando Evolução da Cota por Segmento da Carteira...']);
            sSegmento := cdsMapaTemp.FieldByName('IDSEGMENTO').AsString;

            // Filtra o fluxo do segmento
            cdsFluxo.Filtered := False;
            cdsFluxo.Filter   := 'IDSEGMENTO = ' + QuotedStr(sSegmento) + ' AND ' +
                                 'ORIGEM   = ' + cdsMapaTemp.FieldByName('ORIGEM').AsString;
            cdsFluxo.Filtered := True;
            cdsFluxo.First;

            while not cdsFluxo.Eof do begin
               fVlrAtivo := 0;
               fVlrCV    := 0;
               fVlrRec   := 0;
               fVlrDesp  := 0;
               fVlrLiq   := 0;
               dFluxo    := cdsFluxo.FieldByName('DATALANCTO').AsDateTime;
               while (cdsFluxo.FieldByName('DATALANCTO').AsDateTime = dFluxo) and (not cdsFluxo.Eof) do begin
                  fVlrAtivo := fVlrAtivo + cdsFluxo.FieldByName('ATIVO').AsFloat;
                  fVlrCV    := fVlrCV    + cdsFluxo.FieldByName('COMPRAVENDA').AsFloat;
                  fVlrRec   := fVlrRec   + cdsFluxo.FieldByName('RECEITAMES').AsFloat;
                  fVlrDesp  := fVlrDesp  + cdsFluxo.FieldByName('DESPESAMES').AsFloat;
                  fVlrLiq   := fVlrLiq   + cdsFluxo.FieldByName('RECEITALIQUIDA').AsFloat;
                  cdsFluxo.Next;
               end;

               cdsFluxoSeg.Append;
               cdsFluxoSeg.FieldByName('IDSEGMENTO').AsString    := cdsMapaTemp.FieldByName('IDSEGMENTO').AsString;
               cdsFluxoSeg.FieldByName('ORIGEM').AsString        := cdsMapaTemp.FieldByName('ORIGEM').AsString;
               cdsFluxoSeg.FieldByName('DATALANCTO').AsDateTime  := dFluxo;
               cdsFluxoSeg.FieldByName('ATIVO').AsFloat          := fVlrAtivo;
               cdsFluxoSeg.FieldByName('COMPRAVENDA').AsFloat    := fVlrCV;
               cdsFluxoSeg.FieldByName('RECEITAMES').AsFloat     := fVlrRec;
               cdsFluxoSeg.FieldByName('DESPESAMES').AsFloat     := fVlrDesp;
               cdsFluxoSeg.FieldByName('RECEITALIQUIDA').AsFloat := fVlrLiq;
               cdsFluxoSeg.Post;
            end;

            while (cdsMapaTemp.FieldByName('IDSEGMENTO').AsString = sSegmento) and (not cdsMapaTemp.Eof) do begin
               Inc(iPos);
               cdsMapaTemp.Next;
            end;
         end;
      except
         on E: Exception do begin
            Result := False;
         end;
      end;
   finally;
      DoProgresso ([sNomeBilhete, -1, -1, '']);
      cdsFluxo.Filtered := False;
      cdsFluxo.Filter   := '';
      cdsFluxo.IndexFieldNames := sIndexFluxo;
      cdsMapa.First;
      cdsFluxo.First;
      cdsFluxoSeg.First;
      cdsMapa.EnableControls;
      cdsFluxo.EnableControls;
      cdsFluxoSeg.EnableControls;
      FreeAndNil( cdsMapaTemp );
   end;
end;



function TCtrlMapaCota.TotalizaFluxoGeral(sNomeBilhete: string): Boolean;
var dFluxo : TDateTime;
    iPos, iTot : Integer;
    fVlrAtivo, fVlrCV, fVlrRec, fVlrDesp, fVlrLiq : Extended;
    sIndexFluxo, sSegmento : String;
begin
   Result := True;
   try
      try
         cdsFluxoSeg.DisableControls;
         cdsFluxoTot.DisableControls;

         // Reorderna o Fluxo já criado, para totalizar o segmento por data
         sIndexFluxo := cdsFluxoSeg.IndexFieldNames;
         cdsFluxoSeg.IndexFieldNames := 'DATALANCTO';

         iPos := 1;
         iTot := cdsFluxoSeg.RecordCount;

         while not cdsFluxoSeg.Eof do begin
            DoProgresso ([sNomeBilhete, iPos, iTot, 'Calculando Evolução da Cota Geral da Carteira...']);
            fVlrAtivo := 0;
            fVlrCV    := 0;
            fVlrRec   := 0;
            fVlrDesp  := 0;
            fVlrLiq   := 0;
            dFluxo    := cdsFluxoSeg.FieldByName('DATALANCTO').AsDateTime;
            while (cdsFluxoSeg.FieldByName('DATALANCTO').AsDateTime = dFluxo) and (not cdsFluxoSeg.Eof) do begin
               fVlrAtivo := fVlrAtivo + cdsFluxoSeg.FieldByName('ATIVO').AsFloat;
               fVlrCV    := fVlrCV    + cdsFluxoSeg.FieldByName('COMPRAVENDA').AsFloat;
               fVlrRec   := fVlrRec   + cdsFluxoSeg.FieldByName('RECEITAMES').AsFloat;
               fVlrDesp  := fVlrDesp  + cdsFluxoSeg.FieldByName('DESPESAMES').AsFloat;
               fVlrLiq   := fVlrLiq   + cdsFluxoSeg.FieldByName('RECEITALIQUIDA').AsFloat;

               Inc( iPos );
               cdsFluxoSeg.Next;
            end;

            cdsFluxoTot.Append;
            cdsFluxoTot.FieldByName('DATALANCTO').AsDateTime  := dFluxo;
            cdsFluxoTot.FieldByName('ATIVO').AsFloat          := fVlrAtivo;
            cdsFluxoTot.FieldByName('COMPRAVENDA').AsFloat    := fVlrCV;
            cdsFluxoTot.FieldByName('RECEITAMES').AsFloat     := fVlrRec;
            cdsFluxoTot.FieldByName('DESPESAMES').AsFloat     := fVlrDesp;
            cdsFluxoTot.FieldByName('RECEITALIQUIDA').AsFloat := fVlrLiq;
            cdsFluxoTot.Post;
         end;
      except
         on E: Exception do begin
            Result := False;
         end;
      end;
   finally;
      DoProgresso ([sNomeBilhete, -1, -1, '']);
      cdsFluxoSeg.Filtered := False;
      cdsFluxoSeg.Filter   := '';
      cdsFluxoSeg.IndexFieldNames := sIndexFluxo;
      cdsFluxoSeg.First;
      cdsFluxoTot.First;
      cdsFluxoSeg.EnableControls;
      cdsFluxoTot.EnableControls;
   end;
end;



function TCtrlMapaCota.CalculaCota(sNomeBilhete: string; const sTipo:String; const dDtIni:TDateTime; const iMoedaReal, iMoedaAtuarial: Integer;
                                   const fPercAtuarial:Extended; var cdsFluxoCota: TCMClientDataSet): Boolean;
var dFluxo, dDtIniMes : TDateTime;
    iPos, iTot : Integer;
    fVlrFechamento, fVlrCota, fVlrCotaReal : Extended;
    fVarAnoNom, fVarMesNom, fVarAnoReal, fVarMesReal, fVarAnoAtu, fVarMesAtu : Extended;
    fCotaIniMes, fFatorAno, fFatorMes : Extended;
    iDia, iAno, iMes : word;
    bPrimeiroDia : Boolean;
    sSegmento, sIndexFluxo : String;
    iIdImovel, iOrigem: Integer;
begin
   Result := True;
   try
      try
         cdsFluxoCota.DisableControls;

         // Reorderna o Fluxo já criado, para totalizar o segmento por data
         sIndexFluxo := cdsFluxoCota.IndexFieldNames;
         if sTipo = 'IMO' then cdsFluxoCota.IndexFieldNames := 'IDSEGMENTO;IDIMOVELMESTRE;DATALANCTO';
         if sTipo = 'SEG' then cdsFluxoCota.IndexFieldNames := 'IDSEGMENTO;DATALANCTO';
         if sTipo = 'TOT' then cdsFluxoCota.IndexFieldNames := 'DATALANCTO';

         iPos := 1;
         iTot := cdsFluxoCota.RecordCount;
         while not cdsFluxoCota.Eof do begin
            if sTipo =  'IMO' then DoProgresso ([sNomeBilhete, iPos, iTot, 'Calculando Evolução diária da Cota por Empreendimento...']);
            if sTipo =  'SEG' then DoProgresso ([sNomeBilhete, iPos, iTot, 'Calculando Evolução diária da Cota por Segmento...']);
            if sTipo =  'TOT' then DoProgresso ([sNomeBilhete, iPos, iTot, 'Calculando Evolução diária da Cota geral da Carteira...']);

            bPrimeiroDia := True;
            fVlrCota        := fCotaInicial;
            fCotaIniMes     := fCotaInicial;

            sSegmento := cdsFluxoCota.FieldByName('IDSEGMENTO').AsString;
            iIdImovel := cdsFluxoCota.FieldByName('IDIMOVELMESTRE').AsInteger;
            iOrigem   := cdsFluxoCota.FieldByName('ORIGEM').AsInteger;
            while ( (sTipo = 'TOT') and (not cdsFluxoCota.Eof) )  or
                  ( (sTipo = 'SEG') and (cdsFluxoCota.FieldByName('IDSEGMENTO').AsString = sSegmento)
                                    and (not cdsFluxoCota.Eof) )  or
                  ( (sTipo = 'IMO') and (cdsFluxoCota.FieldByName('IDSEGMENTO').AsString = sSegmento)
                                    and (cdsFluxoCota.FieldByName('IDIMOVELMESTRE').AsInteger = iIdImovel)
                                    and (not cdsFluxoCota.Eof) ) do begin

               cdsFluxoCota.Edit;

               if bPrimeiroDia then begin
                  fVlrFechamento := cdsFluxoCota.FieldByName('ATIVO').AsFloat / fVlrCota;
                  bPrimeiroDia   := False;
                  cdsFluxoCota.FieldByName('VLRCOTA').AsFloat          := fVlrCota;
                  cdsFluxoCota.FieldByName('FECHAMENTO').AsFloat       := fVlrFechamento;
               end else begin

                  cdsFluxoCota.FieldByName('ABERTURA').AsFloat := fVlrFechamento;

                  // Cota = (Ativo - C/V + Liquido) / Abertura
                  if cdsFluxoCota.FieldByName('ABERTURA').AsFloat > 0 then begin
                     fVlrCota := ( cdsFluxoCota.FieldByName('ATIVO').AsFloat - cdsFluxoCota.FieldByName('COMPRAVENDA').AsFloat +
                                   cdsFluxoCota.FieldByName('RECEITALIQUIDA').AsFloat ) / cdsFluxoCota.FieldByName('ABERTURA').AsFloat;
                  end;

                  // Fechamento = Abertura - (Liquido / Vlr Cota do dia) + ( C/V / Vlr Cota do Dia)
                  if fVlrCota <> 0 then begin
                     fVlrFechamento := cdsFluxoCota.FieldByName('ABERTURA').AsFloat -
                                     ( cdsFluxoCota.FieldByName('RECEITALIQUIDA').AsFloat / fVlrCota ) +
                                     ( cdsFluxoCota.FieldByName('COMPRAVENDA').AsFloat / fVlrCota );
                  end;

                  if fCotaInicial <> 0 then fVarAnoNom := ((fVlrCota / fCotaInicial) - 1) * 100;
                  if fCotaIniMes  <> 0 then fVarMesNom := ((fVlrCota / fCotaIniMes ) - 1) * 100;

                  // Arredonda valores conforme casas da especificação
                  fVlrCota       := ComunsImobiliario.Arredonda( fVlrCota, 6 );
                  fVlrFechamento := ComunsImobiliario.Arredonda( fVlrFechamento, 6 );
                  fVarAnoNom     := ComunsImobiliario.Arredonda( fVarAnoNom, 2 );
                  fVarMesNom     := ComunsImobiliario.Arredonda( fVarMesNom, 2 );

                  cdsFluxoCota.FieldByName('VLRCOTA').AsFloat    := fVlrCota;
                  cdsFluxoCota.FieldByName('FECHAMENTO').AsFloat := fVlrFechamento;
                  cdsFluxoCota.FieldByName('VARANONOM').AsFloat  := fVarAnoNom;
                  cdsFluxoCota.FieldByName('VARMESNOM').AsFloat  := fVarMesNom;

                  // Calcula a Rentabilidade Real e Atuarial
                  dFluxo := cdsFluxoCota.FieldByName('DATALANCTO').AsDateTime;
                  DecodeDate(dFluxo, iAno, iMes, iDia);
                  if dFluxo = DiasUteis.UltDiaMes(iAno,iMes) then begin

                     // Determina primeiro dia do mês para verificar a taxa mensal
                     dDtIniMes := EncodeDate(iAno,iMes,1);

                     // Calcula a variação Real
                     fFatorAno    := CtrlImobiliario.FatorCorrecao(iMoedaReal,dDtIni,dFluxo,False);
                     fFatorMes    := CtrlImobiliario.FatorCorrecao(iMoedaReal,dDtIniMes,dFluxo,False);
                     // Ajusta para não dividir por zero
                     if fFatorAno    = 0 then fFatorAno := 1;
                     if fFatorMes    = 0 then fFatorMes := 1;
                     if fCotaIniMes  = 0 then fCotaIniMes  := fVlrCota;
                     if fCotaInicial = 0 then fCotaInicial := fVlrCota;

                     // Calcula a variação Real Mensal
                     fVlrCotaReal := ((fVlrCota / fCotaIniMes) * 100) / fFatorMes;
                     fVlrCotaReal := ComunsImobiliario.Arredonda( fVlrCotaReal, 6 );
                     fVarMesReal  := ((fVlrCotaReal / 100) - 1) * 100;
                     fVarMesReal  := ComunsImobiliario.Arredonda( fVarMesReal, 2 );

                     // Calcula a variação Real Anual
                     fVlrCotaReal := ((fVlrCota / fCotaInicial) * 100) / fFatorAno;
                     fVlrCotaReal := ComunsImobiliario.Arredonda( fVlrCotaReal, 6 );
                     fVarAnoReal  := ((fVlrCotaReal / 100) - 1) * 100;
                     fVarAnoReal  := ComunsImobiliario.Arredonda( fVarAnoReal, 2 );

                     // Calcula a variação Atuarial Mensal
                     fVlrCotaReal := ((fVlrCota / fCotaIniMes) * 100) / (fFatorMes * ( Power((1 + (fPercAtuarial / 100)),(1/12)) ));
                     fVlrCotaReal := ComunsImobiliario.Arredonda( fVlrCotaReal, 6 );
                     fVarMesAtu  := ((fVlrCotaReal / 100) - 1) * 100;
                     fVarMesAtu  := ComunsImobiliario.Arredonda( fVarMesAtu, 2 );

                     // Calcula a variação Atuarial Anual
                     fVlrCotaReal := ((fVlrCota / fCotaInicial) * 100) / (fFatorAno * ( Power((1 + (fPercAtuarial / 100)),(1/12)) ));
                     fVlrCotaReal := ComunsImobiliario.Arredonda( fVlrCotaReal, 6 );
                     fVarAnoAtu  := ((fVlrCotaReal / 100) - 1) * 100;
                     fVarAnoAtu  := ComunsImobiliario.Arredonda( fVarAnoAtu, 2 );

                     cdsFluxoCota.FieldByName('VARANOREAL').AsFloat := fVarAnoReal;
                     cdsFluxoCota.FieldByName('VARMESREAL').AsFloat := fVarMesReal;
                     cdsFluxoCota.FieldByName('VARANOATU').AsFloat  := fVarAnoAtu;
                     cdsFluxoCota.FieldByName('VARMESATU').AsFloat  := fVarMesAtu;

                     // Guarda o valor da última cota do mês para achar a rentabilidade mensal
                     fCotaIniMes     := fVlrCota;
                  end;
               end;

               cdsFluxoCota.Post;

               Inc(iPos);
               cdsFluxoCota.Next;
            end; // end - while do segmento

            // Atualiza a rentabilidade no cdsMapa
            cdsMapa.First;
            cdsMapa.Filtered := False;
            if sTipo = 'IMO' then begin
               cdsMapa.Filter   := 'IDSEGMENTO = ' + QuotedStr(sSegmento) + ' AND ' +
                                   'IDIMOVEL   = ' + IntToStr(iIdImovel)  + ' AND ' +
                                   'ORIGEM     = ' + IntToStr(iOrigem);
            end;
            if sTipo = 'SEG' then begin
               cdsMapa.Filter   := 'IDSEGMENTO = ' + QuotedStr(sSegmento);
            end;
            if sTipo = 'TOT' then begin
               cdsMapa.Filter   := '';
            end;

            cdsMapa.Filtered := True;
            cdsMapa.First;
            while not cdsMapa.Eof do begin
               cdsMapa.Edit;

               if sTipo = 'IMO' then begin
                  cdsMapa.FieldByName('RENTAB_MES_NOMINAL').AsFloat  := fVarMesNom;
                  cdsMapa.FieldByName('RENTAB_ANO_NOMINAL').AsFloat  := fVarAnoNom;
                  cdsMapa.FieldByName('RENTAB_MES_REAL').AsFloat     := fVarMesReal;
                  cdsMapa.FieldByName('RENTAB_ANO_REAL').AsFloat     := fVarAnoReal;
                  cdsMapa.FieldByName('RENTAB_MES_ATUARIAL').AsFloat := fVarMesAtu;
                  cdsMapa.FieldByName('RENTAB_ANO_ATUARIAL').AsFloat := fVarAnoAtu;
               end;

               if sTipo = 'SEG' then begin
                  cdsMapa.FieldByName('TOTRENTAB_MES_NOMINAL').AsFloat  := fVarMesNom;
                  cdsMapa.FieldByName('TOTRENTAB_MES_REAL').AsFloat     := fVarMesReal;
                  cdsMapa.FieldByName('TOTRENTAB_MES_ATUARIAL').AsFloat := fVarMesAtu;
                  cdsMapa.FieldByName('TOTRENTAB_ANO_NOMINAL').AsFloat  := fVarAnoNom;
                  cdsMapa.FieldByName('TOTRENTAB_ANO_REAL').AsFloat     := fVarAnoReal;
                  cdsMapa.FieldByName('TOTRENTAB_ANO_ATUARIAL').AsFloat := fVarAnoAtu;
               end;

               if sTipo = 'TOT' then begin
                  cdsMapa.FieldByName('FINRENTAB_MES_NOMINAL').AsFloat  := fVarMesNom;
                  cdsMapa.FieldByName('FINRENTAB_MES_REAL').AsFloat     := fVarMesReal;
                  cdsMapa.FieldByName('FINRENTAB_MES_ATUARIAL').AsFloat := fVarMesAtu;
                  cdsMapa.FieldByName('FINRENTAB_ANO_NOMINAL').AsFloat  := fVarAnoNom;
                  cdsMapa.FieldByName('FINRENTAB_ANO_REAL').AsFloat     := fVarAnoReal;
                  cdsMapa.FieldByName('FINRENTAB_ANO_ATUARIAL').AsFloat := fVarAnoAtu;
               end;

               cdsMapa.Post;
               cdsMapa.Next;
            end;

         end;   // end - while geral

      except
         on E: Exception do begin
            Result := False;
         end;
      end;
   finally;
      DoProgresso ([sNomeBilhete, -1, -1, '']);
      cdsFluxo.Filtered := False;
      cdsFluxo.Filter   := '';
      cdsFluxo.First;
      cdsFluxo.EnableControls;
      cdsMapa.Filtered := False;
      cdsMapa.Filter   := '';
      cdsMapa.First;
      cdsMapa.EnableControls;
      cdsFluxoCota.IndexFieldNames := sIndexFluxo;
      cdsFluxoCota.Filtered := False;
      cdsFluxoCota.Filter   := '';
      cdsFluxoCota.First;
      cdsFluxoCota.EnableControls;
   end;
end;


function TCtrlMapaCota.MontaVlrAtivo(const iTipoSegmento: Integer; const sPatroPlano: String; const dDtIni, dDtFim: TDateTime): Boolean;
var cdsTemp, cdsData : TCMClientDataSet;
    sSql, sIntervalo : String;
    bPrimeiraCota : Boolean;
    dDataBase : TDateTime;

begin
   Result := True;
   try
      try
         cdsReaval.Data := LookupReaval(iTipoSegmento, sPatroPlano, dDtFim);

         // Busca as reavaliações no último dia do ano anterior
         cdsTemp := TCMClientDataSet.Create(nil);
         cdsData := TCMClientDataSet.Create(nil);
         cdsTemp.Data := LookupReaval(iTipoSegmento, sPatroPlano, dDtIni);
         while not cdsTemp.Eof do begin
            cdsReaval.Insert;
            cdsReaval.FieldByName('IDSEGMENTO').AsString        := cdsTemp.FieldByName('IDSEGMENTO').AsString;
            cdsReaval.FieldByName('IDIMOVELMESTRE').AsInteger   := cdsTemp.FieldByName('IDIMOVELMESTRE').AsInteger;
            cdsReaval.FieldByName('ORIGEM').AsInteger           := cdsTemp.FieldByName('ORIGEM').AsInteger;
            cdsReaval.FieldByName('DATAREAVALIACAO').AsDateTime := (dDtIni);
            cdsReaval.FieldByName('ULTREAVALIA').AsFloat        := cdsTemp.FieldByName('ULTREAVALIA').AsFloat;
            cdsReaval.Post;
            cdsTemp.Next;
         end;

         // Verifica as movimentações do ativo no período
         sIntervalo := ' BETWEEN TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dDtIni + 1)) + ',''DD/MM/YYYY'') AND '+#13+
                       '         TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dDtFim    )) + ',''DD/MM/YYYY'')     '+#13;

         sSql := 'SELECT DISTINCT DATA_BASE                     '+#13+
                 '  FROM ( SELECT DISTINCT EVIDATA AS DATA_BASE '+#13+
                 '           FROM EVENTOIMOVEL                  '+#13+
                 '          WHERE FLGTIPOEVENTO IN(''CA'',''BD'',''BR'') '+#13+
                 '            AND EVIDATA ' + sIntervalo +
                 '          UNION        '+#13+
                 '         SELECT DISTINCT IMODATACOMPRA AS DATA_BASE '+#13+
                 '           FROM IMOVEL '+#13+
                 '          WHERE IMODATACOMPRA ' + sIntervalo +
                 '          UNION        '+#13+
                 '         SELECT DISTINCT DATAREAVALIACAO AS DATA_BASE '+#13+
                 '           FROM REAVALIAXREAVALIA '+#13+
                 '          WHERE DATAREAVALIACAO ' + sIntervalo +
                 '         )' ;
         cdsData.Data := GetDataPacket( sSql );

         cdsData.First;
         while not cdsData.Eof do begin
            cdsTemp.Data := LookupReaval(iTipoSegmento, sPatroPlano, cdsData.FieldByName('DATA_BASE').AsDateTime );
            while not cdsTemp.Eof do begin
               cdsReaval.Insert;
               cdsReaval.FieldByName('IDSEGMENTO').AsString        := cdsTemp.FieldByName('IDSEGMENTO').AsString;
               cdsReaval.FieldByName('IDIMOVELMESTRE').AsInteger   := cdsTemp.FieldByName('IDIMOVELMESTRE').AsInteger;
               cdsReaval.FieldByName('ORIGEM').AsInteger           := cdsTemp.FieldByName('ORIGEM').AsInteger;
               cdsReaval.FieldByName('DATAREAVALIACAO').AsDateTime := cdsData.FieldByName('DATA_BASE').AsDateTime;
               cdsReaval.FieldByName('ULTREAVALIA').AsFloat        := cdsTemp.FieldByName('ULTREAVALIA').AsFloat;
               cdsReaval.Post;
               cdsTemp.Next;
            end;
            cdsData.Next;
         end;

         // Adiciona reavaliações do Fundo Imobiliário - origem 3
         bPrimeiraCota := False;
         cdsTemp.Data := LookupReavalFundo(sPatroPlano, dDtFim);
         while not cdsTemp.Eof do begin
            cdsReaval.Insert;
            cdsReaval.FieldByName('IDSEGMENTO').AsString        := '-2';
            cdsReaval.FieldByName('IDIMOVELMESTRE').AsInteger   := cdsTemp.FieldByName('IDFUNDOINVEST').AsInteger;
            cdsReaval.FieldByName('ORIGEM').AsInteger           := 3;
            cdsReaval.FieldByName('DATAREAVALIACAO').AsDateTime := cdsTemp.FieldByName('DATACOTA').AsDateTime;
            cdsReaval.FieldByName('ULTREAVALIA').AsFloat        := cdsTemp.FieldByName('ULTREAVALIA').AsFloat;
            cdsReaval.Post;

            if dDtIni = cdsTemp.FieldByName('DATACOTA').AsDateTime then bPrimeiraCota := True;

            cdsTemp.Next;
         end;

         // Inclui o valor da cota no dia 01/01
         if not bPrimeiraCota then begin
            cdsTemp.First;
            cdsReaval.Insert;
            cdsReaval.FieldByName('IDSEGMENTO').AsString        := '-2';
            cdsReaval.FieldByName('IDIMOVELMESTRE').AsInteger   := cdsTemp.FieldByName('IDFUNDOINVEST').AsInteger;
            cdsReaval.FieldByName('ORIGEM').AsInteger           := 3;
            cdsReaval.FieldByName('DATAREAVALIACAO').AsDateTime := dDtIni;
            cdsReaval.FieldByName('ULTREAVALIA').AsFloat        := cdsTemp.FieldByName('ULTREAVALIA').AsFloat;
            cdsReaval.Post;
         end;

         // Adiciona reavaliações de Alienação - Saldo Devedor mensal.
         cdsMapa.Filtered := False;
         cdsMapa.Filter   := 'ORIGEM = 2';
         cdsMapa.Filtered := True;
         while not cdsMapa.Eof do begin
            dDataBase := dDtIni;
            repeat
               cdsReaval.Insert;
               cdsReaval.FieldByName('IDSEGMENTO').AsString        := cdsMapa.FieldByName('IDSEGMENTO').AsString;
               cdsReaval.FieldByName('IDIMOVELMESTRE').AsInteger   := cdsMapa.FieldByName('IDIMOVEL').AsInteger;
               cdsReaval.FieldByName('ORIGEM').AsInteger           := 2;
               cdsReaval.FieldByName('DATAREAVALIACAO').AsDateTime := dDataBase;
               cdsReaval.FieldByName('ULTREAVALIA').AsFloat        := CtrlMapaTIR.CalcSaldoDevedor( cdsMapa.FieldByName('IDIMOVEL').AsInteger, -1, dDataBase );
               cdsReaval.Post;

               dDataBase := DiasUteis.SomaMeses(dDataBase,1);
            until dDataBase > dDtFim;
            cdsMapa.Next;
         end;
      except
         on E: Exception do begin
            Result := False;
         end;
      end;
   finally
      cdsMapa.Filtered := False;
      cdsMapa.Filter   := '';
      FreeAndNil( cdsTemp );
      FreeAndNil( cdsData );
   end;
end;





function TCtrlMapaCota.LookupReaval(const iTipoSegmento:Integer; const sPatroPlano:String; const dDataBase:TDateTime): OLEVariant;
var sSql, sParam, sDataBase, sAnoMes : String;
    iDia, iMes, iAno : Word;
begin
   // Define Parametros
   sParam := '';
   DecodeDate(dDataBase, iAno, iMes, iDia );
   sDataBase := QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataBase ) );
   sAnoMes   := IntToStr(iAno) + FormatFloat('00',iMes);
   if sPatroPlano <> '' then sParam := sParam + ' AND ( TO_CHAR( FT.IDPATRO ) || ''/'' || TO_CHAR( FT.IDPLANOPREV ) IN ( ' + sPatroPlano + ' ) ) ' +#13;

   sSql := ' SELECT ' + Iff( iTipoSegmento = 1, 'I.CODTIPIMOVEL', 'I.IDCARTEIRASPC' ) + ' AS IDSEGMENTO, ' +#13+
           '          I.IDIMOVELMESTRE,   ' +#13+
           '          1 AS ORIGEM,        ' +#13+
           '          MIN(DECODE(RR.DATAREAVALIACAO, NULL, I.IMODATACOMPRA, RR.DATAREAVALIACAO)) AS DATAREAVALIACAO, ' + #13 +
           '          NVL( ROUND( SUM( DECODE(RR.DATAREAVALIACAO, NULL, I.IMOVLRCOMPRA, RR.VLRREAVALIA) * FT.FATOR ), 2 ), 0 ) AS ULTREAVALIA ' + #13+
           '   FROM ' +#13+
           '          ( SELECT R.IDIMOVEL, UR.ULTREAVAL AS DATAREAVALIACAO, SUM(R.VLRREAVALIA) AS VLRREAVALIA ' +#13+
           '            FROM REAVALIAXREAVALIA R, ' +#13+
           '                ( SELECT IDIMOVEL, MAX(DATAREAVALIACAO) AS ULTREAVAL ' +#13+
           '                    FROM REAVALIAXREAVALIA ' +#13+
           '                   WHERE DATAREAVALIACAO <= ' + sDataBase +#13+
           '                   GROUP BY IDIMOVEL ) UR ' +#13+
           '          WHERE R.IDIMOVEL = UR.IDIMOVEL ' +#13+
           '            AND R.DATAREAVALIACAO = UR.ULTREAVAL ' +#13+
           '          GROUP BY R.IDIMOVEL, UR.ULTREAVAL ' +#13+
           '       ) RR,' +#13+


           '          ( SELECT   I.IDIMOVEL,        ' +#13+
           '                     I.IDIMOVELMESTRE,  ' +#13+
           '                     TI.CODTIPIMOVEL,   ' +#13+
           '                     TI.DESCTIPOIMOVEL, ' +#13+
           '                     TI.FLGTIPOINTERNO, ' +#13+
           '                     I.IMODATACOMPRA, '   +#13+
           '                     I.IMOVLRCOMPRA, '    +#13+
           '                     DECODE( I.IDCARTEIRASPC, NULL, CS1.DESCARTEIRASPC, CS2.DESCARTEIRASPC ) AS DESCARTEIRASPC,      ' +#13+
           '                     TO_CHAR( DECODE( I.IDCARTEIRASPC, NULL, TI.IDCARTEIRASPC, I.IDCARTEIRASPC ) ) AS IDCARTEIRASPC  ' +#13+
           '            FROM     IMOVEL            I,                 ' +#13+
           '                     TIPOIMOVEL        TI,                ' +#13+
           '                     CARTEIRASPC       CS1,               ' +#13+
           '                     CARTEIRASPC       CS2,               ' +#13+
           '                     ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA ' +#13+
           '                         FROM EVENTOIMOVEL                      ' +#13+
           '                        WHERE FLGTIPOEVENTO IN(''CA'',''BD'',''BR'') ' +#13+
           '                        GROUP BY IDIMOVEL                       ' +#13+
           '                     ) AL                                       ' +#13+
           '            WHERE    I.CODTIPIMOVEL    = TI.CODTIPIMOVEL        ' +#13+
           '              AND    TI.IDCARTEIRASPC  = CS1.IDCARTEIRASPC(+)   ' +#13+
           '              AND    I.IDCARTEIRASPC   = CS2.IDCARTEIRASPC(+)   ' +#13+
           '              AND    I.IDIMOVEL        = AL.IDIMOVEL(+)         ' +#13+
           '              AND    EXISTS ( SELECT 1 FROM IMOVELXBEM WHERE IDIMOVEL = I.IDIMOVEL ) ' +#13+
           '              AND    ( (AL.DTVENDA IS NOT NULL AND              ' +#13+
                                    sAnoMes + ' BETWEEN TO_CHAR(I.IMODATACOMPRA,''YYYYMM'') AND TO_CHAR(AL.DTVENDA,''YYYYMM'')) OR '+#13+
           '                       (AL.DTVENDA IS NULL AND ' + sAnoMes + ' >= TO_CHAR(I.IMODATACOMPRA,''MMYYYY'')) ) '+#13+
           '           ) I,  ' +#13+
           '          ( SELECT    PI.IDIMOVEL,                                  ' +#13+
           '                      PI.IDPATRO,                                   ' +#13+
           '                      PI.IDPLANOPREV,                               ' +#13+
           '                      DECODE( PI.FLGTIPO, ''P'', ( PI.PPIPERCENTRATEIO / 100 ), ''C'', ( PI.PPIPERCENTRATEIO / TT.TOTAL ), NULL ) AS FATOR ' +#13+
           '            FROM      PLANOPATROXIMOVEL PI,                         ' +#13+
           '                      ( SELECT   IDIMOVEL,                          ' +#13+
           '                                 SUM( PPIPERCENTRATEIO ) AS TOTAL   ' +#13+
           '                        FROM     PLANOPATROXIMOVEL                  ' +#13+
           '                        GROUP BY IDIMOVEL ) TT                      ' +#13+
           '            WHERE     PI.IDIMOVEL = TT.IDIMOVEL ) FT                ' +#13+
           ' WHERE    I.IDIMOVEL         = RR.IDIMOVEL(+)                       ' +#13+
           '   AND    I.IDIMOVEL         = FT.IDIMOVEL                          ' +#13+ sParam +#13;

   sSql := sSql +
           ' GROUP BY ' + Iff( iTipoSegmento = 1, 'I.CODTIPIMOVEL', 'I.IDCARTEIRASPC' ) + ', ' +#13+
           '          I.IDIMOVELMESTRE ' +#13+
           ' ORDER BY 1, 2 ';

   CMDebugToFile('Recupera Reavaliações...', 'RENTABCOTA.TXT');
   CMDebugToFile(sSql, 'RENTABCOTA.TXT');

   Result := GetDataPacket( sSql );
end;





function TCtrlMapaCota.LookupReavalFundo(const sPatroPlano: String; const dDataBase: TDateTime): OLEVariant;
var sSql, sDataBase, sDataIni : String;
    iAno, iMes, iDia : Word;
    dDataIni : TDateTime;
begin
   // Define Parametros
   DecodeDate(dDataBase, iAno, iMes, iDia );
   sDataBase := QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataBase ) );
   dDataIni  := EncodeDate(iAno,1,1) - 1;
   sDataIni  := QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataIni ) );

   sSql := ' SELECT   VS.IDFUNDOINVEST, '+#13+
           '          VS.DATACOTA,      '+#13+
           '          NVL( ROUND( SUM( VS.ULTREAVALIA ) , 2 ), 0) AS ULTREAVALIA '+#13+
           ' FROM     ( SELECT HF.IDFUNDOINVEST,     '+#13+
           '                   HF.DESCFUNDOINVEST,   '+#13+
           '                   PP.IDPLANPREVCTBPATR, '+#13+
           '                   PP.IDPATRO,           '+#13+
           '                   PP.IDPLANOPREV,       '+#13+
           '                   VL.DATACOTA,          '+#13+
           '                   VL.ULTREAVALIA        '+#13+
           '            FROM   ( SELECT HF1.IDFUNDOINVEST,  '+#13+
           '                            HF1.DESCFUNDOINVEST '+#13+
           '                     FROM   HISTFUNDOINVEST HF1 '+#13+
           '                     WHERE  HF1.DTAVIGENCIA = ( SELECT MAX( HF2.DTAVIGENCIA ) '+#13+
           '                                                FROM   HISTFUNDOINVEST HF2    '+#13+
           '                                                WHERE  HF2.IDFUNDOINVEST = HF1.IDFUNDOINVEST '+#13+
           '                                                  AND  HF2.DTAVIGENCIA <= ' + sDataBase + ' ) ) HF, '+#13+
           '                   ( SELECT PA.IDPLANPREVCTBPATR,   '+#13+
           '                            PA.IDPATRO,             '+#13+
           '                            PA.IDPLANOPREV          '+#13+
           '                     FROM   PESSOA PE,              '+#13+
           '                            PLANPREVCONTABPATRO PA, '+#13+
           '                            PLANPREVCONTABIL PL     '+#13+
           '                     WHERE  ( PA.IDPATRO     = PE.IDPESSOA(+) ) AND   '+#13+
           '                            ( PA.IDPLANOPREV = PL.IDPLANOPREV ) ) PP, '+#13+
           '                   ( SELECT H.IDFUNDOINVEST,     '+#13+
           '                            H.IDPLANPREVCTBPATR, '+#13+
           '                            H.SALDOQTDCOTAS, CII.DATACOTA, CII.VLRCOTA,      '+#13+
           '                            ( H.SALDOQTDCOTAS * CII.VLRCOTA ) AS ULTREAVALIA '+#13+
           '                     FROM ( SELECT CI.IDFUNDOINVEST,    '+#13+
           '                                     CI.VLRCOTA,        '+#13+
           '                                     CI.DATACOTA        '+#13+
           '                              FROM   COTAINTEGRFUNDO CI '+#13+
           '                              WHERE  ( CI.DATACOTA || CI.IDFUNDOINVEST IN ( SELECT   CI1.DATACOTA || CI1.IDFUNDOINVEST '+#13+
           '                                                                            FROM     COTAINTEGRFUNDO CI1 '+#13+
           '                                                                            WHERE    ( CI1.DATACOTA BETWEEN TO_DATE( ' + sDataIni + ', ''DD/MM/YYYY'' ) AND TO_DATE( ' + sDataBase + ', ''DD/MM/YYYY'' ) ) AND '+#13+
           '                                                                                     ( CI1.IDTIPOCOTA IS NULL ) '+#13+
           '                                                                            UNION '+#13+
           '                                                                            SELECT   MAX(CI1.DATACOTA) || CI1.IDFUNDOINVEST '+#13+
           '                                                                            FROM     COTAINTEGRFUNDO CI1 '+#13+
           '                                                                            WHERE    ( CI1.DATACOTA <= TO_DATE( ' + sDataIni + ', ''DD/MM/YYYY'' ) ) AND '+#13+
           '                                                                                     ( CI1.IDTIPOCOTA IS NULL ) '+#13+
           '                                                                            GROUP BY CI1.IDFUNDOINVEST '+#13+
           '                                                                            ) ) ) CII, '+#13+
           '                            ( SELECT   SUM(HI.SALDOQTDCOTAS) AS SALDOQTDCOTAS, '+#13+
           '                                       HI.IDFUNDOINVEST,    '+#13+
           '                                       HI.IDPLANPREVCTBPATR '+#13+
           '                              FROM     HISTFUNDO HI         '+#13+
           '                              WHERE    ( HI.IDHISTFUNDO IN ( SELECT   MAX( H2.IDHISTFUNDO ) AS IDHISTFUNDO '+#13+
           '                                                             FROM     HISTFUNDO H2,   '+#13+
           '                                                                      TIPOOPERACAO TP '+#13+
           '                                                             WHERE    ( H2.DATAMOVFUNDO = ( SELECT   MAX( H3.DATAMOVFUNDO ) AS IDHISTFUNDO '+#13+
           '                                                                                            FROM     HISTFUNDO H3,   '+#13+
           '                                                                                                     TIPOOPERACAO TP '+#13+
           '                                                                                            WHERE    ( H3.DATAMOVFUNDO < TO_DATE( ' + sDataBase + ', ''DD/MM/YYYY'' ) ) AND '+#13+
           '                                                                                                     ( H3.TIPMOVFUNDO <> ''PIR'' ) AND    '+#13+
           '                                                                                                     ( TP.NATUREZAOPERACAO <> ''R'' ) AND '+#13+
           '                                                                                                     ( TP.IDTIPOOPERACAO <> -43 ) AND     '+#13+
           '                                                                                                     ( H3.IDTIPOOPERACAO = TP.IDTIPOOPERACAO ) AND '+#13+
           '                                                                                                     ( H3.IDHISTFUNDO = H2.IDHISTFUNDO ) '+#13+
           '                                                                                            GROUP BY H3.IDFUNDOINVEST,        '+#13+
           '                                                                                                     H3.IDPLANPREVCTBPATR,    '+#13+
           '                                                                                                     H3.DATAAPLICACAO ) ) AND '+#13+
           '                                                                      ( H2.TIPMOVFUNDO <> ''PIR'' ) AND         '+#13+
           '                                                                      ( TP.NATUREZAOPERACAO <> ''R'' ) AND      '+#13+
           '                                                                      ( TP.IDTIPOOPERACAO <> -43 ) AND          '+#13+
           '                                                                      ( H2.IDTIPOOPERACAO = TP.IDTIPOOPERACAO ) '+#13+
           '                                                             GROUP BY H2.IDFUNDOINVEST,        '+#13+
           '                                                                      H2.IDPLANPREVCTBPATR,    '+#13+
           '                                                                      H2.DATAAPLICACAO ) ) AND '+#13+
           '                                       ( HI.SALDOQTDCOTAS > 0 )            '+#13+
           '                              GROUP BY HI.IDFUNDOINVEST,                   '+#13+
           '                                       HI.IDPLANPREVCTBPATR ) H            '+#13+
           '                     WHERE ( H.IDFUNDOINVEST = CII.IDFUNDOINVEST(+) ) ) VL '+#13+
           '            WHERE  HF.IDFUNDOINVEST     = VL.IDFUNDOINVEST                 '+#13+
           '              AND  VL.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR  ) VS       '+#13+
           ' WHERE TO_CHAR( VS.IDPATRO ) || ''/'' || TO_CHAR( VS.IDPLANOPREV ) IN ( ' + sPatroPlano + ' )  '+#13+
           ' GROUP BY VS.IDFUNDOINVEST, '+#13+
           '          VS.DATACOTA ' +#13+
           ' ORDER BY VS.DATACOTA ';

   CMDebugToFile('Recupera Reavaliações de Fundos ...', 'RENTABCOTA.TXT');
   CMDebugToFile(sSql, 'RENTABCOTA.TXT');

   Result := GetDataPacket( sSql );
end;


function TCtrlMapaCota.LookupMapa(const iMes, iAno, iSegmento, iIdEmpresa,
                                        iIdMoedaCaf, iIdPaisCaf: Integer;
                                  const sPatroPlano:String ): OleVariant;
var
  sSQL : string;
  sIni, sFim, sIniAno, sAnt, sAno : string;
  dDtIni, dDtFim : TDateTime;
begin
  dDtIni  := EncodeDate( iAno, iMes, 1 );
  dDtFim  := DiasUteis.UltDiaMes( iAno, iMes );

  sIni    := QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDtIni      ) );
  sFim    := QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDtFim      ) );
  sAnt    := QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDtIni - 1  ) );
  sIniAno := QuotedStr( '01/01/' + FormatDateTime( 'yyyy', dDtIni ) );
  sAno    := FormatDateTime( 'yyyy', dDtIni );

  sSql :=
   ' SELECT   1 AS ORDEM,         '+#13+
   Iff( iSegmento = 1, 'I.DESCTIPOIMOVEL', 'I.DESCARTEIRASPC' ) + ' AS SEGMENTO,  '+#13+
   '          IM.IMONOME AS IMOVEL_MESTRE,                                        '+#13+
   Iff( iSegmento = 1, 'I.CODTIPIMOVEL', 'I.IDCARTEIRASPC' ) + ' AS IDSEGMENTO,   '+#13+
   '          IM.IDIMOVEL,        '+#13+
   '          I.FLGTIPOINTERNO,   '+#13+
   '          1 AS ORIGEM,        '+#13+
   '          NVL( ROUND( SUM( CM.SUMVALCTB * FT.FATOR ) / 1000, 2 ), 0 ) AS VALOR_CONTABIL, '+#13+
   '          NVL( ROUND( SUM( RR.VLRREAVALIA * FT.FATOR ) / 1000, 2 ), 0 ) AS ULTREAVALIA,  '+#13+
   '          NVL( ROUND( SUM( ( DECODE( RM.TOT_RECEBIDO, NULL, 0, RM.TOT_RECEBIDO ) - DECODE( RM.TOT_PAGO, NULL, 0, RM.TOT_PAGO ) ) * FT.FATOR ) / 1000, 2), 0 ) AS RECEITA_LIQUIDA_MES, ' +
   '          NVL( ROUND( SUM( ( DECODE( RA.TOT_RECEBIDO, NULL, 0, RA.TOT_RECEBIDO ) - DECODE( RA.TOT_PAGO, NULL, 0, RA.TOT_PAGO ) ) * FT.FATOR ) / 1000, 2), 0 ) AS RECEITA_LIQUIDA_ANO, ' +
   '          ''Imóvel Mestre'' as TITULO, '+#13+
   '          0 AS RENTAB_MES_NOMINAL,     '+#13+
   '          0 AS RENTAB_MES_REAL,        '+#13+
   '          0 AS RENTAB_MES_ATUARIAL,    '+#13+
   '          0 AS RENTAB_ANO_NOMINAL,     '+#13+
   '          0 AS RENTAB_ANO_REAL,        '+#13+
   '          0 AS RENTAB_ANO_ATUARIAL,    '+#13+
   '          0 AS ULTREAVALANOANT,        '+#13+
   '          0 AS ULTREAVALMESANT,        '+#13+
   '          0 AS ULTREAVAL_NOMINAL,      '+#13+
   '          0 AS ULTREAVAL_REAL,         '+#13+
   '          0 AS ULTREAVAL_ATUARIAL,     '+#13+
   '          0 AS TOTRENTAB_MES_NOMINAL,  '+#13+
   '          0 AS TOTRENTAB_MES_REAL,     '+#13+
   '          0 AS TOTRENTAB_MES_ATUARIAL, '+#13+
   '          0 AS TOTRENTAB_ANO_NOMINAL,  '+#13+
   '          0 AS TOTRENTAB_ANO_REAL,     '+#13+
   '          0 AS TOTRENTAB_ANO_ATUARIAL, '+#13+
   '          0 AS FINRENTAB_MES_NOMINAL,  '+#13+
   '          0 AS FINRENTAB_MES_REAL,     '+#13+
   '          0 AS FINRENTAB_MES_ATUARIAL, '+#13+
   '          0 AS FINRENTAB_ANO_NOMINAL,  '+#13+
   '          0 AS FINRENTAB_ANO_REAL,     '+#13+
   '          0 AS FINRENTAB_ANO_ATUARIAL  '+#13+
   ' FROM     IMOVEL IM,                   '+#13+
   '          ( SELECT IDIMOVEL, DATAREAVALIACAO,      '+#13+
   '                   SUM(VLRREAVALIA) AS VLRREAVALIA '+#13+
   '              FROM REAVALIAXREAVALIA               '+#13+
   '             GROUP BY IDIMOVEL, DATAREAVALIACAO    '+#13+
   '          ) RR,                                    '+#13+
   '          ( SELECT   I.IDIMOVEL,          '+#13+
   '                     I.IDIMOVELMESTRE,    '+#13+
   '                     TI.CODTIPIMOVEL,     '+#13+
   '                     TI.DESCTIPOIMOVEL,   '+#13+
   '                     TI.FLGTIPOINTERNO,   '+#13+
   '                     DECODE( I.IDCARTEIRASPC, NULL, CS1.DESCARTEIRASPC, CS2.DESCARTEIRASPC ) AS DESCARTEIRASPC,     '+#13+
   '                     TO_CHAR( DECODE( I.IDCARTEIRASPC, NULL, TI.IDCARTEIRASPC, I.IDCARTEIRASPC ) ) AS IDCARTEIRASPC '+#13+
   '            FROM     IMOVEL            I,      '+#13+
   '                     TIPOIMOVEL        TI,     '+#13+
   '                     CARTEIRASPC       CS1,    '+#13+
   '                     CARTEIRASPC       CS2     '+#13+
   '            WHERE    I.CODTIPIMOVEL    = TI.CODTIPIMOVEL  '+#13+
   '              AND    I.FLGATIVO        = 1     '+#13+
   '              AND    TI.IDCARTEIRASPC  = CS1.IDCARTEIRASPC(+)       '+#13+
   '              AND    I.IDCARTEIRASPC   = CS2.IDCARTEIRASPC(+) ) I,  '+#13+
   '          ( SELECT   I.IDIMOVEL,                                    '+#13+
   '                     SUM( DECODE(TI.FLGTIPOINTERNO, ''P'', LI.VLRLANCRECEB,   '+#13+
   '                          DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''R'', DECODE( LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TR1.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TR1.VALOR), 0 ), 0 ) ) ) AS TOT_RECEBIDO,  '+#13+
   '                     SUM( DECODE(TI.FLGTIPOINTERNO, ''P'', LI.VLRLANCPAGAR,   '+#13+
   '                          DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''P'', DECODE( LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TR1.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TR1.VALOR), 0 ), 0 ) ) ) AS TOT_PAGO       '+#13+
   '            FROM     DOCUMENTO         D,   '+#13+
   '                     LANCTODOCUM       LD,  '+#13+
   '                     LANCAMENTOSIMOVEL LI,  '+#13+
   '                     IMOVEL            I,   '+#13+
   '                     TIPOIMOVEL        TI,  '+#13+
   '                     RECBTOPAGTO       RP,  '+#13+
   '                     TIPOCUSTORECIMOV  TC,  '+#13+
   '                     ( SELECT CODDOCUMENTO, '+#13+
   '                              VALOR         '+#13+
   '                       FROM   LANCTODOCUM   '+#13+
   '                       WHERE  RTRIM( OPERACAO ) IN ( ''1'', ''2'', ''3'', ''12'' ) ) TR1   '+#13+
   '            WHERE    ( LI.CODDOCUMENTO      = D.CODDOCUMENTO(+)           ) '+#13+
   '              AND    ( D.CODDOCUMENTO       = LD.CODDOCUMENTO(+)          ) '+#13+
   '              AND    ( D.CODDOCUMENTO       = TR1.CODDOCUMENTO(+)         ) '+#13+
   '              AND    ( LD.CODDOCUMENTO      = RP.CODDOCUMENTO(+)          ) '+#13+
   '              AND    ( LD.NUMLANCTO         = RP.NUMLANCTO(+)             ) '+#13+
   '              AND    ( LI.IDTIPOCUSTORECIMO = TC.IDTIPOCUSTORECIMO        ) '+#13+
   '              AND    ( LI.IDIMOVEL          = I.IDIMOVEL                  ) '+#13+
   '              AND    ( I.CODTIPIMOVEL       = TI.CODTIPIMOVEL             ) '+#13+
   '              AND    ( TC.FLGRENTAB         = 1                           ) '+#13+
   '              AND    ( LI.IDMODULO          = 64                          ) '+#13+
   '              AND    ( ((TI.FLGTIPOINTERNO <> ''P'') AND (RP.DATABAIXA BETWEEN ' + sIni + ' AND ' + sFim + ')) OR     '+#13+
   '                       ((TI.FLGTIPOINTERNO =  ''P'') AND (LI.DATAVENCIMENTO BETWEEN ' + sIni + ' AND ' + sFim + ')) ) '+#13+
   '            GROUP BY I.IDIMOVEL ) RM,  '+#13+
   '          ( SELECT   I.IDIMOVEL,       '+#13+
   '                     SUM( DECODE(TI.FLGTIPOINTERNO, ''P'', LI.VLRLANCRECEB, '+#13+
   '                          DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''R'', DECODE( LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TR2.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TR2.VALOR), 0 ), 0 ) ) ) AS TOT_RECEBIDO, '+#13+
   '                     SUM( DECODE(TI.FLGTIPOINTERNO, ''P'', LI.VLRLANCPAGAR, '+#13+
   '                          DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''P'', DECODE( LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TR2.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TR2.VALOR), 0 ), 0 ) ) ) AS TOT_PAGO      '+#13+
   '            FROM     DOCUMENTO         D,   '+#13+
   '                     LANCTODOCUM       LD,  '+#13+
   '                     LANCAMENTOSIMOVEL LI,  '+#13+
   '                     IMOVEL            I,   '+#13+
   '                     TIPOIMOVEL        TI,  '+#13+
   '                     RECBTOPAGTO       RP,  '+#13+
   '                     TIPOCUSTORECIMOV  TC,  '+#13+
   '                     ( SELECT CODDOCUMENTO, '+#13+
   '                              VALOR         '+#13+
   '                       FROM   LANCTODOCUM   '+#13+
   '                       WHERE  RTRIM( OPERACAO ) IN ( ''1'', ''2'', ''3'', ''12'' ) ) TR2  '+#13+
   '            WHERE    ( LI.CODDOCUMENTO      = D.CODDOCUMENTO(+)           ) '+#13+
   '              AND    ( D.CODDOCUMENTO       = LD.CODDOCUMENTO(+)          ) '+#13+
   '              AND    ( D.CODDOCUMENTO       = TR2.CODDOCUMENTO(+)         ) '+#13+
   '              AND    ( LD.CODDOCUMENTO      = RP.CODDOCUMENTO(+)          ) '+#13+
   '              AND    ( LD.NUMLANCTO         = RP.NUMLANCTO(+)             ) '+#13+
   '              AND    ( LI.IDTIPOCUSTORECIMO = TC.IDTIPOCUSTORECIMO        ) '+#13+
   '              AND    ( LI.IDIMOVEL          = I.IDIMOVEL                  ) '+#13+
   '              AND    ( I.CODTIPIMOVEL       = TI.CODTIPIMOVEL             ) '+#13+
   '              AND    ( TC.FLGRENTAB         = 1                           ) '+#13+
   '              AND    ( LI.IDMODULO          = 64                          ) '+#13+
   '              AND    ( ((TI.FLGTIPOINTERNO <> ''P'') AND (RP.DATABAIXA BETWEEN ' + sIniAno + ' AND ' + sFim + ')) OR     '+#13+
   '                       ((TI.FLGTIPOINTERNO =  ''P'') AND (LI.DATAVENCIMENTO BETWEEN ' + sIniAno + ' AND ' + sFim + ')) ) '+#13+
   '            GROUP BY I.IDIMOVEL ) RA,                                                      '+#13+
   '          ( SELECT /*+ RULE */                                                             '+#13+
   '                   IXB.IDIMOVEL,                                                           '+#13+
   '                   ( ROUND(SUM(NVL(SB1.VALORG,0)) ,2) + ROUND(SUM(NVL(SB1.CMBEM,0)) ,2) -  '+#13+
   '                     ROUND(SUM(NVL(SD1.DEPLANC,0)) ,2) - ROUND(SUM(NVL(SD1.CMDEP,0)) ,2) + '+#13+
   '                     ROUND(SUM(NVL(SB1.REAVVALORG,0) + NVL(SB1.ULTREAVVALORG,0)) ,2) +     '+#13+
   '                     ROUND(SUM(NVL(SB1.REAVCMBEM,0) + NVL(SB1.ULTREAVCMBEM,0)) ,2) -       '+#13+
   '                     ROUND(SUM(NVL(SD1.REAVDEPLANC,0) + NVL(SD1.ULTREAVDEPLANC,0)) ,2) -   '+#13+
   '                     ROUND(SUM(NVL(SD1.REAVCMDEP,0) + NVL(SD1.ULTREAVCMDEP,0)) ,2)         '+#13+
   '                   ) AS SUMVALCTB                                                          '+#13+
   '              FROM SALDOCONTABBEM SB1, SLDCTBBEMXDEP SD1,                                  '+#13+
   '                   BEM B1, GRUPO G1, IMOVELXBEM IXB,                                       '+#13+
   '                   (SELECT IDBEM, IDPESSOA, MAX(DATASLDBEM) AS DATA                        '+#13+
   '                      FROM SALDOCONTABBEM                       '+#13+
   '                     WHERE DATASLDBEM <= ' + sFim                +#13+
   '                       AND MOECODIGO = ' + IntToStr(iIdMoedaCAF) +#13+
   '                       AND IDPESSOA  = ' + IntToStr(iIdEmpresa)  +#13+
   '                     GROUP BY IDBEM, IDPESSOA) MAX1             '+#13+
   '             WHERE B1.DATAINICIODEP <= ' + sFim                  +#13+
   '               AND G1.FLGIMOVEL = 1                             '+#13+
   '               AND SB1.MOECODIGO = ' + IntToStr(iIdMoedaCAF)     +#13+
   '               AND SB1.IDPESSOA  = ' + IntToStr(iIdEmpresa)      +#13+
   '               AND SD1.IDSLDCTBBEMXDEP = ' + IntToStr(iIdPaisCAF)+#13+
   '               AND B1.IDPESSOA = ' + IntToStr(iIdEmpresa)        +#13+
   '               AND B1.IDBEM = IXB.IDBEM                         '+#13+
   '               AND SB1.IDBEM = MAX1.IDBEM                       '+#13+
   '               AND SB1.IDPESSOA = MAX1.IDPESSOA                 '+#13+
   '               AND SB1.DATASLDBEM = MAX1.DATA                   '+#13+
   '               AND SB1.IDBEM = SD1.IDBEM                        '+#13+
   '               AND SB1.IDPESSOA = SD1.IDPESSOA                  '+#13+
   '               AND SB1.DATASLDBEM = SD1.DATASLDBEM              '+#13+
   '               AND SB1.MOECODIGO = SD1.MOECODIGO                '+#13+
   '               AND SB1.IDBEM = B1.IDBEM                         '+#13+
   '               AND SB1.IDPESSOA = B1.IDPESSOA                   '+#13+
   '               AND SB1.IDGRUPO = G1.IDGRUPO                     '+#13+
   '         GROUP BY IXB.IDIMOVEL  ) CM,                           '+#13+
   '          ( SELECT    PI.IDIMOVEL,    '+#13+
   '                      PI.IDPATRO,     '+#13+
   '                      PI.IDPLANOPREV, '+#13+
   '                      DECODE( PI.FLGTIPO, ''P'', ( PI.PPIPERCENTRATEIO / 100 ), ''C'', ( PI.PPIPERCENTRATEIO / TT.TOTAL ), NULL ) AS FATOR  '+#13+
   '            FROM      PLANOPATROXIMOVEL PI,            '+#13+
   '                      ( SELECT   IDIMOVEL,             '+#13+
   '                                 SUM( PPIPERCENTRATEIO ) AS TOTAL  '+#13+
   '                        FROM     PLANOPATROXIMOVEL     '+#13+
   '                        GROUP BY IDIMOVEL ) TT         '+#13+
   '            WHERE     PI.IDIMOVEL = TT.IDIMOVEL ) FT   '+#13+
   ' WHERE    ( I.IDIMOVELMESTRE = IM.IDIMOVEL          )  '+#13+
   '   AND    ( I.IDIMOVEL       = FT.IDIMOVEL          )  '+#13+
   '   AND    ( I.IDIMOVEL       = RM.IDIMOVEL    (+)   )  '+#13+
   '   AND    ( I.IDIMOVEL       = RA.IDIMOVEL    (+)   )  '+#13+
   '   AND    ( I.IDIMOVEL       = CM.IDIMOVEL    (+)   )  '+#13+
   '   AND    ( I.IDIMOVEL       = RR.IDIMOVEL    (+)   )  '+#13+
   '   AND    ( TO_CHAR( FT.IDPATRO ) || ''/'' || TO_CHAR( FT.IDPLANOPREV ) IN ( ' + sPatroPlano + ' ) )  '+#13+
   '   AND    ( RR.DATAREAVALIACAO  = (      '+#13+
   ' SELECT MAX( R2.DATAREAVALIACAO )        '+#13+
   ' FROM REAVALIAXREAVALIA R2               '+#13+
   ' WHERE R2.DATAREAVALIACAO <= ' + sAnt     +#13+
   '   AND R2.IDIMOVEL = I.IDIMOVEL ) )      '+#13+
   ' GROUP BY                                '+#13+
   Iff( iSegmento = 1, 'I.DESCTIPOIMOVEL', 'I.DESCARTEIRASPC' ) + ', '+#13+
   '          IM.IMONOME,                                            '+#13+
   Iff( iSegmento = 1, 'I.CODTIPIMOVEL', 'I.IDCARTEIRASPC' ) + ',    '+#13+
   '          IM.IDIMOVEL,      '+#13+
   '          I.FLGTIPOINTERNO  '+#13+
   ' ORDER BY 1, 2, 3           ';

  CMDebugToFile('Recupera dados dos imóveis...', 'RENTABCOTA.TXT');
  CMDebugToFile(sSql, 'RENTABCOTA.TXT');

  Result := GetDataPacket( sSql );
end;



function TCtrlMapaCota.CalculoGravado(const iMes, iAno, iMoedaReal, iMoedaAtuarial: Integer): Boolean;
var sSql : String;
    cdsTemp : TCMClientDataSet;
begin
   try
      Result := False;
      sSql := 'SELECT COUNT(*) AS QTDE  ' +#13+
              '  FROM RENTABIMOB        ' +#13+
              ' WHERE TO_NUMBER(TO_CHAR(DATA,''MM''))   = ' + IntToStr(iMes) +#13+
              '   AND TO_NUMBER(TO_CHAR(DATA,''YYYY'')) = ' + IntToStr(iAno) +#13+
              '   AND IDMOEDA = ' + IntToStr(iMoedaReal);

      cdsTemp := TCMClientDataSet.Create( nil );
      cdsTemp.Data := GetDataPacket( sSql );
      if cdsTemp.FieldByName('QTDE').AsInteger > 0 then Result := True;
   finally
      FreeAndNil( cdsTemp );
   end;
end;


function TCtrlMapaCota.ExcluiRentabBI(const iMes, iAno, iMoedaReal, iMoedaAtuarial: Integer): Boolean;
var sSql : String;
begin
   try
      Result := True;
      sSql := 'DELETE FROM RENTABIMOB        ' +#13+
              ' WHERE TO_NUMBER(TO_CHAR(DATA,''MM''))   = ' + IntToStr(iMes) +#13+
              '   AND TO_NUMBER(TO_CHAR(DATA,''YYYY'')) = ' + IntToStr(iAno) +#13+
              '   AND IDMOEDA = ' + IntToStr(iMoedaReal);

      if not ExecSql(sSql) then raise exception.create('Erro ao excluir rentabilidade anterior');
   except
      on E: Exception do begin
         Result := False;
      end;
   end;
end;




function TCtrlMapaCota.GravaRentabilidadeBI(sNomeBilhete: string; const dDtFim: TDateTime; const sPatroPlano:String;
                                            const iMoedaReal, iMoedaAtuarial, iSegmento: Integer): Boolean;
Var iPlano, iPos, iOrigem : Integer;
    idSegmento : String;
    fVlrContabil1, fVlrReavalia1, fVlrMes1, fVlrAno1 : Extended;
    fVlrContabil2, fVlrReavalia2, fVlrMes2, fVlrAno2 : Extended;
    fRentNomMes1, fRentNomAno1, fRentRealMes1, fRentRealAno1, fRentAtuMes1, fRentAtuAno1: Extended;
    fRentNomMes2, fRentNomAno2, fRentRealMes2, fRentRealAno2, fRentAtuMes2, fRentAtuAno2: Extended;
begin
   Result := True;
   try
      iPos := CharPos(sPatroPlano, ',');
      if iPos > 0 then begin
         iPlano := -1;
      end else begin
         iPos   := CharPos(sPatroPlano,'/');
         iPlano := StrToInt(Copy(sPatroPlano, iPos+1, CharPos(sPatroPlano,'''')+1 ));
      end;

      fVlrContabil2 := 0;
      fVlrReavalia2 := 0;
      fVlrMes2      := 0;
      fVlrAno2      := 0;

      cdsMapa.First;

      while not cdsMapa.Eof do begin

         fVlrContabil1 := 0;
         fVlrReavalia1 := 0;
         fVlrMes1      := 0;
         fVlrAno1      := 0;

         iOrigem    := cdsMapa.FieldByName('ORIGEM').AsInteger;
         idSegmento := cdsMapa.FieldByName('IDSEGMENTO').AsString;

         // Grava rentabilidade por imovel
         while (iOrigem = cdsMapa.FieldByName('ORIGEM').AsInteger) and
               (idSegmento = cdsMapa.FieldByName('IDSEGMENTO').AsString) and (not cdsMapa.Eof) do begin
            dbRentabImob.Clear;
            dbRentabImob.Data.AsDateTime      := dDtFim;
            dbRentabImob.Idimovel.AsInteger   := cdsMapa.FieldByName('IDIMOVEL').AsInteger;
            dbRentabImob.Idmoeda.AsInteger    := iMoedaReal;
            dbRentabImob.Idmoedaatu.AsInteger := iMoedaAtuarial;
            dbRentabImob.Vlrcontabil.AsFloat  := cdsMapa.FieldByName('VALOR_CONTABIL').AsFloat;
            dbRentabImob.Vlrreaval.AsFloat    := cdsMapa.FieldByName('ULTREAVALIA').AsFloat;
            dbRentabImob.Vlrrecmes.AsFloat    := cdsMapa.FieldByName('RECEITA_LIQUIDA_MES').AsFloat;
            dbRentabImob.Vlrrecano.AsFloat    := cdsMapa.FieldByName('RECEITA_LIQUIDA_ANO').AsFloat;
            dbRentabImob.Rentnommes.AsFloat   := cdsMapa.FieldByName('RENTAB_MES_NOMINAL').AsFloat;
            dbRentabImob.Rentnomano.AsFloat   := cdsMapa.FieldByName('RENTAB_ANO_NOMINAL').AsFloat;
            dbRentabImob.Rentrealmes.AsFloat  := cdsMapa.FieldByName('RENTAB_MES_REAL').AsFloat;
            dbRentabImob.Rentrealano.AsFloat  := cdsMapa.FieldByName('RENTAB_ANO_REAL').AsFloat;
            dbRentabImob.Rentatumes.AsFloat   := cdsMapa.FieldByName('RENTAB_MES_ATUARIAL').AsFloat;
            dbRentabImob.Rentatuano.AsFloat   := cdsMapa.FieldByName('RENTAB_MES_ATUARIAL').AsFloat;

            if iPlano > 0 then
               dbRentabImob.Idplanoprev.AsInteger := iPlano;
            if iSegmento = 1 then
                 dbRentabImob.CodTipIMovel.AsString   := Trim(cdsMapa.FieldByName('IDSEGMENTO').AsString)
            else dbRentabImob.IdCarteiraSPC.AsInteger := StrToInt(Trim(cdsMapa.FieldByName('IDSEGMENTO').AsString));

            dbRentabImob.Insert;

            // Registra acumulado
            fVlrContabil1 := fVlrContabil1 + cdsMapa.FieldByName('VALOR_CONTABIL').AsFloat;
            fVlrReavalia1 := fVlrReavalia1 + cdsMapa.FieldByName('ULTREAVALIA').AsFloat;
            fVlrMes1      := fVlrMes1      + cdsMapa.FieldByName('RECEITA_LIQUIDA_MES').AsFloat;
            fVlrAno1      := fVlrAno1      + cdsMapa.FieldByName('RECEITA_LIQUIDA_ANO').AsFloat;

            fVlrContabil2 := fVlrContabil2 + cdsMapa.FieldByName('VALOR_CONTABIL').AsFloat;
            fVlrReavalia2 := fVlrReavalia2 + cdsMapa.FieldByName('ULTREAVALIA').AsFloat;
            fVlrMes2      := fVlrMes2      + cdsMapa.FieldByName('RECEITA_LIQUIDA_MES').AsFloat;
            fVlrAno2      := fVlrAno2      + cdsMapa.FieldByName('RECEITA_LIQUIDA_ANO').AsFloat;

            fRentNomMes1  := cdsMapa.FieldByName('TOTRENTAB_MES_NOMINAL').AsFloat;
            fRentNomAno1  := cdsMapa.FieldByName('TOTRENTAB_ANO_NOMINAL').AsFloat;
            fRentRealMes1 := cdsMapa.FieldByName('TOTRENTAB_MES_REAL').AsFloat;
            fRentRealAno1 := cdsMapa.FieldByName('TOTRENTAB_ANO_REAL').AsFloat;
            fRentAtuMes1  := cdsMapa.FieldByName('TOTRENTAB_MES_ATUARIAL').AsFloat;
            fRentAtuAno1  := cdsMapa.FieldByName('TOTRENTAB_ANO_ATUARIAL').AsFloat;

            fRentNomMes2  := cdsMapa.FieldByName('FINRENTAB_MES_NOMINAL').AsFloat;
            fRentNomAno2  := cdsMapa.FieldByName('FINRENTAB_ANO_NOMINAL').AsFloat;
            fRentRealMes2 := cdsMapa.FieldByName('FINRENTAB_MES_REAL').AsFloat;
            fRentRealAno2 := cdsMapa.FieldByName('FINRENTAB_ANO_REAL').AsFloat;
            fRentAtuMes2  := cdsMapa.FieldByName('FINRENTAB_MES_ATUARIAL').AsFloat;
            fRentAtuAno2  := cdsMapa.FieldByName('FINRENTAB_ANO_ATUARIAL').AsFloat;

            iOrigem    := cdsMapa.FieldByName('ORIGEM').AsInteger;
            idSegmento := cdsMapa.FieldByName('IDSEGMENTO').AsString;

            cdsMapa.Next;
         end;


         // Grava Rentabilidade do Segmento
         dbRentabImob.Clear;
         dbRentabImob.Data.AsDateTime      := dDtFim;
         dbRentabImob.Idmoeda.AsInteger    := iMoedaReal;
         dbRentabImob.Idmoedaatu.AsInteger := iMoedaAtuarial;
         dbRentabImob.Vlrcontabil.AsFloat  := fVlrContabil1;
         dbRentabImob.Vlrreaval.AsFloat    := fVlrReavalia1;
         dbRentabImob.Vlrrecmes.AsFloat    := fVlrMes1;
         dbRentabImob.Vlrrecano.AsFloat    := fVlrAno1;
         dbRentabImob.Rentnommes.AsFloat   := fRentNomMes1;
         dbRentabImob.Rentnomano.AsFloat   := fRentNomAno1;
         dbRentabImob.Rentrealmes.AsFloat  := fRentRealMes1;
         dbRentabImob.Rentrealano.AsFloat  := fRentRealAno1;
         dbRentabImob.Rentatumes.AsFloat   := fRentAtuMes1;
         dbRentabImob.Rentatuano.AsFloat   := fRentAtuAno1;

         if iPlano > 0 then
            dbRentabImob.Idplanoprev.AsInteger := iPlano;
         if iSegmento = 1 then
              dbRentabImob.CodTipIMovel.AsString   := Trim(idSegmento)
         else dbRentabImob.IdCarteiraSPC.AsInteger := StrToInt(Trim(idSegmento));

         dbRentabImob.Insert;

      end;


      // Grava Rentabilidade Geral da Carteira
      if not cdsMapa.IsEmpty then begin
         dbRentabImob.Clear;
         dbRentabImob.Data.AsDateTime      := dDtFim;
         dbRentabImob.Idmoeda.AsInteger    := iMoedaReal;
         dbRentabImob.Idmoedaatu.AsInteger := iMoedaAtuarial;
         dbRentabImob.Vlrcontabil.AsFloat  := fVlrContabil2;
         dbRentabImob.Vlrreaval.AsFloat    := fVlrReavalia2;
         dbRentabImob.Vlrrecmes.AsFloat    := fVlrMes2;
         dbRentabImob.Vlrrecano.AsFloat    := fVlrAno2;
         dbRentabImob.Rentnommes.AsFloat   := fRentNomMes2;
         dbRentabImob.Rentnomano.AsFloat   := fRentNomAno2;
         dbRentabImob.Rentrealmes.AsFloat  := fRentRealMes2;
         dbRentabImob.Rentrealano.AsFloat  := fRentRealAno2;
         dbRentabImob.Rentatumes.AsFloat   := fRentAtuMes2;
         dbRentabImob.Rentatuano.AsFloat   := fRentAtuAno2;
         if iPlano > 0 then
            dbRentabImob.Idplanoprev.AsInteger := iPlano;

         dbRentabImob.Insert;
      end;

   except
      on E: Exception do begin
         Result := False;
      end;
   end;
end;



procedure TCtrlMapaCota.SetcdsFluxo(const Value: TCMClientDataSet);
begin
  FcdsFluxo := Value;
end;

procedure TCtrlMapaCota.SetcdsMapa(const Value: TCMClientDataSet);
begin
  FcdsMapa := Value;
end;

procedure TCtrlMapaCota.SetcdsFluxoSeg(const Value: TCMClientDataSet);
begin
  FcdsFluxoSeg := Value;
end;

procedure TCtrlMapaCota.SetdbRentabImob(const Value: TdbRentabImob);
begin
  FdbRentabImob := Value;
end;

function TCtrlMapaCota.AjustaValorAtivoAlienacao(sNomeBilhete: string): Boolean;
var
   iContrato    : Integer;
   fVlrAtivoAnt : Real;
   iPos, iTot   : Integer;
   fVlrJuros    : Real;
begin
   Result := True;
   try
      try
         cdsFluxo.DisableControls;
         cdsFluxo.Filter   := 'ORIGEM   = 2';
         cdsFluxo.Filtered := True;
         cdsFluxo.First;
         iPos := 1;
         iTot := cdsFluxo.RecordCount;
         while not cdsFluxo.Eof do
         begin
            DoProgresso ([sNomeBilhete, iPos, iTot, 'Ajustando Valor do Ativo de Alienação...']);
            iContrato    := cdsFluxo.FieldByName('IDIMOVELMESTRE').AsInteger;
            _cds.Data    := LookupParcelasContrato(iContrato);

            fVlrAtivoAnt := cdsFluxo.FieldByName('ATIVO').AsFloat;
            while (iContrato = cdsFluxo.FieldByName('IDIMOVELMESTRE').AsInteger) and
                  (not cdsFluxo.Eof) do
            begin
               fVlrJuros    := 0;
               if _Cds.Locate('DATAVENCIMENTO', cdsFluxo.FieldByName('DATALANCTO').AsDateTime,[]) then
                  fVlrJuros  := _Cds.FieldByName('VLRJUROS').AsFloat;

               fVlrAtivoAnt := fVlrAtivoAnt - cdsFluxo.FieldByName('RECEITAMES').AsFloat + fVlrJuros;
               cdsFluxo.Edit;
               cdsFluxo.FieldByName('ATIVO').AsFloat := fVlrAtivoAnt;
               cdsFluxo.Post;
               cdsFluxo.Next;
               Inc(iPos);
            end;
         end;
      except
         on E: Exception do begin
            Result := False;
         end;
      end;
   finally;
      DoProgresso ([sNomeBilhete, -1, -1, '']);
      cdsFluxo.Filtered := False;
      cdsFluxo.Filter   := '';
      cdsFluxo.EnableControls;
   end;
end;

function TCtrlMapaCota.LookupParcelasContrato(const iContrato: Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT'                                                             +#13 +
   '    PF.DATAVENCIMENTO,'                                             +#13 +
   '    SUM(NVL(PF.VLRJUROS,0) + NVL(PF.VLRJUROSPARC,0)) AS VLRJUROS'   +#13 +
   'FROM'                                                               +#13 +
   '    PARCFINANCIMOV PF,'                                             +#13 +
   '    CONDPAGIMOVEL CP'                                               +#13 +
   'WHERE'                                                              +#13 +
   '    PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL'                        +#13 +
   'AND CP.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                   +#13 +
   'GROUP BY PF.DATAVENCIMENTO'                                         +#13 +
   'ORDER BY PF.DATAVENCIMENTO'                                         +#13;

   Result := GetDataPacket(sSQL);
end;



end.
