unit FImportaAplicacoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBTables, Db, Wwquery, ComCtrls;

type
  TfrmImportaAplicacoes = class(TfrmOkCancelar)
    OpenDialogImportacaoAplicacao: TOpenDialog;
    Label1: TLabel;
    edNomeArq: TEdit;
    bbtnProcurar: TBitBtn;
    qryAplicacoes: TwwQuery;
    updAplicacoes: TUpdateSQL;
    qryAplicacoesCODLANCAPLIC: TFloatField;
    qryAplicacoesTIPOAPLICACAO: TFloatField;
    qryAplicacoesMOEDACOTA: TFloatField;
    qryAplicacoesVALOR: TFloatField;
    qryAplicacoesPRAZORESGATE: TFloatField;
    qryAplicacoesJUROSPREVISTOS: TFloatField;
    qryAplicacoesDATAPREVRESGATE: TDateTimeField;
    qryAplicacoesDATALANCAMENTO: TDateTimeField;
    qryAplicacoesNUMCOTAS: TFloatField;
    qryAplicacoesVLRRESGPREV: TFloatField;
    qryAplicacoesPERCUSTO: TFloatField;
    qryAplicacoesPERCUSTOREND: TFloatField;
    qryAplicacoesIDPESSOA: TFloatField;
    rchedErros: TRichEdit;
    qryTiposAplicacao: TwwQuery;
    qryMoedas: TwwQuery;
    qryTiposAplicacaoTIPOAPLICACAO: TFloatField;
    qryMoedasMOECODIGO: TFloatField;
    qryMoedasMOEDESC: TStringField;
    lblLog: TLabel;
    qryAplicacoesAPLICRESGATEJUROS: TStringField;
    qryAplicacoesCONTAAPLICACAO: TFloatField;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    function GravaDados(sLinha: String): Boolean;
    function ConvToNum(sNumero: String): Real;
    function ConvToDate(sData: String): TDateTime;
  public
    { Public declarations }
  end;

var
  frmImportaAplicacoes: TfrmImportaAplicacoes;

implementation

{$R *.DFM}

uses uDataBase,uSistema,uMensErro;

procedure TfrmImportaAplicacoes.bbtnProcurarClick(Sender: TObject);
begin
   inherited;
   OpenDialogImportacaoAplicacao.FileName:='';
   OpenDialogImportacaoAplicacao.Execute;
   edNomeArq.Text:=OpenDialogImportacaoAplicacao.FileName;
end;

procedure TfrmImportaAplicacoes.bbtnConfirmarClick(Sender: TObject);
var
   Arq        : TextFile;
   ArqErro    : TextFile;
   sLinha     : String;
   iNumTransf : Integer;
   iNumErros  : Integer;
   bEscreveu  : Boolean;
   sNomeLog   : String;
   sNomeErro  : String;
