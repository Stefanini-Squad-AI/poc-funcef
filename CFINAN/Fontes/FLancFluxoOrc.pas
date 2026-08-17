{-------------------------------------------------------------------------------
Desenvolvedor: Marcus Oliveira
Data         : 31/01/2007
Pendência    : 24363
Descrição    : Removido o owner CM. 
-------------------------------------------------------------------------------}
unit FLancFluxoOrc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, TREdit, Mask, 
  wwdblook, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList, DBCtrls;

type

   DadosMov = record
                 Atividade  : Real;
                 CRespon    : String;
                 TipoRecDes : String;
                 DataLanc   : TDateTime;
                 CodTipDoc  : Real;
                 IDPlano    : Real;
                 IDPatro    : Real;
              end;

  TfrmLancFluxoOrc = class(TfrmCadastroCS)
    DadosAlteraveis: TGroupBox;
    lblMoeda: TLabel;
    dblcMoeda: TwwDBLookupCombo;
    lblValorOutDet: TLabel;
    dbeValorMoeda: TRealEdit;
    lblValorDet: TLabel;
    dbeValor: TRealEdit;
    qryCentroRespon: TwwQuery;
    qryUnidNegoc: TwwQuery;
    qryTipoRD: TwwQuery;
    qryMoeda: TwwQuery;
    qryAux: TwwQuery;
    FlgPermiteLancamentos: TCheckBox;
    qryData: TwwQuery;
    qryDataDATACORRENTE: TStringField;
    qryDiasBloqueio: TwwQuery;
    qryDiasBloqueioDIASBLOQORCCP: TFloatField;
    qryDiasBloqueioDIASBLOQORCMP: TFloatField;
    qryDiasBloqueioDIASBLOQORCLP: TFloatField;
    qryTipoDocumento: TwwQuery;
    gbDadosBasicos: TGroupBox;
    lblUnidNegoc: TLabel;
    lblTipoRD: TLabel;
    lblCentroRespon: TLabel;
    lblData: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dblcUnidNegoc: TwwDBLookupCombo;
    dblcCentroRespon: TwwDBLookupCombo;
    dbeDataLanc: TCMDateTimePicker;
    DBEdNomeUsuario: TDBEdit;
    DBEdData: TDBEdit;
    dblcTipoDocurmento: TwwDBLookupCombo;
    dblcTipoRD: TwwDBLookupCombo;
    pnlPrevidenciario: TPanel;
    Label18: TLabel;
    dblcPatrocinador: TwwDBLookupCombo;
    Label19: TLabel;
    dblcPlanoPrev: TwwDBLookupCombo;
    qryPatro: TwwQuery;
    qryPatroRAZAOSOCIAL: TStringField;
    qryPatroIDPESSOA: TFloatField;
    qryPlanoPrev: TwwQuery;
    qryPlanoPrevNOME: TStringField;
    qryPlanoPrevIDPLANOPREV: TFloatField;
    qryDiasBloqueioDTCURTOPZ: TDateTimeField;
    qryDiasBloqueioDTMEDIOPZ: TDateTimeField;
    qryDiasBloqueioDTLONGOPZ: TDateTimeField;
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    procedure dblcMoedaExit(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure LimpaValores;
    procedure FazerQry(iIdFluxoOrcado:LongInt);
    procedure FormShow(Sender: TObject);
    procedure dblcCentroResponChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dblcTipoRDChange(Sender: TObject);

  private
    { Private declarations }
    dDataCorrente : TDateTime;
    rDiasBloqueio : Real;
    Ultimo        : DadosMov;
  public
    { Public declarations }
  end;

var
  frmLancFluxoOrc: TfrmLancFluxoOrc;
  iIdFluxoOrcado : LongInt;

implementation

{$R *.DFM}
uses uMensErro,uDataBase, DBaseDados,UModulo,uSistema,uFuncaoGeral,uDiasUteis;

procedure TfrmLancFluxoOrc.FormCreate(Sender: TObject);
begin
   inherited;
   qryData.Open;
   dDataCorrente:=qryDataDATACORRENTE.AsDateTime;
   qryData.Close;

   qryDiasBloqueio.Close;
   qryDiasBloqueio.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   qryDiasBloqueio.Open;

   if Modulo.sPrazoFluxoOrc ='C' then
      rDiasBloqueio:=qryDiasBloqueioDIASBLOQORCCP.AsFloat;
   if Modulo.sPrazoFluxoOrc ='M' then
      rDiasBloqueio:=qryDiasBloqueioDIASBLOQORCMP.AsFloat;
   if Modulo.sPrazoFluxoOrc ='L' then
      rDiasBloqueio:=qryDiasBloqueioDIASBLOQORCLP.AsFloat;
   qryDiasBloqueio.Close;
   if rDiasBloqueio=null then rDiasBloqueio:=0;

   if Sistema.UsaPlanoPatro then
    begin
       qryPatro.Open;
       qryPlanoPrev.Open;
       pnlPrevidenciario.Visible:=True;
    end;

   with Ultimo do
   begin
      Atividade:=0;
      CRespon:='';
      TipoRecDes:='';
      DataLanc:=Date;
      CodTipDoc:=0;
      IDPlano:=0;
      IDPatro:=0;
   end;
end;

procedure TfrmLancFluxoOrc.FormShow(Sender: TObject);
begin
   inherited;
   //
   pnlFundo.Enabled := False;
   //
   LimpaValores;
   //
   MontaSelect.Filtro.Add('FLUXOORCADO.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
   MontaSelect.Filtro.Add('FLUXOORCADO.PRAZO = '''+Modulo.sPrazoFluxoOrc+'''');
   //
   qryMoeda.Close;
   qryMoeda.SQL.Clear;
   qryMoeda.SQL.text := 'SELECT MOECODIGO,MOEDESC,MOESIGLA FROM MOEDA WHERE MOEINATIVO=''A''';
   qryMoeda.Open;
   //
   qryCentroRespon.Close;
   qryCentroRespon.SQL.Clear;


   qryCentroRespon.SQL.text:='SELECT DISTINCT '+
                             '   CR.CODCENTRORESPON, '+
                             '   CR.NOME '+
                             'FROM '+
                             '   CENTRESPON CR, '+
                             '   PESSOAXCRESP PCR '+
                             'WHERE '+
                             '   ((PCR.IDPESSOA=CR.IDPESSOA) AND '+
                             '    (PCR.CODCENTRORESPON=CR.CODCENTRORESPON) AND '+
                             '    (CR.IDPESSOA='+IntToStr(Sistema.idEmpresa)+') AND '+
                             '    (CR.CODCENTRORESPON <> ''9999999999'') AND '+
                             '    (CR.ANALITICOSINTET = ''A'') AND '+
                             '    (PCR.IDPESSOAACESSO = '+IntToStr(Sistema.IdUsuario)+' )) OR '+
                             '   (NOT EXISTS(SELECT 1 FROM PESSOAXCRESP PCR2 '+
                             '               WHERE (PCR2.IDPESSOAACESSO = '+IntToStr(Sistema.IdUsuario)+') AND '+
                             '                 (PCR2.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+'))) '+
                             'ORDER BY CR.NOME';

   qryCentroRespon.Open;
   qryCentroRespon.First;
   //
   qryTipoRD.Close;
   qryTipoRD.ParamByName('CodCentroRespon').AsString:=Trim(dblcCentroRespon.LookupValue);
   qryTipoRD.ParamByName('IDPessoa').AsFloat:=Sistema.idempresa;
   qryTipoRD.Open;
   //

   qryTipoDocumento.Close;
   qryTipoDocumento.ParamByName('RECPAG').AsString:='';
   qryTipoDocumento.Open;
   qryTipoDocumento.First;

   {if qryCentroRespon.IsEmpty then
   Begin
     qryCentroRespon.Close;
     qryCentroRespon.SQL.Clear;
     qryCentroRespon.SQL.text := 'SELECT CODCENTRORESPON,NOME '+
                                 'FROM CENTRESPON WHERE IDPESSOA = '+InttoStr(Sistema.IdEmpresa)+
                                 ' AND CODCENTRORESPON = ''9999999999''';
     qryCentroRespon.Open;
   end;}
   //
   qryUnidNegoc.Close;
   qryUnidNegoc.SQL.Clear;
   qryUnidNegoc.SQL.text := 'SELECT UNIDNEGOC,NOME FROM UNIDNEGOCIO WHERE IDPESSOA = '+InttoStr(Sistema.IdEmpresa)+' ORDER BY NOME';
   qryUnidNegoc.Open;
   //
