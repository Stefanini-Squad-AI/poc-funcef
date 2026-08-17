{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
 N. Chamado....: WO33944
 Dt Alteração..: 09/03/2026
 Responsável...: Paulo Nobre
 Descrição.....: PROJETO CNPJ ALFANUMÉRICO
                 .(.dfm) Ajustando o padrão da mascara atual do CNPJ
                  (mskedMascaras) para a alfanumérica: 'AA.AAA.AAA/AAAA-99'.
--------------------------------------------------------------------------------
Padrão      : 5.10.18 em diante...
Pendência   : 27582
Responsável : Daniel Simões
Data        : 12/03/2008
Descrição   : Ajuste do Help Context.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FImpressaoNotas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Grids, Wwdbigrd,
  Wwdbgrid, Wwdatsrc, Mask, wwdblook, uGimp,uExtensoCM, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, ComCtrls, uObjHASAR, Provider,
  DBClient, uCMClientDataSet;

type
  TfrmImpressaoNotas = class(TfrmSairAjuda)
    grdContratos: TwwDBGrid;
    qryDadosNF: TwwQuery;
    btnImprimir: TBitBtn;
    qryContratos: TwwQuery;
    dsContratos: TwwDataSource;
    updContratos: TUpdateSQL;
    updDadosNF: TUpdateSQL;
    qryModelosNF: TwwQuery;
    qryComposicaoNF: TwwQuery;
    Extenso: TExtensoCM;
    qryDadosForCli: TwwQuery;
    qryAux: TwwQuery;
    qryAlteardores: TwwQuery;
    pgcTiposImp: TPageControl;
    tbsImpComum: TTabSheet;
    tbsImpFiscal: TTabSheet;
    Label1: TLabel;
    mskedNumNota: TMaskEdit;
    Label2: TLabel;
    dblcModeloNF: TwwDBLookupCombo;
    Label3: TLabel;
    edNatServicos: TEdit;
    Label4: TLabel;
    edCondEspeciais: TEdit;
    Label5: TLabel;
    dblcImposto: TwwDBLookupCombo;
    Label6: TLabel;
    mskedMascaras: TMaskEdit;
    edDescImposto: TEdit;
    edPrestacaoServ: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    dtpDataEmissao: TCMDateTimePicker;
    chbExibeIdentImposto: TCheckBox;
    cbModeloImpFiscal: TComboBox;
    Label9: TLabel;
    Label10: TLabel;
    redPorta: TRealEdit;
    gbCabecalho: TGroupBox;
    edCabLinha1: TEdit;
    Label11: TLabel;
    edCabLinha2: TEdit;
    Label12: TLabel;
    gbRodape: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    edRodLinha1: TEdit;
    edRodLinha2: TEdit;
    cdsContratos: TCMClientDataSet;
    dspContratos: TDataSetProvider;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mskedNumNotaChange(Sender: TObject);
    procedure dblcModeloNFChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grdContratosTitleButtonClick(Sender: TObject;
      AFieldName: String);
  private
    { Private declarations }
    Gimp          : TGimp;
    Hasar         : TImpressao;
    bUsaImpFiscal : Boolean;
    rAliquota     : Double;
    function GeraTotalNota: Real;
    function GeraTotalImposto(rIDPessoa, rIDContrato, rCodAlterador, rIDParcela: Double;
                              dDataVencParc: TDateTime; var rAliquota: Double): Real;
    function ImprimeNF(iNumNota:Integer): Boolean;
    function ImprimeNFImpFiscal: Boolean;
    
    function Replicate(sPadrao: String; iNumVezes: Integer): String;
    function JuntaString(sA,sB: String): String;
    function SubstCarEspeciais(sTexto: String): String;
    function AlinhaTexto(sTexto,sAlinhamento: String; iTamanho: Integer): String;
    procedure GeraMultiplasLinhas(sTexto: String; iColuna, iLinha, iTamanho, iNumMaxLinhas: Integer;
                                  TextoNF: TStringList);
    procedure PosicionaValor(var Txt: TStringList; iColuna,iLinha: Integer; Valor: String);
    procedure TruncaTexto(var sTexto, sRestoTexto: String; iTamanho: Integer);
  public
    { Public declarations }
  end;

var
  frmImpressaoNotas: TfrmImpressaoNotas;

implementation

{$R *.DFM}

uses USistema,uMensErro, Math,  OleCtrls, ComObj;

procedure TfrmImpressaoNotas.FormCreate(Sender: TObject);
begin
   inherited;
   qryContratos.Close;
   qryContratos.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   cdsContratos.Open;

   qryModelosNF.Close;
   qryModelosNF.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   qryModelosNF.Open;

   qryAlteardores.Close;
   qryAlteardores.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   qryAlteardores.Open;

   dtpDataEmissao.Date:=Date;
   Gimp:=TGImp.Create(Self);

   bUsaImpFiscal:=False;
   qryAux.SQL.Clear;
   qryAux.SQL.Text:='SELECT FLGNFIMPFISCAL '+
                    'FROM PARAMCONTRATO '+
                    'WHERE (IDPESSOA = '+FloatToStr(Sistema.IdEmpresa)+') ';
   qryAux.Open;
   bUsaImpFiscal:=(qryAux.FieldByName('FLGNFIMPFISCAL').AsString='S') ;
   qryAux.Close;                     

   tbsImpComum.TabVisible:=not(bUsaImpFiscal);
   tbsImpFiscal.TabVisible:=bUsaImpFiscal;

   if not(bUsaImpFiscal) then
      pgcTiposImp.ActivePageIndex:=0
   else
      pgcTiposImp.ActivePageIndex:=1;

end;

procedure TfrmImpressaoNotas.FormDestroy(Sender: TObject);
begin
   inherited;
   Gimp.Free;
end;

procedure TfrmImpressaoNotas.mskedNumNotaChange(Sender: TObject);
begin
   btnImprimir.Enabled:=(Trim(mskedNumNota.Text)<>'');
end;

procedure TfrmImpressaoNotas.dblcModeloNFChange(Sender: TObject);
begin
   qryComposicaoNF.Close;
   qryComposicaoNF.ParamByName('IDModeloNF').AsFloat:=StrToFloat(dblcModeloNF.LookupValue);   
   qryComposicaoNF.Open;
end;

procedure TfrmImpressaoNotas.btnImprimirClick(Sender: TObject);
var
   iNumNotaFiscal   : Integer;
   bImprimiu        : Boolean;
   sEnderecoCliente : String;
begin
   iNumNotaFiscal:=0;
   if not(bUsaImpFiscal) then
    begin
       try
          iNumNotaFiscal:=StrToInt(Trim(mskedNumNota.Text));
       except
          MsgDlg('Número de Nota Fiscal Inválido !','Atenção',mtWarning,[mbOk],0);
          mskedNumNota.SetFocus;
          Exit;
       end;

       Gimp.MostraPrinterSetup:=True;
       if not(Gimp.Inicializar) then
        begin
           MsgDlg('Impressora não preparada','Atenção',mtWarning,[mbOk],0);
           Exit;
        end;

       cdsContratos.First;
       while not(cdsContratos.Eof) do
       begin
          bImprimiu:=False;
          //Testa se o Registro está marcado para impressão
          if cdsContratos.FieldByName('IMPRIMENOTA').AsString='S' then
           begin
              //Busca dados da NF
              qryDadosNF.Close;
              qryDadosNF.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
              qryDadosNF.ParamByName('IDContrato').AsFloat:=cdsContratos.FieldByName('IDCONTRATO').AsFloat;
              qryDadosNF.ParamByName('DataVenc').AsString:=FormatDateTime('dd/mm/yyyy',
                                                 cdsContratos.FieldByName('DATAVENCPARCELA').AsDateTime);
              qryDadosNF.Open;
              qryDadosNF.First;

              //A impressão da NF não está preparada para imprimir dados que ultrapassem a área de
              //detalhe da mesma
              if (qryModelosNF.FieldByName('LinDetFinal').AsFloat-
                  qryModelosNF.FieldByName('LinDetInicial').AsFloat-qryDadosNF.RecordCount)<0 then
               begin
                  ShowMessage('Erro *** Linhas detalhes excedem comprimento máximo da área detalhe ***');
                  Exit;
               end;

               if ImprimeNF(iNumNotaFiscal) then
                begin
                   //Grava o Número da Nota Fiscal nos registros que a compõe
                   qryDadosNF.First;
                   while not(qryDadosNF.Eof) do
                   begin
                      qryDadosNF.Edit;
                      qryDadosNF.FieldByName('NUMNOTAFISCAL').AsFloat:=iNumNotaFiscal;
                      qryDadosNF.FieldByName('DATAEMISSNF').AsDateTime:=Date;
                      qryDadosNF.Post;
                      qryDadosNF.Next;
                   end;
                   qryDadosNF.ApplyUpdates;
                   qryDadosNF.Close;

                   Inc(iNumNotaFiscal);
                   mskedNumNota.Text:=IntToStr(iNumNotaFiscal);
                end;
           end;
          cdsContratos.Next;
        end;
        Gimp.Finalizar;
        cdsContratos.Close;
        cdsContratos.Open;
    end
   else
    begin
       if (Trim(cbModeloImpFiscal.Text)='') then
        begin
           MsgDlg('O Modelo de Impressora não foi informado','Atenção',mtWarning,[mbOk],0);
           cbModeloImpFiscal.SetFocus;
           Exit;
        end;
       if (redPorta.Value<1) then
        begin
           MsgDlg('Porta de impressora inválida','Atenção',mtWarning,[mbOk],0);
           redPorta.SetFocus;
           Exit;
        end;

       try
          Hasar:=TImpressao.Create(Trunc(redPorta.Value));
          try
             Hasar.Conectar(cbModeloImpFiscal.ItemIndex+1);
             Hasar.Inicializar;

             Hasar.Cabecalho[0]:=Trim(edCabLinha1.Text);
             Hasar.Cabecalho[1]:=Trim(edCabLinha2.Text);

             Hasar.Rodape[0]:=Trim(edRodLinha1.Text);
             Hasar.Rodape[1]:=Trim(edRodLinha2.Text);

             sEnderecoCliente:=cdsContratos.FieldByName('LOGRADOURO').AsString+' - '+
                               cdsContratos.FieldByName('BAIRRO').AsString+' - '+
                               cdsContratos.FieldByName('CIDADE').AsString+' - '+
                               cdsContratos.FieldByName('ESTADO').AsString;

             Hasar.DadosCliente(cdsContratos.FieldByName('RAZAOSOCIAL').AsString,
                                cdsContratos.FieldByName('CNPJ').AsString,
                                FACTURA_B,TIPO_CUIT,sEnderecoCliente);

             cdsContratos.First;
             while not(cdsContratos.Eof) do
             begin
                if cdsContratos.FieldByName('IMPRIMENOTA').AsString='S' then
                 begin
                    //Busca dados da NF
                    qryDadosNF.Close;
                    qryDadosNF.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
                    qryDadosNF.ParamByName('IDContrato').AsFloat:=
                               cdsContratos.FieldByName('IDCONTRATO').AsFloat;
                    qryDadosNF.ParamByName('DataVenc').AsString:=FormatDateTime('dd/mm/yyyy',
                               cdsContratos.FieldByName('DATAVENCPARCELA').AsDateTime);
                    qryDadosNF.Open;
                    qryDadosNF.First;

                    if ImprimeNFImpFiscal then
                     begin
                        //Grava o Número da Nota Fiscal nos registros que a compõe
                        iNumNotaFiscal:=Hasar.GetNumFatura(FACTURA_B);
                        qryDadosNF.First;
                        while not(qryDadosNF.Eof) do
                        begin
                           qryDadosNF.Edit;
                           qryDadosNF.FieldByName('NUMNOTAFISCAL').AsFloat:=iNumNotaFiscal;
                           qryDadosNF.FieldByName('DATAEMISSNF').AsDateTime:=Date;
                           qryDadosNF.Post;
                           qryDadosNF.Next;
                        end;
                        qryDadosNF.ApplyUpdates;
                        qryDadosNF.Close;
                     end;
                 end;
                cdsContratos.Next;
             end;
             Hasar.Finalizar;
          finally
             Hasar.Destroy;
          end;

          cdsContratos.Close;
          cdsContratos.Open;
       except
          on E:Exception do MsgDlg(E.Message,'Erro',mtError,[mbOk],0);
       end;
    end;
end;

function TfrmImpressaoNotas.ImprimeNF(iNumNota:Integer): Boolean;
var
   TxtNF               : TStringList;
   iColuna             : Integer;
   iLinha              : Integer;
   iLinhaAux           : Integer;
   sValor              : String;
   rTotalNota          : Real;
   rImposto            : Real;
   rValorLiq           : Real;
   sRestoTexto         : String;
   iNumMaxLinhas       : Integer;
   bLinhasDetalhe      : Boolean;
   bMostraIdentImposto : Boolean;
   PosicaoInicDetalhe  : TBookmark;
begin
   Result:=True;
   sRestoTexto:='';
   bMostraIdentImposto:=False;
   TxtNF:=TStringList.Create;
   try
      rTotalNota:=GeraTotalNota;
      rImposto:=0;
      if (Trim(dblcImposto.Text)<>'') then
          rImposto:=Abs(GeraTotalImposto(Sistema.IdEmpresa,
                                         cdsContratos.FieldByName('IDContrato').AsFloat,
                                         StrToFloat(dblcImposto.LookupValue),0,
                                         cdsContratos.FieldByName('DATAVENCPARCELA').AsDateTime,
                                         rAliquota));

      rValorLiq:=rTotalNota-rImposto;

      //Impressão das Linhas
      qryDadosNF.First;
      iNumMaxLinhas:=qryModelosNF.FieldByName('NUMLINHASNOTA').AsInteger;

      iLinha:=0;
      sValor:='';
      bLinhasDetalhe:=False;
      TxtNF.Clear;

      for iLinha:=1 to iNumMaxLinhas do
      begin
         if (iLinha>TxtNF.Count) then
            TxtNF.Add('')
         else
            sValor:=TxtNF.Strings[iLinha-1];

         if (iLinha<qryModelosNF.FieldByName('LINDETINICIAL').AsInteger) or
            (iLinha>qryModelosNF.FieldByName('LINDETFINAL').AsInteger) then
          begin
             //Linhas de Cabeçalho/Rodapé da Nota

             //Procura no Modelo da NF a Linha corrente
             qryComposicaoNF.First;
             if not(qryComposicaoNF.Locate('Linha',iLinha,[])) then Continue;

             //Loop para montagem da linha da Nota 
             while (qryComposicaoNF.FieldByName('Linha').AsInteger=iLinha) and
                   not(qryComposicaoNF.Eof) do
             begin
                iColuna:=qryComposicaoNF.FieldByName('Coluna').AsInteger;
                sValor:='';

                case qryComposicaoNF.FieldByName('IDCompNF').AsInteger of
                    1: sValor:=IntToStr(iNumNota); //Número da Nota
                    2: sValor:=edNatServicos.Text; //Natureza do Serviço
                    3: sValor:=FormatDateTime('dd/mm/yyyy',dtpDataEmissao.Date); //Data da Emissão
                    4: sValor:=FormatFloat('#,##0.00',rTotalNota); //Valor Total da Nota
                    5: sValor:=IntToStr(iNumNota); //Número da Nota
                    6: sValor:=FormatDateTime('dd/mm/yyyy',
                                             cdsContratos.FieldByName('DATAVENCPARCELA').AsDateTime); //Data de Vencimanto
                    7: sValor:='Desconto'; //Descontos
                    8: sValor:=edCondEspeciais.Text; //Condições Especiais
                    9: sValor:=cdsContratos.FieldByName('RAZAOSOCIAL').AsString; //Razão Social
                   10: sValor:=cdsContratos.FieldByName('LOGRADOURO').AsString; //Logradouro
                   11: sValor:=cdsContratos.FieldByName('BAIRRO').AsString; //Bairro
                   12: sValor:=cdsContratos.FieldByName('CIDADE').AsString; //Cidade
                   13: sValor:=cdsContratos.FieldByName('ESTADO').AsString; //Estado
                   14: sValor:=cdsContratos.FieldByName('CEP').AsString; //CEP
                   15: sValor:='Praça de Pagamento';
                   16: begin //CNPJ
                          sValor:=Trim(cdsContratos.FieldByName('CNPJ').AsString);
                          mskedMascaras.EditMask:='AA.AAA.AAA/AAAA-99;0; ';
                          mskedMascaras.Text:=sValor;
                          sValor:=mskedMascaras.EditText;
                       end;
                   17: begin //Inscrição Estadual/Municipal
                          sValor:='';
                          qryAux.Close;
                          qryAux.SQL.Text:='SELECT '+
                                           '   IE.NUMDOCUMENTO AS INSCESTADUAL, '+
                                           '   IE.MASCARA AS MASCARAE, '+
                                           '   IM.NUMDOCUMENTO AS INSCMUNICIPAL, '+
                                           '   IM.MASCARA AS MASCARAM '+
                                           'FROM '+
                                           '   (SELECT D.IDPESSOA,D.NUMDOCUMENTO, TD.MASCARA '+
                                           '    FROM DOCPESSOA D, TIPODOCPESSOA TD '+
                                           '    WHERE (D.IDPESSOA = '+FloatToStr(Sistema.IdEmpresa)+
                                                     ') AND '+
                                           '          (D.IDDOCUMENTO = TD.IDDOCUMENTO) AND '+
                                           '          (D.IDDOCUMENTO IN (SELECT INSCESTADUAL '+
                                           '                             FROM PARAMGLOBAL '+
                                           '                             WHERE (IDPESSOA = '+
                                                FloatToStr(Sistema.IdEmpresa)+')))) IE, '+
                                           '   (SELECT D.IDPESSOA,D.NUMDOCUMENTO, TD.MASCARA '+
                                           '    FROM DOCPESSOA D, TIPODOCPESSOA TD '+
                                           '    WHERE (D.IDPESSOA = '+FloatToStr(Sistema.IdEmpresa)+
                                                      ') AND '+
                                           '          (D.IDDOCUMENTO = TD.IDDOCUMENTO) AND '+
                                           '          (D.IDDOCUMENTO IN (SELECT INSCMUNICIPAL '+
                                           '                             FROM PARAMGLOBAL '+
                                           '                             WHERE (IDPESSOA = '+
                                                FloatToStr(Sistema.IdEmpresa)+')))) IM '+
                                           'WHERE '+
                                           '   (IE.IDPESSOA = '+FloatToStr(Sistema.IdEmpresa)+') AND '+
                                           '   (IE.IDPESSOA = IM.IDPESSOA) ';
                          qryAux.Open;

                          if (Trim(qryAux.FieldByName('INSCESTADUAL').AsString)<>'') then
                           begin
                              mskedMascaras.EditMask:=qryAux.FieldByName('MASCARAE').AsString+';0; ';
                              mskedMascaras.Text:=qryAux.FieldByName('INSCESTADUAL').AsString;
                           end
                          else
                           if (Trim(qryAux.FieldByName('INSCMUNICIPAL').AsString)<>'') then
                            begin
                               mskedMascaras.EditMask:=qryAux.FieldByName('MASCARAM').AsString+';0; ';
                               mskedMascaras.Text:=qryAux.FieldByName('INSCMUNICIPAL').AsString;
                            end
                           else
                            begin
                               mskedMascaras.EditMask:='';
                               mskedMascaras.Text:='ISENTA';
                            end;

                          sValor:=mskedMascaras.EditText;
                       end;
                   18: begin //Extenso
                          Extenso.SetaMoedaPadrao;
                          Extenso.SetaIdiomaPadrao;
                          Extenso.Valor:=rTotalNota;
                          Extenso.Escreve;
                          sValor:=Extenso.LinhasExtenso.Linha1;
                       end;
                   24: sValor:=FormatFloat('#,##0.00',rTotalNota); //Total da Nota
                   25: sValor:=FormatFloat('#,##0.00',rImposto); //Imposto
                   26: sValor:=FormatFloat('#,##0.00',rValorLiq); //Valor Líquido
                   27: begin //Descrição do Imposto
                          sValor:=edDescImposto.Text;
                          if chbExibeIdentImposto.Checked then sValor:=sValor+' (*)';
                       end;
                   28: sValor:=edPrestacaoServ.Text; //Descrição de Prestação de Serviço
                end; //Fim Linhas de Cabeçalho/Rodapé da Nota

                if (Length(sValor)>qryComposicaoNF.FieldByName('TAMANHO').AsInteger) then
                    GeraMultiplasLinhas(sValor,iColuna,iLinha,
                                        qryComposicaoNF.FieldByName('TAMANHO').AsInteger,
                                        iNumMaxLinhas,TxtNF)
                else
                 begin
                    sValor:=AlinhaTexto(sValor,
                                        qryComposicaoNF.FieldByName('FLGALINHAMENTO').AsString,
                                        qryComposicaoNF.FieldByName('Tamanho').AsInteger);
                    PosicionaValor(TxtNF,iColuna,iLinha,sValor);
                 end;

                qryComposicaoNF.Next;
             end;
          end
         else
          begin
             //Linhas Detalhe

             //Obs: Todo os campos que formam a área de detalhe da nota  devem estar posicionados na
             //     primeira linha que foi definida como detalhe


             if not(qryComposicaoNF.Locate('Linha',qryModelosNF.FieldByName('LINDETINICIAL').AsInteger,
                                           [])) or (qryDadosNF.Eof) then Continue;

             while (qryComposicaoNF.FieldByName('Linha').AsInteger=
                    qryModelosNF.FieldByName('LINDETINICIAL').AsInteger) and
                    not(qryComposicaoNF.Eof) and not(qryDadosNF.Eof) do
             begin
                iColuna:=qryComposicaoNF.FieldByName('Coluna').AsInteger;
                sValor:='';

                case qryComposicaoNF.FieldByName('IDCompNF').AsInteger of
                   19: begin //Descrição dos itens da Nota
                          sValor:=qryDadosNF.FieldByName('NOME_ITEM').AsString+' / '+
                                  qryDadosNF.FieldByName('NOMEOBJETO').AsString;
                          if (chbExibeIdentImposto.Checked) and
                             (Abs(GeraTotalImposto(Sistema.IdEmpresa,
                                  cdsContratos.FieldByName('IDContrato').AsFloat,
                                  StrToFloat(dblcImposto.LookupValue),
                                  qryDadosNF.FieldByName('IDPARCELA').AsFloat,
                                  cdsContratos.FieldByName('DATAVENCPARCELA').AsDateTime,rAliquota))<>0) then
                              sValor:=sValor+'(*)';
                       end;
                   20: sValor:='Unidade de Medida'; //Unidade de Medida
                   21: sValor:=FormatFloat('0000',qryDadosNF.FieldByName('QTDEPARCELA').AsFloat); // Quantidade
                   22: sValor:=FormatFloat('#,##0.00',
                                           qryDadosNF.FieldByName('VALOROBJPARCELA').AsFloat); //Valor do item
                   23: sValor:=FormatFloat('#,##0.00',
                                           qryDadosNF.FieldByName('VLRMOEDACORRENTE').AsFloat); //Valor total do item
                end;

                if (Length(sValor)>qryComposicaoNF.FieldByName('TAMANHO').AsInteger) then
                   GeraMultiplasLinhas(sValor,iColuna,iLinha,
                                       qryComposicaoNF.FieldByName('TAMANHO').AsInteger,
                                       iNumMaxLinhas,TxtNF)

                else
                 begin
                    sValor:=AlinhaTexto(sValor,
                                        qryComposicaoNF.FieldByName('FLGALINHAMENTO').AsString,
                                        qryComposicaoNF.FieldByName('Tamanho').AsInteger);
                    PosicionaValor(TxtNF,iColuna,iLinha,sValor);
                 end;

                if not(qryComposicaoNF.Eof) then qryComposicaoNF.Next;
             end;
             if not(qryDadosNF.Eof) then qryDadosNF.Next;
          end;
      end; //Fim do for

     //Grava arquivo texto
     //ImprimePágina
     for iLinha:=0 to TxtNF.Count-1 do
         Gimp.ImprimirTexto(TxtNF.Strings[iLinha]);

   finally
      TxtNF.Free;
   end;
end;

function TfrmImpressaoNotas.ImprimeNFImpFiscal: Boolean;
var
   rValorImposto    : Double;
   sDescricaoItem   : String;
begin
   Result:=True;

   Hasar.AbrirComprovanteFiscal(TIPO_LC);

   qryDadosNF.First;
   while not(qryDadosNF.Eof) do
   begin
      rAliquota:=0;
      rValorImposto:=GeraTotalImposto(Sistema.IdEmpresa,
                                      cdsContratos.FieldByName('IDContrato').AsFloat,
                                      0,qryDadosNF.FieldByName('IDPARCELA').AsFloat,
                                      cdsContratos.FieldByName('DATAVENCPARCELA').AsDateTime,
                                      rAliquota);

      //A linha abaixo é usada para testes com bases com dados em Português
      sDescricaoItem:=Trim(qryDadosNF.FieldByName('NOME_ITEM').AsString)+' / '+
                      Trim(qryDadosNF.FieldByName('NOMEOBJETO').AsString);

      Hasar.ImprimirItem(sDescricaoItem,
                         Trunc(qryDadosNF.FieldByName('QTDEPARCELA').AsFloat),
                         qryDadosNF.FieldByName('VALOROBJPARCELA').AsFloat,
                         rAliquota);
      qryDadosNF.Next;
   end;

   Hasar.SubTotal(True);
   Hasar.FecharComprovanteFiscal;
end;

function TfrmImpressaoNotas.GeraTotalNota: Real;
begin
   Result:=0;
   qryDadosNF.First;
   while not(qryDadosNF.Eof) do
   begin
      Result:=Result+qryDadosNF.FieldByName('VLRMOEDACORRENTE').AsFloat;
      qryDadosNF.Next;
   end;
end;

function TfrmImpressaoNotas.GeraTotalImposto(rIDPessoa, rIDContrato, rCodAlterador, rIDParcela: Double;
                                             dDataVencParc: TDateTime; var rAliquota: Double): Real;
var
   sSql : String;
begin
   Result:=0;
   qryAux.Close;

   sSql:='SELECT II.ALIQUOTA,NVL(SUM(DECODE(L.DEBCRE,''C'',L.VALOR,-L.VALOR)),0) AS IMPOSTO '+
         'FROM LANCTODOCUM L, IMPOSTORETIDO II '+
         'WHERE  ';

   if (rCodAlterador=0) then
      sSql:=sSql+'       (L.CODALTERADOR IN (SELECT CODALTERADOR '+
                 '                           FROM IMPOSTOIMPNF '+
                 '                           WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+'))) AND '
   else
      sSql:=sSql+'       (L.CODALTERADOR = '+FloatToStr(rCodAlterador)+') AND ';
      
   sSql:=sSql+'       (II.CODDOCUMENTO = L.CODDOCUMENTO) AND '+
         '       (II.NUMLANCTO = L.NUMLANCTO) AND '+
         '       (EXISTS (SELECT P.CODDOCUMENTO '+
         '                FROM PARCELAREALCONTR P, '+
         '                     TIPOAGRE T, '+
         '                     DOCUMENTO D, '+
         '                     IMPOSTORETIDO I, '+
         '                     OBJETOXITEM OI, '+
         '                     TIPORECEBDESEMB TRD '+
         '                WHERE (P.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '                      (P.IDCONTRATO = '+FloatToStr(rIDContrato)+') AND ';

   if (rIDParcela<>0) then
       sSql:=sSql+'                      (P.IDPARCELA = '+FloatToStr(rIDParcela)+') AND ';

   sSql:=sSql+'                      (D.CODDOCUMENTO = P.CODDOCUMENTO) AND '+
              '                      (I.CODDOCUMENTO = P.CODDOCUMENTO) AND '+
              '                      (T.CODTIPOCUSTAGREG = I.CODTIPOCUSTAGREG) AND '+
              '                      (OI.IDOBJETO = P.IDOBJETO) AND '+
              '                      (OI.IDITEM = P.IDITEM) AND '+
              '                      (OI.CODTIPRECDES = TRD.CODTIPRECDES) AND '+
              '                      (OI.RECPAG = TRD.RECPAG) AND '+
              '                      (OI.IDPESSOA = TRD.IDPESSOA) AND '+
              '                      (TRD.FLGCALCULAIMPOSTO = ''S'') AND '+
              '                      (P.DATAVENCPARCELA = TO_DATE('''+
              FormatDateTime('dd/mm/yyyy',dDataVencParc)+''',''dd/mm/yyyy'')) AND '+
              '                      (P.CODDOCUMENTO = L.CODDOCUMENTO )) ) '+
              'GROUP BY II.ALIQUOTA';
   qryAux.SQL.Text:=sSql;
   qryAux.Open;
   
   Result:=qryAux.FieldByName('IMPOSTO').AsFloat;
   rAliquota:=qryAux.FieldByName('ALIQUOTA').AsFloat;

   qryAux.Close;
end;

procedure TfrmImpressaoNotas.PosicionaValor(var Txt: TStringList; iColuna,
  iLinha: Integer; Valor: String);
begin
   Txt.Strings[iLinha-1]:=JuntaString((Replicate(' ',iColuna-1)+Valor),Txt.Strings[iLinha-1]);
end;

function TfrmImpressaoNotas.Replicate(sPadrao: String;
  iNumVezes: Integer): String;
var
   iVezes : Integer;
begin
   Result:='';
   if (iNumVezes<1) or (sPadrao='') then Exit;
   for iVezes:=1 to iNumVezes do Result:=Result+sPadrao;
end;

function TfrmImpressaoNotas.JuntaString(sA, sB: String): String;
var
   INumCarA  : Integer;
   INumCarB  : Integer;
   iCar      : Integer;
   iTotalCar : Integer;
   cCar      : Char;
   cCarA     : Char;
   cCarB     : Char;
begin
   Result:='';
   INumCarA:=Length(sA);
   INumCarB:=Length(sB);

   iTotalCar:=INumCarA;
   if (INumCarB>INumCarA) then iTotalCar:=INumCarB;

   for iCar:=1 to iTotalCar do
   begin
      cCar:=#32;
      cCarA:=#32;
      if iCar<=INumCarA then cCarA:=sA[iCar];
      cCarB:=#32;
      if iCar<=INumCarB then cCarA:=sB[iCar];


      if (cCarA<>cCarB) and (cCarA>#32) and (cCarB>#32) then
         cCar:=Char('#')
      else
         if (cCarA>#32) then
            cCar:=cCarA
         else
            cCar:=cCarB;

      Result:=Result+cCar;
   end;
end;

function TfrmImpressaoNotas.AlinhaTexto(sTexto, sAlinhamento: String;
  iTamanho: Integer): String;
var
   iNumCar : Integer;
begin
   Result:=Trim(sTexto);
   iNumCar:=Length(sTexto);
   if (iNumCar<iTamanho) then
    begin
       if (UpperCase(sAlinhamento)='C') then
           Result:=Replicate(' ',((iTamanho-iNumCar) div 2))+Trim(Result);
       if (UpperCase(sAlinhamento)='D') then
           Result:=Replicate(' ',(iTamanho-iNumCar))+Trim(Result);
    end;
end;

procedure TfrmImpressaoNotas.GeraMultiplasLinhas(sTexto: String; iColuna, iLinha, iTamanho,
                                                 iNumMaxLinhas: Integer; TextoNF: TStringList);
var
   sRestoTexto : String;
   iLinhaAux   : Integer;
begin
   iLinhaAux:=iLinha;
   sRestoTexto:='XXXX'; //qualquer coisa
   while (sRestoTexto<>'') do
   begin
      TruncaTexto(sTexto,sRestoTexto,qryComposicaoNF.FieldByName('TAMANHO').AsInteger);
      sTexto:=AlinhaTexto(sTexto,qryComposicaoNF.FieldByName('FLGALINHAMENTO').AsString,
                          qryComposicaoNF.FieldByName('Tamanho').AsInteger);
      if (iLinhaAux<>iLinha) then TextoNF.Add('');
      PosicionaValor(TextoNF,iColuna,iLinhaAux,sTexto);
      Inc(iLinhaAux);
      sTexto:=sRestoTexto;
   end;
end;

procedure TfrmImpressaoNotas.TruncaTexto(var sTexto, sRestoTexto: String; iTamanho: Integer);
var
   iCar : integer;
begin
   sTexto:=Trim(sTexto);
   sRestoTexto:='';
   if (Length(sTexto)<=iTamanho) then Exit;
   for iCar:=iTamanho downto 1 do
   begin
       if (sTexto[iCar]=#32) then
        begin
           sRestoTexto:=Copy(sTexto,(iCar+1),(Length(sTexto)-iCar));
           sTexto:=Copy(sTexto,1,iCar);
           Break;
        end;

       if (iCar=1) then
        begin
           sRestoTexto:=Copy(sTexto,(iTamanho+1),(Length(sTexto)-iTamanho));
           sTexto:=Copy(sTexto,1,iTamanho);
        end;
   end;
end;

function TfrmImpressaoNotas.SubstCarEspeciais(sTexto: String): String;
begin
   {Esta procedure foi implementada para retirar alguns caracteres especiais dos dados em
    uso. Caso muito comum quando se usando dados de clientes de outros países}

   Result:=StringReplace(sTexto,'Á','A',[rfReplaceAll]);
   Result:=StringReplace(Result,'À','A',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ã','A',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ä','A',[rfReplaceAll]);
   Result:=StringReplace(Result,'Â','A',[rfReplaceAll]);

   Result:=StringReplace(Result,'á','a',[rfReplaceAll]);
   Result:=StringReplace(Result,'à','a',[rfReplaceAll]);
   Result:=StringReplace(Result,'ã','a',[rfReplaceAll]);
   Result:=StringReplace(Result,'ä','a',[rfReplaceAll]);
   Result:=StringReplace(Result,'â','a',[rfReplaceAll]);

   Result:=StringReplace(Result,'É','E',[rfReplaceAll]);
   Result:=StringReplace(Result,'È','E',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ë','E',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ê','E',[rfReplaceAll]);

   Result:=StringReplace(Result,'é','e',[rfReplaceAll]);
   Result:=StringReplace(Result,'è','e',[rfReplaceAll]);
   Result:=StringReplace(Result,'ë','e',[rfReplaceAll]);
   Result:=StringReplace(Result,'ê','e',[rfReplaceAll]);

   Result:=StringReplace(Result,'Í','I',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ì','I',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ï','I',[rfReplaceAll]);
   Result:=StringReplace(Result,'Î','I',[rfReplaceAll]);

   Result:=StringReplace(Result,'í','i',[rfReplaceAll]);
   Result:=StringReplace(Result,'ì','i',[rfReplaceAll]);
   Result:=StringReplace(Result,'ï','i',[rfReplaceAll]);
   Result:=StringReplace(Result,'î','i',[rfReplaceAll]);

   Result:=StringReplace(Result,'Ó','O',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ò','O',[rfReplaceAll]);
   Result:=StringReplace(Result,'Õ','O',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ö','O',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ô','O',[rfReplaceAll]);

   Result:=StringReplace(Result,'ó','o',[rfReplaceAll]);
   Result:=StringReplace(Result,'ò','o',[rfReplaceAll]);
   Result:=StringReplace(Result,'õ','o',[rfReplaceAll]);
   Result:=StringReplace(Result,'ö','o',[rfReplaceAll]);
   Result:=StringReplace(Result,'ô','o',[rfReplaceAll]);

   Result:=StringReplace(Result,'Ú','U',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ù','U',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ü','U',[rfReplaceAll]);
   Result:=StringReplace(Result,'Û','U',[rfReplaceAll]);

   Result:=StringReplace(Result,'ú','u',[rfReplaceAll]);
   Result:=StringReplace(Result,'ù','u',[rfReplaceAll]);
   Result:=StringReplace(Result,'ü','u',[rfReplaceAll]);
   Result:=StringReplace(Result,'û','u',[rfReplaceAll]);

   Result:=StringReplace(Result,'Ç','C',[rfReplaceAll]);
   Result:=StringReplace(Result,'ç','c',[rfReplaceAll]);
end;

procedure TfrmImpressaoNotas.grdContratosTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
   if (AFieldName='NOMECONTRATO') then cdsContratos.IndexName:='indContrato';
   if (AFieldName='NODOCUMENTO') then cdsContratos.IndexName:='indDocumento';
   if (AFieldName='DATAVENCPARCELA') then cdsContratos.IndexName:='indDataVencParc';
end;

end.

