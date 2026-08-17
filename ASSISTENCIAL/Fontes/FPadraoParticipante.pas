unit FPadraoParticipante;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FConsAvancada, Db, Wwdatsrc, ComCtrls, StdCtrls, ExtCtrls, Buttons,
  Grids, Wwdbigrd, Wwdbgrid, MAHlpBtn, Mask, MskEdDlg, wwdblook, DBTables,
  TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti, Wwquery, wwdbdatetimepicker,
  CMDateTimePicker;

const
    // Constantes com o indice das tabelas no lstTabelas
    //            DECLARAR NO FORMULÁRIO HERDEIRO
    indParticipante = 0;  indDependente   = 1;
    indBeneficiario = 2;  indContribuicao = 3;
    indBeneficio    = 4;

type

  TfrmPadraoParticipante = class(TfrmConsAvancada)
    qryPatro: TwwQuery;
    qryPlano: TwwQuery;
    qrySitPart: TwwQuery;
    GroupBox1: TGroupBox;
    LABEL1: TLabel;
    label4: TLabel;
    dblkpcmbPatro: TwwDBLookupCombo;
    dblkpcmbPlano: TwwDBLookupCombo;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    edNumInsc: TEdit;
    dblkpcmbSituacao: TwwDBLookupCombo;
    RadioGroup1: TRadioGroup;
    rgrpStatusInsc: TRadioGroup;
    rgrpSexo: TRadioGroup;
    rgrpFlag: TRadioGroup;
    rgrpEstCivil: TRadioGroup;
    mskedMes: TcmMaskEditDlg;
    mskedData: TCMDateTimePicker;
    mskdlgDataInsc: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure lstTabelasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConsultarClick(Sender: TObject);
    procedure sbtnEClick(Sender: TObject);
    procedure sbtnOUClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure lstCampoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function ConteudoPreenchido (var pSQLParc : string) : string; override;
  private
    { Private declarations }
    procedure ConfigConteudo(tabela,indice : integer);

  public
    { Public declarations }
  end;

var
  frmPadraoParticipante: TfrmPadraoParticipante;

implementation

uses UConsAvancPrev;

{$R *.DFM}