end;

procedure TfrmLancFluxoOrc.CmeCadastroFind(Sender: TObject);
begin
   if MontaSelect.RetornouValor then
    begin
       FazerQry(StrToInt(MontaSelect.ValoresChave[0]));
       iIdFluxoOrcado := qry.FieldByName('IDFLUXOORCADO').AsInteger;

       if qryTipoRD.Locate('CodTipRecDes;RecPag',VarArrayOf([qry.FieldByName('CodTipRecDes').AsString,
                           qry.FieldByName('RecPag').AsString]),[loCaseInsensitive]) then
          dblcTipoRD.Text:=qryTipoRD.FieldByName('Descricao').AsString
       else
          dblcTipoRD.Text:='';

       qryTipoDocumento.Close;
       qryTipoDocumento.ParamByName('RECPAG').AsString:=qryTipoRD.FieldByName('RECPAG').AsString;
       qryTipoDocumento.Open;
    end;
end;

procedure TfrmLancFluxoOrc.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   pnlFundo.Enabled      := True;
   dbeValorMoeda.Value   := 0;
   dbeValor.Value        := 0;
   dbeValorMoeda.Enabled := False;
   dbeValor.Enabled      := True;
   qry.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   qry.FieldByName('PRAZO').AsString     := Modulo.sPrazoFluxoOrc;
   dblcUnidNegoc.SetFocus;
   dblcTipoDocurmento.Text:='';

   //Recupera Dados
   with Ultimo do
   begin
      qry.FieldByName('UNIDNEGOC').AsFloat:=Atividade;
      qry.FieldByName('CODCENTRORESPON').AsString:=CRespon;
      qry.FieldByName('CODTIPRECDES').AsString:=TipoRecDes;
      qry.FieldByName('DATAPROGRAMADA').AsDateTime:=DataLanc;
      qry.FieldByName('CODTIPDOC').AsFloat:=CodTipDoc;
      if Sistema.UsaPlanoPatro then
       begin
          qry.FieldByName('IDPLANOPREV').AsFloat:=IDPlano;
          qry.FieldByName('IDPATRO').AsFloat:=IDPatro;
       end;
   end;