begin
  inherited;

  iNumTransf:=0;
  iNumErros:=0;
  sNomeLog:='';
  sNomeErro:='';
  bEscreveu:=False;

  //Gera nome dos Arquivos de Log e de Erros
  sNomeLog:='Log_'+ExtractFileName(edNomeArq.Text);
  sNomeErro:='Erro_'+ExtractFileName(edNomeArq.Text);

  if Trim(edNomeArq.Text)='' then
   begin
      MsgDlg('O Nome do arquivo não pode ser deixado em branco !','Erro',mtError,[mbOk],0);
      Exit;
   end
  else
   if not(FileExists(Trim(edNomeArq.Text))) then
    begin
       MsgDlg('Arquivo ('+ExtractFileName(edNomeArq.Text)+') não encontrado !','Erro',mtError,[mbOk],0);
       Exit;
    end;

   rchedErros.Lines.Clear;
   qryAplicacoes.Open;

   //Abre Arquivo de Aplicações
   AssignFile(Arq,edNomeArq.Text);
   Reset(Arq);

   //Cria Arquivo de Erros
   AssignFile(ArqErro,ExtractFilePath(edNomeArq.Text)+sNomeErro);
   Rewrite(ArqErro);

   lblLog.Caption:=lblLog.Caption+' ('+ExtractFilePath(edNomeArq.Text)+sNomeLog+')';
   lblLog.Refresh;
   try
      rchedErros.SelAttributes.Color:=clGreen;
      rchedErros.SelAttributes.Style:=[];      
      rchedErros.Lines.Add('Importação Iniciada');
      rchedErros.Lines.Add('===================');
      rchedErros.Lines.Add('');
      while not(Eof(Arq)) do
      begin
         Readln(Arq,sLinha);
         if (Trim(sLinha)<>'') and
            (Copy(Trim(sLinha),1,3)<>'-->') and (Copy(Trim(sLinha),1,3)<>'===')then
            if GravaDados(sLinha) then
               Inc(iNumTransf)
            else
             begin
                Inc(iNumErros);
                if bEscreveu then
                   Writeln(ArqErro,sLinha)
                else
                 begin
                    Writeln(ArqErro,'');
                    Writeln(ArqErro,'--> Transferência de: '+FormatDateTime('dd/mm/yyyy hh:nn',now));
                    Writeln(ArqErro,'======================================');
                    Writeln(ArqErro,sLinha);
                    bEscreveu:=True;
                 end;
             end;
      end;
   finally
      CloseFile(Arq);
      CloseFile(ArqErro);
   end;

   if not(qryAplicacoes.IsEmpty) then
    begin
       qryAplicacoes.First;
       while not(qryAplicacoes.Eof) do
       begin
          qryAplicacoes.Edit;
          qryAplicacoesCODLANCAPLIC.AsFloat:=LeUltRegistro(nil,'APLICACOES');
          qryAplicacoesCONTAAPLICACAO.AsFloat:=qryAplicacoesCODLANCAPLIC.AsFloat;
          qryAplicacoes.Post;
          qryAplicacoes.Next;
       end;

       qryAplicacoes.ApplyUpdates;
       qryAplicacoes.CancelUpdates;
       qryAplicacoes.Close;
    end;

   rchedErros.SelAttributes.Color:=clRed;    
   rchedErros.Lines.Add('');
   rchedErros.Lines.Add('Importação Concluída');
   rchedErros.Lines.Add('====================');
   rchedErros.SelAttributes.Style:=[fsBold];
   rchedErros.SelAttributes.Color:=clGreen;
   rchedErros.Lines.Add('Registros Transferidos: '+FormatFloat('000,000',iNumTransf));
   rchedErros.SelAttributes.Color:=clRed;
   rchedErros.Lines.Add('Registros com Erro    : '+FormatFloat('000,000',iNumErros));
   rchedErros.SetFocus;
   rchedErros.SelStart:=Length(rchedErros.Text);
   rchedErros.SelLength :=0;
   //Grava Log de Transferência
   rchedErros.Lines.SaveToFile(ExtractFilePath(edNomeArq.Text)+sNomeLog);

   MsgDlg('Importação Concluída !'+#10+#13+
          'Possíveis registros não Transferidos encontram-se em:'+#10+#13+sNomeErro,
          'Atenção',mtInformation,[mbOk],0);
end;

function TfrmImportaAplicacoes.GravaDados(sLinha: String): Boolean;
type
   Registro = record
                 TipoAplicacao   : Real;
                 Valor           : Real;
                 PrazoResgate    : Real;
                 JurosPrevistos  : Real;
                 PrazoJuros      : String; //ainda não usado
                 DataPrevResgate : TDateTime;
                 DataAplicacao   : TDateTime;
                 NumeroCotas     : Real;
                 MoedaCota       : Real;
                 ValorResgPrev   : Real;
                 PercentualCusto : Real;
                 PercCustoRend   : Real;
              end;
var
   bErro     : Boolean;
   iCampo    : Integer;
   iTamanho  : Integer;
   iPosicao  : Integer;
   sLinhaAux : String;
   sValor    : String;
   Reg       : Registro;