procedure TfrmPadraoParticipante.ConfigConteudo(tabela, indice : integer);
begin
   case tabela of
     indParticipante :
       begin
          edConteudo.Visible  := ((aParticipante[indice,2] = codString)  or
                                  (aParticipante[indice,2] = codIdade) or
                                  (aParticipante[indice,2] = codTempoServ) or
                                  (aParticipante[indice,2] = codNumero));
          rgrpEstCivil.Visible := (aParticipante[indice,2] = codEstCivil);
          rgrpFlag.Visible     := (aParticipante[indice,2] = codFlag);
          mskedData.Visible    := (aParticipante[indice,2] = codData);
          rgrpSexo.Visible     := (aParticipante[indice,2] = codSexo);
          mskedMes.Visible     := (aParticipante[indice,2] = codMes);
        end;
     indDependente :
        begin
          edConteudo.Visible  := ((aDependente[indice,2] = codString)  or
                                  (aDependente[indice,2] = codIdade) or
                                  (aDependente[indice,2] = codTempoServ) or
                                  (aDependente[indice,2] = CodNumero));
          rgrpEstCivil.Visible := (aDependente[indice,2] = CodEstCivil);
          rgrpFlag.Visible     := (aDependente[indice,2] = CodFlag);
          mskedData.Visible    := (aDependente[indice,2] = CodData);
          rgrpSexo.Visible     := (aDependente[indice,2] = CodSexo);
          mskedMes.Visible     := (aDependente[indice,2] = CodMes);
        end;
     indBeneficiario :
       begin
         edConteudo.Visible  := ((aBeneficiario[indice,2] = CodString)  or
                                 (aBeneficiario[indice,2] = CodIdade) or
                                 (aBeneficiario[indice,2] = codTempoServ) or
                                 (aBeneficiario[indice,2] = codNumero));
         rgrpEstCivil.Visible := (aBeneficiario[indice,2] = codEstCivil);
         rgrpFlag.Visible     := (aBeneficiario[indice,2] = codFlag);
         mskedData.Visible    := (aBeneficiario[indice,2] = codData);
         rgrpSexo.Visible     := (aBeneficiario[indice,2] = codSexo);
         mskedMes.Visible     := (aBeneficiario[indice,2] = codMes);
       end;
     {indContribuicao :
       begin
         edConteudo.Visible  := ((aContribuicao[indice,2] = codString)  or
                                 (aContribuicao[indice,2] = codIdade) or
                                 (aContribuicao[indice,2] = codTempoServ) or
                                 (aContribuicao[indice,2] = codNumero));
         rgrpEstCivil.Visible := (aContribuicao[indice,2] = codEstCivil);
         rgrpFlag.Visible     := (aContribuicao[indice,2] = codFlag);
         mskedData.Visible    := (aContribuicao[indice,2] = codData);
         rgrpSexo.Visible     := (aContribuicao[indice,2] = codSexo);
         mskedMes.Visible     := (aContribuicao[indice,2] = codMes);
       end;
     indBeneficio :
       begin
         edConteudo.Visible  := ((aBeneficio[indice,2] = codString)  or
                                 (aBeneficio[indice,2] = codIdade) or
                                 (aBeneficio[indice,2] = codTempoServ) or
                                 (aBeneficio[indice,2] = codNumero));
         rgrpEstCivil.Visible := (aBeneficio[indice,2] = codEstCivil);
         rgrpFlag.Visible     := (aBeneficio[indice,2] = codFlag);
         mskedData.Visible    := (aBeneficio[indice,2] = codData);
         rgrpSexo.Visible     := (aBeneficio[indice,2] = codSexo);
         mskedMes.Visible     := (aBeneficio[indice,2] = codMes);
       end;}
   end;
end;

function TfrmPadraoParticipante.ConteudoPreenchido(var pSQLParc : string) : string;
var sDataNasc : string;
    idiaNasc, iMesNasc, iAnoNasc  : word;
    iIdade : integer;