end;

procedure TfrmLancFluxoOrc.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   pnlFundo.Enabled         := True;
   //gbDadosBasicos.Enabled   := False;
   if dbeValorMoeda.Value = 0 then
    begin
       dbeValorMoeda.Enabled := False;
       dbeValor.Enabled      := True;
    end
   else
    begin
       dbeValorMoeda.Enabled := True;
       dbeValor.Enabled      := False;
    end;
   dblcMoeda.SetFocus;
end;

procedure TfrmLancFluxoOrc.CmeCadastroConfirma(Sender: TObject);
var
   bFeriado : Boolean;
begin
   if qry.State in [dsInsert,dsEdit] then
    begin
       //Testa se a data é um feriado
       bFeriado:=False;
       if (Trim(dbeDataLanc.Text) <> '') then
        begin
           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Add('SELECT ES.IDPAIS, ES.CODESTADO, C.IDCIDADES ');
           qryAux.SQL.Add('FROM PESSOA P, ENDPESS E, CIDADES C, ESTADO  ES ');
           qryAux.SQL.Add('WHERE (P.IDPESSOA = '+IntToStr(Sistema.IDEmpresa)+') AND ');
           qryAux.SQL.Add('      (P.IDPESSOA = E.IDPESSOA) AND ');
           qryAux.SQL.Add('      (P.IDENDCOMERCIAL = E.IDENDERECO) AND ');
           qryAux.SQL.Add('      (E.IDCIDADES = C.IDCIDADES) AND ');
           qryAux.SQL.Add('      (C.IDESTADO = ES.IDESTADO) ');
           qryAux.Open;

           bFeriado:=DiasUteis.Feriado(dbeDataLanc.Date,
                                       qryAux.FieldByName('IDCIDADES').AsInteger,
                                       qryAux.FieldByName('IDPAIS').AsInteger,
                                       qryAux.FieldByName('CODESTADO').AsString,True,True);
           qryAux.Close;
        end;

       if Trim(dblcUnidNegoc.Text) = '' then
        begin
           MsgDlg('Obrigatório preencher a Atividade','Erro',mtError,[mbOk],0);
           dblcUnidNegoc.SetFocus;
           Abort;
        end;
       if Trim(dblcCentroRespon.Text) = '' then
        begin
           MsgDlg('Obrigatório preencher o Centro de Responsabilidade','Erro',mtError,[mbOk],0);
           dblcCentroRespon.SetFocus;
           Abort;
        end;
       if Trim(dblcTipoRD.Text) = '' then
        begin
           MsgDlg('Obrigatório preencher o Tipo de Recebimento/Desembolso','Erro',mtError,[mbOk],0);
           dblcTipoRD.SetFocus;
           Abort;
        end;
       if Trim(dblcTipoDocurmento.Text) = '' then
        begin
           MsgDlg('Obrigatório preencher o Tipo de Documento','Erro',mtError,[mbOk],0);
           dblcTipoDocurmento.SetFocus;
           Abort;
        end;
       if Trim(dbeDataLanc.Text) = '' then
        begin
           MsgDlg('Obrigatório preencher a Data do Lançamento','Erro',mtError,[mbOk],0);
           dbeDataLanc.SetFocus;
           Abort;
        end
       else
       if bFeriado then
        begin
           MsgDlg('A data de Lançamento é um Feriado','Erro',mtError,[mbOk],0);
           dbeDataLanc.SetFocus;
           Abort;
        end
       else
        if not(FlgPermiteLancamentos.Enabled) and
           (dbeDataLanc.Date<=(dDataCorrente+rDiasBloqueio)) and (rDiasBloqueio<>0) then
         begin
            MsgDlg('Não é permitido Inclusões/Alterações dentro da faixa de'+#10+#13+
                   '('+FormatFloat('00',rDiasBloqueio)+') dia(s) de Bloqueio!'+#10+#13+
                   'Verifique o Número de Dias de Bloqueio nos parâmetros do sistema e/ou'+#10+#13+
                   'autorização do ususário ('+Sistema.NomeUsuario+
                   ') no item "Permissão de Lançamento no Fluxo Orçado"',
                   'Atenção',mtWarning,[mbOk],0);
            if gbDadosBasicos.Enabled then dbeDataLanc.SetFocus;
            Abort;
         end;

       if Trim(dblcMoeda.Text) <> '' then
        begin
           if (dbeValorMoeda.Value = 0) then
            begin
               MsgDlg('Obrigatório preencher o Valor em Outra Moeda','Erro',mtError,[mbOk],0);
               dbeValorMoeda.SetFocus;
               Abort;
            end;
        end
       else
        begin
           if dbeValor.Value = 0 then
            begin
               MsgDlg('Obrigatório preencher o Valor em Moeda Corrente','Erro',mtError,[mbOk],0);
               dbeValor.SetFocus;
               Abort;
            end;
        end;

       if Sistema.UsaPlanoPatro then
        begin
           if Trim(dblcPlanoPrev.Text)='' then
            begin
               MsgDlg('Obrigatório preencher o Plano Previdenciário','Erro',mtError,[mbOk],0);
               dblcPlanoPrev.SetFocus;
               Abort;
            end;
           if Trim(dblcPatrocinador.Text)='' then
            begin
               MsgDlg('Obrigatório preencher o Patrocinador','Erro',mtError,[mbOk],0);
               dblcPatrocinador.SetFocus;
               Abort;
            end;
        end;

       qry.FieldByName('VALOROUTRAMOEDA').AsFloat:=dbeValorMoeda.Value;
       qry.FieldByName('VALOR').AsFloat:=dbeValor.Value;
       qry.FieldByName('RECPAG').AsString:=qryTipoRD.FieldByName('RECPAG').AsString;
       if qry.FieldByName('IDFLUXOORCADO').AsInteger <=0 then
        begin
           iIdFluxoOrcado := LeUltRegistro(nil,'FLUXOORCADO');
           qry.FieldByName('IDFLUXOORCADO').AsInteger:=iIdFluxoOrcado;
        end;
       //
       gbDadosBasicos.Enabled:=True;
       pnlFundo.Enabled:=False;

       //Guarda Dados
       with Ultimo do
       begin
          Atividade:=StrToFloat(dblcUnidNegoc.LookupValue);
          CRespon:=dblcCentroRespon.LookupValue;
          TipoRecDes:=dblcTipoRD.LookupValue;
          DataLanc:=dbeDataLanc.Date;
          CodTipDoc:=StrToFloat(dblcTipoDocurmento.LookupValue);
          if Sistema.UsaPlanoPatro then
           begin
              IDPlano:=StrToFloat(dblcPlanoPrev.LookupValue);
              IDPatro:=StrToFloat(dblcPatrocinador.LookupValue);
           end;
       end;

      inherited;
    end
   else
    inherited;
