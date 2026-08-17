unit uCtrlGeraEntrada;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, DbClient,  
     uDbNfLivro, uDbNfLivroDetalhe, uCtrlTerceiros, uCtrlTipoAltxImpostos,
     uCtrlParamLivro, uCtrlLivroICMS, uMensErro, Dialogs, uFuncaoGeral,
     {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrlGeraEntrada = Class(TCmControlObject)
    private
      Terceiros : TCtrlTerceiros;
      TipoAltxImpostos : TCtrlTipoAltxImpostos;
      ParamLivro : TCtrlParamLivro;
      LivroICMS : TCtrlLivroICMS;
      FuncaoGeral : TFuncaoGeral;
      sSql, sCodImposto, sCodFiscal, sTotNota, sAliquota, sBase, sValorImp,
      sValorContab, sValorOutros, sValorIsento, sVlrIcmsSubst, sVlrIpi, sVlrDifIcms, sIcmsAntecipado :String;

      //Cds a serem utilizados
      cdsnflivros: TClientDataSet;
      CdsNflivroDetalhe: TClientDataSet;
      CdsImpostoNF : TclientDataSet;
      CdsItensNF : TClientDataSet;
      CdsImpostoItem : TClientDataSet;
      CdsAltxImposto : TClientDataSet;
      CdsParamLivro : TClientDataSet;
      CdsAuxFor : TClientDataSet;
      CdsAux : TClientDataSet;
      sCodigoFiscal : Array of string;
      procedure ListaCodigosFiscaisSemIncidencia;
      function VerificaCodigoFiscal(CodFiscal : string) : Boolean;
      procedure CarregaCdsLimpo;
      function TrocaPPTVig(Valor : string) : string;
      function OraNumero(rNumero : Double ):string;
    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;override;
    public
      Constructor Create; Override;
      Destructor Destroy; Override;
      {Faz a geração do livro}
      function GeraLivroEntrada(cdsRecebeNF : OleVariant; ModeloNFEntra, ModeloNFFrete, ModeloNFDevol : string; IdPessoa : integer) : Boolean;
      {inclui o detalhe da nota no cds}
      procedure IncluiDetalhe;
      {Altera o detalhe da nota no cds}
      procedure AlteraDetalhe;
      {Pega as notas do almoxerifado que ainda não foram geradas para o livro - Pertence ao Almoxarifado - Igor}
      function ListAlmoxaParaLivro(IdEmpresa : integer; DataFim : string) : OleVariant;

    protected

    End;

implementation

{ TCtrlGeraEntrada }



procedure TCtrlGeraEntrada.AfterInitialize;
begin
  inherited;
  Terceiros.InitializeAs(self);
  LivroICMS.InitializeAs(self);
  TipoAltxImpostos.InitializeAs(Self);
  ParamLivro.InitializeAs(Self);
  FuncaoGeral.InitializeAs(Self);
  Terceiros.OpenTransaction := false;
  TipoAltxImpostos.OpenTransaction := false;
  ParamLivro.OpenTransaction := false;
  LivroICMS.OpenTransaction := false;
end;

procedure TCtrlGeraEntrada.AlteraDetalhe;
Var
  bincide : Boolean;
begin
   bIncide := VerificaCodigoFiscal(sCodFiscal);

  with CdsNflivroDetalhe do
    Begin
      edit;
      if not bincide then
        fieldByname('BASECALCULO').AsFloat  := fieldByname('BASECALCULO').AsFloat + strToFloat(TrocaPPTVig(sBase));

      fieldByname('VALORIMPOSTO').AsFloat   := fieldByname('VALORIMPOSTO').AsFloat + strTofloat(TrocaPPTVig(sValorImp));
      fieldByname('VALORCONTABIL').AsFloat  := fieldByname('VALORCONTABIL').AsFloat + strTofloat(TrocaPPTVig(sValorContab));
      fieldByname('VALOROUTROS').AsFloat    := fieldByname('VALOROUTROS').AsFloat + strTofloat(TrocaPPTVig(sValorOutros));
      fieldByname('VALORISENTO').AsFloat    := fieldByname('VALORISENTO').AsFloat + strTofloat(TrocaPPTVig(sValorIsento));
      fieldByname('VLRICMSSUBST').AsFloat   := fieldByname('VLRICMSSUBST').AsFloat + strTofloat(TrocaPPTVig(sVlrIcmsSubst));
      fieldByname('ICMSANTECIPADO').AsFloat := fieldByname('ICMSANTECIPADO').AsFloat + strTofloat(TrocaPPTVig(sIcmsAntecipado));
      fieldByname('VLRIPI').AsFloat         := fieldByname('VLRIPI').AsFloat + strTofloat(TrocaPPTVig(sVlrIpi));
      fieldByname('VLRDIFICMS').AsFloat     := fieldByname('VLRDIFICMS').AsFloat + strToFloat(TrocaPPTVig(sVlrDifIcms));
      post;
    end;
end;

procedure TCtrlGeraEntrada.CarregaCdsLimpo;
Var
   Ssql : string;
begin
  //Traz apenas a estrutura da tabela
  Ssql := 'SELECT * FROM NFLIVRO WHERE (1 = 2)';
  cdsnflivros.data := GetDataPacket(Ssql);
  Ssql := 'SELECT * FROM NFLIVRODETALHE WHERE (1 = 2)';
  CdsNflivroDetalhe.data := GetDataPacket(Ssql);
end;

constructor TCtrlGeraEntrada.Create;
begin
  inherited;
  DecimalSeparator := ',';
  //Lists de terceiros
  Terceiros := TCtrlTerceiros.Create;

  //Carrega classe de negócio do livro
  LivroICMS := TCtrlLivroICMS.Create;
  CdsNflivrodetalhe  := TClientDataSet.Create(nil);
  cdsnflivros         := TClientDataSet.Create(nil);
  CdsImpostoNF       := TClientDataSet.Create(nil);
  CdsItensNF         := TClientDataSet.Create(nil);
  CdsImpostoItem     := TClientDataSet.Create(nil);
  CdsAltxImposto     := TClientDataSet.Create(nil);
  CdsParamLivro      := TClientDataSet.Create(nil);
  CdsAuxFor          := TClientDataSet.Create(nil);
  CdsAux             := TClientDataSet.Create(nil);
  FuncaoGeral        := TFuncaoGeral.create;
  //Carrega classe de negócio Alterador x Imposto
  TipoAltxImpostos := TCtrlTipoAltxImpostos.Create;

  //Carrega classe de negócio Paramêtros do livro
  ParamLivro := TCtrlParamLivro.Create;
  sVlrDifIcms := '';

end;

destructor TCtrlGeraEntrada.Destroy;
begin
  inherited;
  CdsNflivrodetalhe.Free;
  cdsnflivros.free;
  CdsImpostoNF.free;
  CdsItensNF.free;
  CdsImpostoItem.free;
  CdsAltxImposto.free;
  CdsParamLivro.free;
  CdsAuxFor.free;
  CdsAux.free;
  FuncaoGeral.free;
end;

procedure TCtrlGeraEntrada.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlGeraEntrada.GeraLivroEntrada(cdsRecebeNF: OleVariant; ModeloNFEntra, ModeloNFFrete, ModeloNFDevol : string; IdPessoa : integer): Boolean;
var rVlrAgregado,rValContab,rTotalItem,
    rVlrRecuperado,rBaseCalculo,s12,s13,s14, s16 :Double;
    bFez :Boolean;
begin
  If ConnectionSide = cnsClient Then
    Begin
      Result := Connection.AppServer.GeraLivroEntrada(cdsRecebeNF, ModeloNFEntra, ModeloNFFrete, ModeloNFDevol, IdPessoa);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
    end
  else
    Begin

      CdsAux.Data := cdsRecebeNF;
      //Carrega o cdsParamlivro
      CdsParamLivro.data := ParamLivro.ListCodICMSIPI(IdPessoa);
      Result := True;
      //lista os códigos fiscais sem incidência de icms
      ListaCodigosFiscaisSemIncidencia;

      StartTransaction;

      CdsAux.First;
      while not CdsAux.eof do
      Begin
         Try
            CarregaCdsLimpo; // carrega apenas a estrutura das tabelas para o cds

            //insere os registros de nfrecebdevol em nflivro
            sTotNota  := OraNumero(CdsAux.FieldByName('VLRNOTAFISCAL').AsFloat);
            sVlrDifIcms := '';
            sVlrIcmsSubst := '';
            sVlrIpi := '';
            sIcmsAntecipado := '';
            cdsnflivros.append;
            cdsnflivros.fieldByname('IDFORCLI').Asinteger := CdsAux.FieldByName('IDFORCLI').AsInteger;
            cdsnflivros.fieldByname('IDPESSOA').Asinteger := IdPessoa;

            if CdsAux.FieldByName('FLGTIPONOTA').AsString = 'R' then
               cdsnflivros.fieldByname('CODMODELO').Asstring := ModeloNFEntra
            else if CdsAux.FieldByName('FLGTIPONOTA').AsString = 'A' then
                    cdsnflivros.fieldByname('CODMODELO').Asstring := ModeloNFFrete
            else
                 cdsnflivros.fieldByname('CODMODELO').Asstring := ModeloNFDevol;

            cdsnflivros.fieldByname('NUMNFINI').AsInteger := CdsAux.FieldByName('NUMNF').AsInteger;
            cdsnflivros.fieldByname('NUMNFFIM').AsInteger := CdsAux.FieldByName('NUMNF').AsInteger;
            cdsnflivros.fieldByname('NFCOMPLEMENTO').Asstring := CdsAux.FieldByName('COMPLNF').AsString;
            cdsnflivros.fieldByname('DATAEMISSAONF').Asstring := CdsAux.FieldByName('DATAEMISNF').AsString;
            cdsnflivros.fieldByname('DATAENTRADANF').Asstring := CdsAux.FieldByName('DATAENTDEVOL').AsString;
            If CdsAux.FieldByName('FLGTIPONOTA').AsString <> 'D' then
               cdsnflivros.fieldByname('FLGENTRADASAIDA').Asstring := 'E'
            else
               cdsnflivros.fieldByname('FLGENTRADASAIDA').Asstring := 'S';

            cdsnflivros.fieldByname('VLRTOTALNF').AsFloat := strTofloat(TrocaPPTVig(sTotNota));

            // pega o imposto da nota
            CdsImpostoNF.data := Terceiros.ListAgradosRecDev(CdsAux.FieldByName('IDNFRECEBDEVOL').Asinteger);
            //
            //pega os itens da nota
            CdsItensNF.data := Terceiros.ListItensRecebDevol(CdsAux.FieldByName('IDNFRECEBDEVOL').Asinteger);

            //
            rTotalItem:=0;
            cdsItensNF.First;
            while not cdsItensNF.Eof do   // PEGA A SOMA DO VALOR DOS ITENS DA NF
              Begin
                rTotalItem := rTotalItem + cdsItensNF.FieldByName('VLRTOTITEM').AsFloat;
                cdsItensNF.Next;
              end;
            // VARRE OS ITENS DA NF
            if not cdsItensNF.IsEmpty then
             Begin
               cdsItensNF.First;
               While not cdsItensNF.Eof do
               Begin
                  rValContab := cdsItensNF.FieldByName('VLRTOTITEM').AsFloat;
                  //pega o imposto do item
                  cdsImpostoItem.data := Terceiros.ListImpostoItem(cdsItensNF.FieldByName('IDITENSRECDEV').AsInteger);
                  //
                  if rTotalItem <> 0 then // Soma do total dos itens <> 0
                    Begin
                     cdsImpostoNF.First;
                     while not cdsImpostoNF.Eof do
                     Begin
                        rVlrAgregado := ((cdsImpostoNF.FieldByName('VLRAGREGADO').AsFloat *
                                        cdsItensNF.FieldByName('VLRTOTITEM').AsFloat) / rTotalItem);

                        rBaseCalculo := ((cdsImpostoNF.FieldByName('BASECALCULO').AsFloat *
                                        cdsItensNF.FieldByName('VLRTOTITEM').AsFloat) / rTotalItem);

                        rVlrRecuperado:=0;

                        if cdsItensNF.FieldByName('CONSUMOREVENDA').AsString = 'R' then
                           rVlrRecuperado := ((cdsImpostoNF.FieldByName('VLRRECUPERADO').AsFloat *
                                             cdsItensNF.FieldByName('VLRTOTITEM').AsFloat) / rTotalItem);
                        //calcula o imposto e insere na query qryimpostoItem

                        cdsImpostoItem.Append;
                        cdsImpostoItem.FieldByName('ALIQUOTA').AsFloat           := cdsImpostoNF.FieldByName('ALIQUOTA').AsFloat;
                        cdsImpostoItem.FieldByName('VLRAGREGADO').AsFloat        := rVlrAgregado;
                        cdsImpostoItem.FieldByName('VLRRECUPERADO').AsFloat      := rVlrRecuperado;
                        cdsImpostoItem.FieldByName('BASECALCULO').AsFloat        := rBaseCalculo;
                        cdsImpostoItem.FieldByName('CODTIPOCUSTAGREG').AsInteger := cdsImpostoNF.FieldByName('CODTIPOCUSTAGREG').AsInteger;
                        cdsImpostoItem.FieldByName('CODTRATFISCE').AsString      := cdsImpostoNF.FieldByName('CODTRATFISCE').AsString;
                        cdsImpostoItem.Post;
                        cdsImpostoNF.Next;
                     end;
                  end;
                  cdsImpostoItem.First;
                  while not cdsImpostoItem.Eof do
                  Begin
                     if (cdsImpostoItem.FieldByName('CODTRATFISCE').AsString = '3') or
                        (cdsImpostoItem.FieldByName('CODTRATFISCE').AsString = '4') then
                        rValContab := rValContab + cdsImpostoItem.FieldByName('VLRAGREGADO').AsFloat
                     else if (cdsImpostoItem.FieldByName('CODTRATFISCE').AsString = '6') then
                        rValContab := rValContab - cdsImpostoItem.FieldByName('VLRAGREGADO').AsFloat;
                     cdsImpostoItem.Next;
                  end;
                  //
                  sCodFiscal  := cdsItensNF.FieldByName('CODFISCAL').AsString;
                  bFez := False;
                  cdsImpostoItem.First;
                  s12 := 0;
                  s13 := 0;
                  s14 := 0;
                  s16 := 0; //icms antecipado
                  while not cdsImpostoItem.Eof do
                  Begin
                     //  -- PROCURA O CODTIPOCUSTAGREG NA TABELA ALTXIMPOSTO E VERIFICA O CODIMPOSTO

                     //pega o alterado x imposto do item
                     cdsAltxImposto.data := TipoAltxImpostos.ListAltxImposto(cdsImpostoItem.FieldByName('CODTIPOCUSTAGREG').AsInteger);
                     cdsAltxImposto.First;
                     //if o imposto não for de Pis 
                     if cdsAltxImposto.FieldByName('CODIMPOSTO').AsInteger <> 17 then
                       Begin
                         if not cdsAltxImposto.Eof then
                            Case cdsAltxImposto.FieldByName('CODIMPOSTO').AsInteger of
                              12 :  s12 := cdsImpostoItem.FieldByName('VLRAGREGADO').AsFloat;
                              13 :  s13 := cdsImpostoItem.FieldByName('VLRAGREGADO').AsFloat;
                              14 :  s14 := cdsImpostoItem.FieldByName('VLRAGREGADO').AsFloat;
                              16 :  s16 := cdsImpostoItem.FieldByName('VLRAGREGADO').AsFloat;
                            end;
                         sVlrIcmsSubst   := OraNumero(s12);
                         sVlrIpi         := OraNumero(s13);
                         sVlrDifIcms     := OraNumero(s14);
                         sIcmsAntecipado := OraNumero(s16);
                         //
                         if (cdsImpostoItem.FieldByName('VLRRECUPERADO').AsFloat <> 0) then
                          Begin
                            bFez := True;
                            sCodImposto  := cdsImpostoItem.FieldByName('CODTIPOCUSTAGREG').AsString;
                            sAliquota    := OraNumero(cdsImpostoItem.FieldByName('ALIQUOTA').AsFloat);
                            sBase        := OraNumero(cdsImpostoItem.FieldByName('BASECALCULO').AsFloat);
                            sValorImp    := OraNumero(cdsImpostoItem.FieldByName('VLRAGREGADO').AsFloat);
                            sValorContab := OraNumero(rValContab);

                            if cdsItensNF.FieldByName('ISENTOOUTROS').AsString = 'I' then
                              begin
                               sValorOutros := '0';
                               sValorIsento := OraNumero((rValContab - cdsImpostoItem.FieldByName('BASECALCULO').AsFloat));
                              end
                            else
                              begin
                               sValorIsento := '0';
                               sValorOutros := OraNumero((rValContab - cdsImpostoItem.FieldByName('BASECALCULO').AsFloat));
                              end;

                            //Verifica se já existe nessa nota um item com o mesmo código de agregado, aliquota e código fiscal.
                            //Caso exista altera o item acrescentando o valor desse item, senão inclui o novo detalhe da nota
                            CdsNflivroDetalhe.First;
                            if not CdsNflivroDetalhe.Locate('CODTIPOCUSTAGREG;CODFISCAL;ALIQUOTA', VarArrayOf([cdsImpostoItem.FieldByName('CODTIPOCUSTAGREG').AsInteger,
                                                     cdsItensNF.FieldByName('CODFISCAL').AsFloat,
                                                     cdsImpostoItem.FieldByName('ALIQUOTA').AsFloat]), []) then
                            begin
                               //Inclui registro
                               IncluiDetalhe;
                            end else begin
                               //Altera registro
                               AlteraDetalhe;
                            end;
                          end;

                       end;
                     cdsImpostoItem.Next;
                  end;
                  if not bFez then begin  //Não tem imposto para os itens
                     sCodImposto  := cdsParamLivro.FieldByName('CODICMSENTRADA').AsString;
                     sAliquota    := '0';
                     sBase        := '0';
                     sValorImp    := '0';
                     sValorContab := OraNumero(rValContab);
                     if cdsItensNF.FieldByName('ISENTOOUTROS').AsString = 'I' then begin
                        sValorOutros := '0';
                        sValorIsento := OraNumero(rValContab);
                     end else begin
                        sValorIsento := '0';
                        sValorOutros := OraNumero(rValContab);
                     end;

                    //Verifica se já existe nessa nota um item com o mesmo código de agregado, aliquota e código fiscal.
                    //Caso exista altera o item acrescentando o valor desse item, senão inclui o novo detalhe da nota
                     CdsNflivroDetalhe.First;
                     if not CdsNflivroDetalhe.Locate('CODTIPOCUSTAGREG;CODFISCAL;ALIQUOTA', VarArrayOf([StrToFloat(FuncaoGeral.Decode(cdsParamLivro.FieldByName('CODICMSENTRADA').Asstring, '', '0', cdsParamLivro.FieldByName('CODICMSENTRADA').Asstring)),
                                              StrToFloat(FuncaoGeral.Decode(cdsItensNF.FieldByName('CODFISCAL').Asstring, '', 0, cdsItensNF.FieldByName('CODFISCAL').Asstring)),
                                              StrToFloat(FuncaoGeral.Decode(sAliquota, '0', '0', sAliquota))]), []) then
                     begin
                        //Inclui registro
                        IncluiDetalhe;
                     end else begin
                        //Altera registro
                        AlteraDetalhe;
                     end;
                  end;
                  cdsItensNF.Next;
               end;
            end else begin       //qry ItensNF vazia
               //Notas Complementares
               sCodFiscal := CdsAux.FieldByName('CODFISCAL').AsString;
               bFez := False;
               s12 := 0;
               s13 := 0;
               s14 := 0;
               s16 := 0; //icms antecipado
               cdsImpostoNF.First;
               While not cdsImpostoNF.Eof do
               Begin
                  //  -- PROCURA O CODTIPOCUSTAGREG NA TABELA ALTXIMPOSTO E VERIFICA O CODIMPOSTO
                  CdsAltxImposto.data := TipoAltxImpostos.ListAltxImposto(cdsImpostoNF.FieldByName('CODTIPOCUSTAGREG').AsInteger);
                  cdsAltxImposto.First;
                  if not cdsAltxImposto.Eof then
                     Case cdsAltxImposto.FieldByName('CODIMPOSTO').Value of
                       12 :  s12 := cdsImpostoNF.FieldByName('VLRAGREGADO').AsFloat;
                       13 :  s13 := cdsImpostoNF.FieldByName('VLRAGREGADO').AsFloat;
                       14 :  s14 := cdsImpostoNF.FieldByName('VLRAGREGADO').AsFloat;
                       16 :  s16 := cdsImpostoNF.FieldByName('VLRAGREGADO').AsFloat;
                     end;
                  sVlrIcmsSubst   := OraNumero(s12);
                  sVlrIpi         := OraNumero(s13);
                  sVlrDifIcms     := OraNumero(s14);
                  sIcmsAntecipado := OraNumero(s16);
                  //
                  if cdsImpostoNF.FieldByName('VLRRECUPERADO').AsFloat <> 0 then begin
                     bFez := True;
                     sCodImposto  := cdsImpostoNF.FieldByName('CODTIPOCUSTAGREG').AsString;
                     sAliquota    := OraNumero(cdsImpostoNF.FieldByName('ALIQUOTA').AsFloat);
                     sBase        := OraNumero(cdsImpostoNF.FieldByName('BASECALCULO').AsFloat);
                     sValorImp    := OraNumero(cdsImpostoNF.FieldByName('VLRAGREGADO').AsFloat);
                     sValorContab := OraNumero(CdsAux.FieldByName('VLRNOTAFISCAL').AsFloat);
                     sValorIsento := '0';
                     sValorOutros := OraNumero((CdsAux.FieldByName('VLRNOTAFISCAL').AsFloat -
                                                                      cdsImpostoNF.FieldByName('BASECALCULO').AsFloat));
                     //Inclui registro
                     IncluiDetalhe;
                  end;
                  cdsImpostoNF.Next;
               end;
               if not bFez then begin  // Não tem impostos para a NF
                  sCodImposto  := cdsParamLivro.FieldByName('CODICMSENTRADA').AsString;
                  sAliquota    := '0';
                  sBase        := '0';
                  sValorImp    := '0';
                  sValorContab := OraNumero(CdsAux.FieldByName('VLRNOTAFISCAL').AsFloat);
                  sValorIsento := '0';
                  sValorOutros := OraNumero(CdsAux.FieldByName('VLRNOTAFISCAL').AsFloat);
                  //
                  sVlrIcmsSubst := '0';
                  sVlrIpi       := '0';
                  sVlrDifIcms   := '0';
                  sIcmsAntecipado := '0';
                  //Inclui registro
                  IncluiDetalhe;
               end;
            end;

            //Liga meus cds aos da classe de negócio
            LivroICMS.cdsnflivro := cdsnflivros;
            LivroICMS.CdsNflivroDetalhe := CdsNflivroDetalhe;
            //Grava Livro
            if not LivroICMS.GravarLivro then
               Begin
                 Result := false;
                 Raise Exception.Create(messageinfo);
               end;

            sSql := 'UPDATE NFRECEBDEVOL SET FLGGEROULIVRO = ''S'',IDNFLIVRO = '+ IntToStr(LivroICMS.DbNflivro.Idnflivro.AsInteger)+' WHERE '+
                    'IDNFRECEBDEVOL = '+CdsAux.FieldByName('IDNFRECEBDEVOL').AsString;
            //executa o update na nfrecebdevol
            if not ExecSQL(Ssql) then
               Begin
                 Result := false;
                 Raise Exception.Create(messageinfo);
               end;

         Except
            On E:Exception Do
            Begin
               cdsAuxFor.data := Terceiros.ListRazaoSocialEmpresaProp(IdPessoa);
               MessageInfo :=  ('Geração da Nota ') + CdsAux.FieldByName('NUMNF').AsString+'/' + CdsAux.FieldByName('COMPLNF').AsString +
                               (' do fornecedor ') + cdsAuxFor.FieldByName('RAZAOSOCIAL').AsString +
                               (' do dia ') + CdsAux.FieldByName('DATAENTDEVOL').AsString +
                               (' não Efetuada');
               Result := False;
               MessageInfo := E.Message;
               Rollback;
            End;
         end;
         CdsAux.Next;
      end;
      Commit;
    end;
end;

procedure TCtrlGeraEntrada.IncluiDetalhe;
Var
  bIncide : boolean;
begin
  bIncide := VerificaCodigoFiscal(sCodFiscal);
  //Grava o detalhe do livro
  CdsNflivroDetalhe.Append;
  CdsNflivroDetalhe.fieldByname('CODTIPOCUSTAGREG').Asstring := sCodImposto;
  CdsNflivroDetalhe.fieldByname('CODFISCAL').Asstring        := sCodFiscal;
  CdsNflivroDetalhe.fieldByname('ALIQUOTA').AsFloat          := strTofloat(TrocaPPTVig(sAliquota));
  if not bIncide then
    CdsNflivroDetalhe.fieldByname('BASECALCULO').AsFloat     := strTofloat(TrocaPPTVig(sBase));

  CdsNflivroDetalhe.fieldByname('VALORIMPOSTO').AsFloat      := strTofloat(TrocaPPTVig(sValorImp));
  CdsNflivroDetalhe.fieldByname('VALORCONTABIL').AsFloat     := strTofloat(TrocaPPTVig(sValorContab));
  CdsNflivroDetalhe.fieldByname('VALOROUTROS').AsFloat       := strTofloat(TrocaPPTVig(sValorOutros));
  CdsNflivroDetalhe.fieldByname('VALORISENTO').AsFloat       := strTofloat(TrocaPPTVig(sValorIsento));
  CdsNflivroDetalhe.fieldByname('VLRICMSSUBST').AsFloat      := strTofloat(TrocaPPTVig(sVlrIcmsSubst));
  CdsNflivroDetalhe.fieldByname('VLRIPI').AsFloat            := strTofloat(TrocaPPTVig(sVlrIPI));
  CdsNflivroDetalhe.fieldByname('VLRDIFICMS').AsFloat        := strTofloat(TrocaPPTVig(sVlrDifIcms));
  CdsNflivroDetalhe.fieldByname('ICMSANTECIPADO').AsFloat    := strTofloat(TrocaPPTVig(sIcmsAntecipado));
  CdsNflivroDetalhe.post;
end;

procedure TCtrlGeraEntrada.ListaCodigosFiscaisSemIncidencia;
Var
  i : integer;
  Ssql : string;
begin
  with _Cds do
    Begin
      Ssql := 'SELECT CODFISCAL '+
              '  FROM CLASFISC '+
              ' WHERE FLGICMS = ''S''';  //se não incide icms sobre esse código fiscal
      data := GetDataPacket(Ssql);
      SetLength(scodigoFiscal, RecordCount + 1); //seta o tamanho do Vetor para o tamanho da query mais 1
      first;
      for i := 0 to Recordcount - 1 do
        Begin
          sCodigoFiscal[i] := fieldByname('CODFISCAL').Asstring;
          next;
        end;
    end;
end;

function TCtrlGeraEntrada.ListAlmoxaParaLivro(IdEmpresa: integer;
                                              DataFim: string): OleVariant;
Var
   Ssql : string;
begin
  Ssql := 'SELECT IDNFRECEBDEVOL,CODFISCAL,IDFORCLI, NUMNF,COMPLNF,DATAEMISNF,'+
          '       DATAENTDEVOL,FLGTIPONOTA,VLRNOTAFISCAL '+
          '  FROM NFRECEBDEVOL '+
          ' WHERE ((FLGGEROULIVRO IS NULL) '+
          '    OR (FLGGEROULIVRO = ''N'')) '+
          '   AND (IDPESSOA = '+IntToStr(IdEmpresa)+')'+
          '   AND (DATAENTDEVOL <= TO_DATE('''+DataFim+''',''DD/MM/YYYY''))';
  Result := GetDataPacket(Ssql);
end;

procedure TCtrlGeraEntrada.OnCreateAppServer;
begin
  inherited;
  
end;

function TCtrlGeraEntrada.OraNumero(rNumero: Double): string;
var sNumero : string;
    AuxDec  : char;
begin
   AuxDec           := DecimalSeparator;
   DecimalSeparator := '.';
   sNumero:= FloatToStr(rNumero);
   Result :=sNumero;
   DecimalSeparator:=AuxDec;
end;


function TCtrlGeraEntrada.TrocaPPTVig(Valor: string): string;
var  i : integer;
begin
if Trim(Valor) <> '' then
   begin
   for i := 0 to Length(Valor) do
       begin
         if Valor[i] = '.' then
           begin
             Valor[i]:=',';
           end;
       end;
   end;
   Result := valor;
   if trim(Result) = '' then
      Result := '0';
end;

function TCtrlGeraEntrada.VerificaCodigoFiscal(CodFiscal: string): Boolean;
Var
  i : integer;
begin
  Result := false;
  for i := 0 to Length(sCodigoFiscal) - 1 do
    if CodFiscal = sCodigoFiscal[i] then
       result := true;
end;

end.