begin
   bErro:=False;
   iCampo:=1;
   sLinhaAux:=Trim(sLinha);
   while iCampo<=12 do
   begin
      iPosicao:=Pos('^',sLinhaAux);
      iTamanho:=Length(sLinhaAux);

      case iPosicao of
         0: sValor:=Trim(sLinhaAux);
         1: sValor:='';
      else
         sValor:=Trim(Copy(sLinhaAux,1,(iPosicao-1)));
      end;

      case iCampo of
         1: begin
               if sValor='' then
                begin
                   bErro:=True;
                   rchedErros.SelAttributes.Color:=clMaroon;
                   rchedErros.Lines.Add('Erro - Tipo de aplicação ('+sValor+') não Cadastrada na Linha:');
                   rchedErros.Lines.Add('       ['+sLinha+']');
                   Break;
                end
               else
                begin
                   qryTiposAplicacao.Close;
                   qryTiposAplicacao.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
                   qryTiposAplicacao.ParamByName('TipoAplicacao').AsString:=sValor;
                   qryTiposAplicacao.Open;
                   qryTiposAplicacao.First;
                   if qryTiposAplicacao.IsEmpty then
                    begin
                       bErro:=True;
                       rchedErros.SelAttributes.Color:=clMaroon;
                       rchedErros.Lines.Add('Erro - Tipo de aplicação ('+sValor+') não Cadastrada na Linha:');
                       rchedErros.Lines.Add('       ['+sLinha+']');
                       Break;
                    end
                   else
                    Reg.TipoAplicacao:=qryTiposAplicacaoTIPOAPLICACAO.AsFloat;
                   qryTiposAplicacao.Close;
                end;
            end;

         2: Reg.Valor:=ConvToNum(sValor);
         3: Reg.PrazoResgate:=ConvToNum(sValor);
         4: Reg.JurosPrevistos:=ConvToNum(sValor);
         //5: ainda não utilizado
         6: Reg.DataPrevResgate:=ConvToDate(sValor);
         7: Reg.DataAplicacao:=ConvToDate(sValor);
         8: Reg.NumeroCotas:=ConvToNum(sValor);
         9: begin
               if sValor='' then
                begin
                   bErro:=True;
                   rchedErros.SelAttributes.Color:=clBlue;
                   rchedErros.Lines.Add('Erro - Moeda ('+sValor+') não Cadastrada na Linha:');
                   rchedErros.Lines.Add('       ['+sLinha+']');
                   Break;
                end
               else
                begin
                   qryMoedas.Close;
                   qryMoedas.ParamByName('Moeda').AsString:=sValor;
                   qryMoedas.Open;
                   qryMoedas.First;
                   if qryMoedas.IsEmpty then
                    begin
                       bErro:=True;
                       rchedErros.SelAttributes.Color:=clBlue;
                       rchedErros.Lines.Add('Erro - Moeda ('+sValor+') não Cadastrada na Linha:');
                       rchedErros.Lines.Add('       ['+sLinha+']');
                       Break;
                    end
                   else
                    Reg.MoedaCota:=qryMoedasMOECODIGO.AsFloat;
                   qryMoedas.Close;
                end;
            end;
        10: Reg.ValorResgPrev:=ConvToNum(sValor);
        11: Reg.PercentualCusto:=ConvToNum(sValor);
        12: Reg.PercCustoRend:=ConvToNum(sValor);
      end;

      if iPosicao<>0 then
         sLinhaAux:=Copy(sLinhaAux,(iPosicao+1),(iTamanho-iPosicao));

      Inc(iCampo);
   end;

   if not(bErro) then
    begin
       qryAplicacoes.Append;
       qryAplicacoesTIPOAPLICACAO.AsFloat:=Reg.TipoAplicacao;
       qryAplicacoesVALOR.AsFloat:=Reg.Valor;
       qryAplicacoesPRAZORESGATE.AsFloat:=Reg.PrazoResgate;
       qryAplicacoesJUROSPREVISTOS.AsFloat:=Reg.JurosPrevistos;
       qryAplicacoesDATAPREVRESGATE.AsDateTime:=Reg.DataPrevResgate;
       qryAplicacoesDATALANCAMENTO.AsDateTime:=Reg.DataAplicacao;
       qryAplicacoesNUMCOTAS.AsFloat:=Reg.NumeroCotas;
       qryAplicacoesMOEDACOTA.AsFloat:=Reg.MoedaCota;
       qryAplicacoesVLRRESGPREV.AsFloat:=Reg.ValorResgPrev;
       qryAplicacoesPERCUSTO.AsFloat:=Reg.PercentualCusto;
       qryAplicacoesPERCUSTOREND.AsFloat:=Reg.PercCustoRend;
       qryAplicacoesIDPESSOA.AsFloat:=Sistema.IdEmpresa;
       qryAplicacoesAPLICRESGATEJUROS.AsString:='A';
       qryAplicacoes.Post;
    end;

    Result:=not(bErro);
end;

function TfrmImportaAplicacoes.ConvToNum(sNumero: String): Real;
begin
   try
      Result:=StrToFloat(sNumero);
   except
      Result:=0;
   end;
end;

function TfrmImportaAplicacoes.ConvToDate(sData: String): TDateTime;
begin
   if Length(sData)<8 then
      Result:=0
   else
      Result:=StrToDate(Copy(sData,7,2)+'/'+Copy(sData,5,2)+'/'+Copy(sData,1,4));
end;

end.