end;

procedure TfrmLancFluxoOrc.CmeCadastroCancel(Sender: TObject);
begin
  gbDadosBasicos.Enabled:=True;
  pnlFundo.Enabled:=False;
  inherited;
  FazerQry(qry.FieldByName('IDFLUXOORCADO').AsInteger);
end;

procedure TfrmLancFluxoOrc.dblcMoedaExit(Sender: TObject);
begin
  inherited;
  if Trim(dblcMoeda.Text) = '' then
  Begin
     dbeValorMoeda.Value := 0;
     dbeValorMoeda.Enabled:=False;
     dbeValor.Enabled:=True;
  end
  else
  Begin
     dbeValor.Value := 0;
     dbeValor.Enabled:=False;
     dbeValorMoeda.Enabled:=True;
     dbeValorMoeda.SetFocus;
  end;
end;

procedure TfrmLancFluxoOrc.FormPaint(Sender: TObject);
begin
  inherited;
  if Modulo.sPrazoFluxoOrc ='C' then
     frmLancFluxoOrc.Caption:='Lançamento do Fluxo Orçado de Curto Prazo';
  if Modulo.sPrazoFluxoOrc ='M' then
     frmLancFluxoOrc.Caption:='Lançamento do Fluxo Orçado de Medio Prazo';
  if Modulo.sPrazoFluxoOrc ='L' then
     frmLancFluxoOrc.Caption:='Lançamento do Fluxo Orçado de Longo Prazo';