begin
  Result := '';
  pSQLParc := '';
  if lstCampo.ItemIndex < 0 then
    exit;

  if edConteudo.Visible then
  begin
     Result := Trim(edConteudo.Text);
     case lstTabelas.ItemIndex of
        indParticipante :
           begin
             if (aParticipante[lstCampo.ItemIndex,2] = CodString) or
                (aParticipante[lstCampo.ItemIndex,2] = CodSexo) or
                (aParticipante[lstCampo.ItemIndex,2] = CodEstCivil) or
                (aParticipante[lstCampo.ItemIndex,2] = CodMes) or
                (aParticipante[lstCampo.ItemIndex,2] = CodTempoServ) then
               pSQLParc := ''''+Result+''''
             else
               if aParticipante[lstCampo.ItemIndex,2] = CodData then
                 pSQLParc := 'To_Date('''+Result+''',''dd/MM/yyyy'')'
               else
                 if aParticipante[lstCampo.ItemIndex,2] = CodIdade then
                 begin
                   try
                      iIdade := StrToInt(Result);
                   except
                      ShowMessage('Idade inválida');
                      pSQLParc := '';
                      exit;
                   end;
                   DecodeDate(Date,iAnoNasc,iMesNasc,iDiaNasc);
                   iAnoNasc := iAnoNasc-iIdade;
                   sDataNasc := '01/01/'+IntToStr(iAnoNasc);
                   pSQLParc := 'To_Date('''+sDataNasc+''',''dd/MM/yyyy'')'
                 end;
           end;
        indDependente :
           begin
             if (aDependente[lstCampo.ItemIndex,2] = CodString) or
                (aDependente[lstCampo.ItemIndex,2] = CodSexo) or
                (aDependente[lstCampo.ItemIndex,2] = CodEstCivil) or
                (aDependente[lstCampo.ItemIndex,2] = CodMes) then
               pSQLParc := ''''+Result+''''
             else
               if aDependente[lstCampo.ItemIndex,2] = CodData then
                 pSQLParc := 'To_Date('''+Result+''',''dd/MM/yyyy'')';
           end;
        indBeneficiario :
           begin
             if (aBeneficiario[lstCampo.ItemIndex,2] = CodString) or
                (aBeneficiario[lstCampo.ItemIndex,2] = CodSexo) or
                (aBeneficiario[lstCampo.ItemIndex,2] = CodEstCivil) or
                (aBeneficiario[lstCampo.ItemIndex,2] = CodMes) then
               pSQLParc := ''''+Result+''''
             else
               if aBeneficiario[lstCampo.ItemIndex,2] = CodData then
                 pSQLParc := 'To_Date('''+Result+''',''dd/MM/yyyy'')';
           end;
        {indContribuicao :
           begin
             if (aContribuicao[lstCampo.ItemIndex,2] = CodString) or
                (aContribuicao[lstCampo.ItemIndex,2] = CodSexo) or
                (aContribuicao[lstCampo.ItemIndex,2] = CodEstCivil) or
                (aContribuicao[lstCampo.ItemIndex,2] = CodMes) then
               pSQLParc := ''''+Result+''''
             else
               if aContribuicao[lstCampo.ItemIndex,2] = CodData then
                 pSQLParc := 'To_Date('''+Result+''',''dd/MM/yyyy'')';
           end;
        indBeneficio :
          begin
            if (aBeneficio[lstCampo.ItemIndex,2] = CodString) or
               (aBeneficio[lstCampo.ItemIndex,2] = CodSexo) or
               (aBeneficio[lstCampo.ItemIndex,2] = CodEstCivil) or
               (aBeneficio[lstCampo.ItemIndex,2] = CodMes) then
              pSQLParc := ''''+Result+''''
            else
              if aBeneficio[lstCampo.ItemIndex,2] = CodData then
                pSQLParc := 'To_Date('''+Result+''',''dd/MM/yyyy'')';
          end;}
     end;
     exit;
  end;

  if rgrpEstCivil.Visible then
  begin
     case rgrpEstCivil.ItemIndex of
          0 : result := 'S'; // Solteiro
          1 : result := 'C'; // Casado
          2 : result := 'V'; // Viúvo
          3 : result := 'D'; // Divorciado
          else
              result := '';
     end;
     pSQLParc := ''''+Result+'''';
     exit;
  end;

  if rgrpFlag.Visible then
  begin
     if lstTabelas.ItemIndex = indParticipante then
     begin
        // Verificar se campo selecionado é Tipo de Situacao
        if lstCampo.ItemIndex = 15 {Inscricao cancelada por desistencia} then
          if rgrpFlag.ItemIndex = 0 then
            result := '''D'''
          else
            result := '''N'''
        else
          if lstCampo.ItemIndex = 16 {Inscricao Cancelada por Inadimplencia} then
            if rgrpFlag.ItemIndex = 0 then
              result := '''I'''
            else
              result := '''N'''
          else
            if lstCampo.ItemIndex = 16 {Inscricao Cancelada por Inadimplencia} then
              if rgrpFlag.ItemIndex = 0 then
                result := '''S'''
              else
                result := '''N''';
        exit;
     end;
     case rgrpFlag.ItemIndex of
          0 : result := '1'; // verdadeiro
          1 : result := '0'; // false
          else
              result := '';
     end;
     exit;
  end;

  if mskedData.Visible then
  begin
     if Trim(mskedData.Text) = '/  /' then
       result := ''
     else
       result := mskedData.Text;
     if result <> '' then
       pSQLParc := 'To_Date('''+Result+''',''dd/MM/yyyy'')';
     exit;
  end;

  if rgrpSexo.Visible
  then begin
     case rgrpSexo.ItemIndex of
          0 : result := 'F'; // feminino
          1 : result := 'M'; // masculino
          else
              result := '';
     end;
     pSQLParc := ''''+result+'''';
     exit;
  end;

  if mskedMes.Visible then
  begin
      if trim(mskedMes.Text) = '/' then
        result := ''
      else
        result := mskedMes.Text;
      pSQLParc := ''''+Result+'''';
      exit;
  end;
end;

procedure TfrmPadraoParticipante.FormCreate(Sender: TObject);
begin
  inherited;
  qryPatro.Close; qryPatro.Open;
  qryPlano.Close; qryPlano.Open;
  qrySitPart.Close; qrySitPart.Open;
end;

procedure TfrmPadraoParticipante.lstTabelasClick(Sender: TObject);
var i : integer;
begin
  inherited;
  if lstTabelas.Items.Count <= 0 then
    exit;
  lstCampo.Items.Clear;
  case lstTabelas.ItemIndex of
       indParticipante :
          for i:=0 to tamParticipante do
            lstCampo.Items.Add(aParticipante[i,0]);
       indDependente :
          for i:=0 to tamDependente do
            lstCampo.Items.Add(aDependente[i,0]);
       indBeneficiario :
          for i:=0 to tamBeneficiario do
            lstCampo.Items.Add(aBeneficiario[i,0]);
       {indContribuicao :
          for i:=0 to tamContribuicao do
            lstCampo.Items.Add(aContribuicao[i,0]);
       indBeneficio :
          for i:=0 to tamBeneficio do
            lstCampo.Items.Add(aBeneficio[i,0]);}
  end;
end;

procedure TfrmPadraoParticipante.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryPatro.Close;
  qryPlano.Close;
  qrySitPart.Close;

  inherited;
end;

procedure TfrmPadraoParticipante.bbtnConsultarClick(Sender: TObject);
var i : integer;
begin
  // Preencher variavel SQL
  sSQLAvanc := '';
  for i:=0 to lstSQL.Count -1 do
    sSQLAvanc := sSQLAvanc +' '+ lstSQL.Strings[i];
  if Trim(sSQLAvanc) <> '' then
    sSQLAvanc := sSQLAvanc + ' AND ';

  inherited; // Roda a Lupa e chama procedimento Consulta, que deve
             //  estar implementado no form herdeiro deste }
end;

procedure TfrmPadraoParticipante.sbtnEClick(Sender: TObject);
var
    sSQL      : string;
    sConteudo : string;
    bSair     : boolean;
begin
  // Adiciona a string [nome do campo, sinal e valor] na lista de
  //  exibicao de Resultados
  inherited;

  if (lstCampo.Items.Count <= 0) or (lstCampo.ItemIndex < 0) or
     (lstTabelas.Items.Count <= 0) or (lstTabelas.ItemIndex < 0) or
     (rgrpSinal.ItemIndex < 0) then
    exit;

  sConteudo := ConteudoPreenchido(sSQLParcial);
  if sConteudo = '' then
    exit;

  // Colocar nome do campo no item parcial da SQL
  if (lstSQL.Count <> 0) then
    sSQL := ' AND '
  else
    sSQL := '';

  // Tratar campo do tipo IDADE
  if ((lstTabelas.ItemIndex = indParticipante) and
      (aParticipante[lstCampo.ItemIndex,2] = CodIdade)) OR
     ((lstTabelas.ItemIndex = indDependente) and
      (aDependente[lstCampo.ItemIndex,2] = CodIdade)) OR
     ((lstTabelas.ItemIndex = indBeneficiario) and
      (aBeneficiario[lstCampo.ItemIndex,2] = CodIdade)) then
  begin
     bSair := false;
     case lstTabelas.ItemIndex of
        indParticipante :
           sSQL := sSQL + SQLIdade(bSair, aParticipante[lstCampo.ItemIndex,1],
                                   sConteudo, rgrpSinal.ItemIndex);
        indDependente :
           sSQL := sSQL + SQLIdade(bSair, aDependente[lstCampo.ItemIndex,1],
                                   sConteudo, rgrpSinal.ItemIndex);
        indBeneficiario :
           sSQL := sSQL + SQLIdade(bSair, aBeneficiario[lstCampo.ItemIndex,1],
                                   sConteudo, rgrpSinal.ItemIndex);
     end;
     if bSair then
       exit;

     sSQLParcial := sSQL + sSQLParcial;
     lstSQL.Add(sSQLParcial);
     exit;
  end;

  // Tratar campo do tipo Tempo de Servico
  if ((lstTabelas.ItemIndex = indParticipante) and
      (aParticipante[lstCampo.ItemIndex,2] = CodTempoServ)) then
  begin
     sSQL := sSQL + SQLTempoServ(aParticipante[lstCampo.ItemIndex,1],sConteudo,rgrpSinal.ItemIndex );
     lstSQL.Add(sSQL);
     Exit;
  end;

  // Preencher SQL para outros campos que não sejam do tipo IDADE
  case lstTabelas.ItemIndex of
       indParticipante :
         sSQL := sSQL + aParticipante[lstCampo.ItemIndex,1];
       indDependente :
         sSQL := sSQL + aDependente[lstCampo.ItemIndex,1];
       indBeneficiario :
         sSQL := sSQL + aBeneficiario[lstCampo.ItemIndex,1];
       {indContribuicao :
         sSQL := sSQL + aContribuicao[lstCampo.ItemIndex,1];
       indBeneficio :
         sSQL := sSQL + aBeneficio[lstCampo.ItemIndex,1];}
  end;

  // Colocar sinal do campo no Resultado
  case rgrpSinal.ItemIndex of
     0 : {= } sSQL := sSQL + ' =  ';
     1 : {> } sSQL := sSQL + ' >  ';
     2 : {< } sSQL := sSQL + ' <  ';
     3 : {>=} sSQL := sSQL + ' >= ';
     4 : {<=} sSQL := sSQL + ' <= ';
  end;

  sSQLParcial := sSQL + sSQLParcial;
  lstSQL.Add(sSQLParcial);
end;

procedure TfrmPadraoParticipante.sbtnOUClick(Sender: TObject);
var  sSQL, sConteudo : string;
     bSair : boolean;
begin
  // Adiciona a string [nome do campo, sinal e valor] na lista de
  //  exibicao de Resultados }
  inherited;

  if (lstCampo.Items.Count <= 0) or (lstCampo.ItemIndex < 0) or
     (lstTabelas.Items.Count <= 0) or (lstTabelas.ItemIndex < 0) or
     (rgrpSinal.ItemIndex < 0) then
    exit;

  sConteudo := ConteudoPreenchido(sSQLParcial);
  if sConteudo = '' then
    exit;

  // Colocar nome do campo no item parcial da SQL
  if (lstSQL.Count <> 0) then
    sSQL := ' OR '
  else
    sSQL := '';

  // Tratar campo do tipo IDADE
  if ( (lstTabelas.ItemIndex = indParticipante) and
       (aParticipante[lstCampo.ItemIndex,2] = CodIdade)) OR
     ( (lstTabelas.ItemIndex = indDependente) and
       (aDependente[lstCampo.ItemIndex,2] = CodIdade)) OR
     ( (lstTabelas.ItemIndex = indBeneficiario) and
       (aBeneficiario[lstCampo.ItemIndex,2] = CodIdade)) then
  begin
     bSair := false;
     case lstTabelas.ItemIndex of
        indParticipante :
          sSQL := sSQL + SQLIdade(bSair,aParticipante[lstCampo.ItemIndex,1],sConteudo,rgrpSinal.ItemIndex );
        indDependente :
          sSQL := sSQL + SQLIdade(bSair,aDependente[lstCampo.ItemIndex,1],sConteudo,rgrpSinal.ItemIndex );
        indBeneficiario :
          sSQL := sSQL + SQLIdade(bSair,aBeneficiario[lstCampo.ItemIndex,1],sConteudo,rgrpSinal.ItemIndex );
     end;
     if bSair then
       exit;

     sSQLParcial := sSQL + sSQLParcial;
     lstSQL.Add(sSQLParcial);
     exit;
  end;

  // Tratar campo do tipo Tempo de Servico
  if ((lstTabelas.ItemIndex = indParticipante) and
      (aParticipante[lstCampo.ItemIndex,2] = CodTempoServ)) then
  begin
     sSQL := sSQL + SQLTempoServ(aParticipante[lstCampo.ItemIndex,1],sConteudo,rgrpSinal.ItemIndex );
     lstSQL.Add(sSQL);
     Exit;
  end;

  // Preencher SQL para outros campos que não sejam do tipo IDADE
  case lstTabelas.ItemIndex of
       indParticipante :
         sSQL := sSQL + aParticipante[lstCampo.ItemIndex,1];
       indDependente :
         sSQL := sSQL + aDependente[lstCampo.ItemIndex,1];
       indBeneficiario :
         sSQL := sSQL + aBeneficiario[lstCampo.ItemIndex,1];
       {indContribuicao :
         sSQL := sSQL + aContribuicao[lstCampo.ItemIndex,1];
       indBeneficio :
         sSQL := sSQL + aBeneficio[lstCampo.ItemIndex,1];}
  end;

  // Colocar sinal do campo no Resultado
  case rgrpSinal.ItemIndex of
     0 : {+ } sSQL := sSQL + ' =  ';
     1 : {> } sSQL := sSQL + ' >  ';
     2 : {< } sSQL := sSQL + ' <  ';
     3 : {>=} sSQL := sSQL + ' >= ';
     4 : {<=} sSQL := sSQL + ' >= ';
  end;

  // Adicionar a sql parcial a lista de SQL
  sSQLParcial := sSQL + sSQLParcial;
  lstSQL.Add(sSQLParcial);
end;

procedure TfrmPadraoParticipante.sbtnApagarClick(Sender: TObject);
begin
  // Apagar item da clausula parcial do SQL correspondente ao item selecionado
  // Isto deve ser feito antes do item ser apagado da lista da Tela, para que
  //   o indice deste item nao seja perdido
  if lstResult.ItemIndex >= 0 then
    lstSQL.Delete(lstResult.ItemIndex);

  inherited;
end;

procedure TfrmPadraoParticipante.lstCampoClick(Sender: TObject);
begin
  inherited;
  if (lstCampo.Items.Count <= 0) or (lstCampo.ItemIndex < 0) or
     (lstTabelas.Items.Count <= 0) or (lstTabelas.ItemIndex < 0) then
    exit;

  case lstTabelas.ItemIndex of
       indParticipante :
         ConfigConteudo(indParticipante,lstCampo.ItemIndex);
       indDependente   :
         ConfigConteudo(indDependente,lstCampo.ItemIndex);
       indBeneficiario :
         ConfigConteudo(indBeneficiario,lstCampo.ItemIndex);
       indContribuicao :
         ConfigConteudo(indContribuicao,lstCampo.ItemIndex);
       indBeneficio :
         ConfigConteudo(indBeneficio,lstCampo.ItemIndex);
  end;
end;


procedure TfrmPadraoParticipante.FormShow(Sender: TObject);
begin
  inherited;

  rgrpEstCivil.Visible := false;
  rgrpEstCivil.Top := 129;
  rgrpEstCivil.Left := 6;

  rgrpFlag.Visible := false;
  rgrpFlag.Top := 129;
  rgrpFlag.Left := 6;

  rgrpSexo.Visible := false;
  rgrpSexo.Top := 129;
  rgrpSexo.Left := 6;

  mskedData.Visible := false;
  mskedData.Top := 129;
  mskedData.Left := 6;

  mskedMes.Visible := false;
  mskedMes.Top := 129;
  mskedMes.Left := 6;

  edConteudo.Text := '';
  edConteudo.Visible := true;
end;

end.