end;

procedure TfrmLancFluxoOrc.LimpaValores;
Begin
  //
  dbeValorMoeda.Value := 0;
  dbeValor.Value := 0;
  iIdFluxoOrcado := -1;
  FazerQry(iIdFluxoOrcado);
  //                                         
end;

procedure TfrmLancFluxoOrc.FazerQry(iIdFluxoOrcado:LongInt);
Begin
  //
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.text := 'SELECT F.*,U.NOME,C.NOME,C.CODCENTROCUSTO,T.DESCRICAO,I.MOESIGLA '+
                  ' FROM FLUXOORCADO F, UNIDNEGOCIO U, CENTRESPON C, TIPORECEBDESEMB T, MOEDA I '+
                  ' WHERE F.IDFLUXOORCADO = '+IntToStr(iIdFluxoOrcado)+
                  ' AND T.CODTIPRECDES = F.CODTIPRECDES AND T.RECPAG = F.RECPAG AND I.MOECODIGO(+) = F.MOECODIGO '+
                  ' AND T.IDPESSOA = F.IDPESSOA AND U.UNIDNEGOC = F.UNIDNEGOC AND U.IDPESSOA = F.IDPESSOA'+
                  ' AND C.CODCENTRORESPON = F.CODCENTRORESPON AND C.IDPESSOA = F.IDPESSOA';
  qry.Open;
  dbeValorMoeda.Value     :=qry.FieldByName('VALOROUTRAMOEDA').AsFloat;
  dbeValor.Value          :=qry.FieldByName('VALOR').AsFloat;

  dblcCentroResponChange(nil);
  dblcTipoRDChange(nil);

  //dblcUnidNegoc.Text      :=qry.FieldByName('NOME').AsString;
  //dblcCentroRespon.Text   :=qry.FieldByName('NOME_1').AsString;
  //dblcTipoRD.Text         :=qry.FieldByName('DESCRICAO').AsString;
  //dblcMoeda.Text          :=qry.FieldByName('MOESIGLA').AsString;
  //
end;


procedure TfrmLancFluxoOrc.dblcCentroResponChange(Sender: TObject);
begin
   qryTipoRD.Close;
   qryTipoRD.ParamByName('CodCentroRespon').AsString:=Trim(dblcCentroRespon.LookupValue);
   qryTipoRD.ParamByName('IDPessoa').AsFloat:=Sistema.idempresa;
   qryTipoRD.Open;
end;

procedure TfrmLancFluxoOrc.dblcTipoRDChange(Sender: TObject);
begin
  qryTipoDocumento.Close;
  qryTipoDocumento.ParamByName('RECPAG').AsString:=qryTipoRD.FieldByName('RECPAG').AsString;
  qryTipoDocumento.Open;
end;

end.
