unit FParamContInvent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwquery, wwdblook, Mask, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamContInvent = class(TfrmOkCancelar)
    Label3: TLabel;
    dblcInvent: TwwDBLookupCombo;
    Label1: TLabel;
    dblcAlmox: TwwDBLookupCombo;
    RgOrd: TRadioGroup;
    qryInvent: TwwQuery;
    qryAlmox: TwwQuery;
    edData: TCMDateTimePicker;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblcAlmoxExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParamContInvent: TFrmParamContInvent;

implementation

uses DRptRelats,uSistema,UMensErro,UFuncaoGeral,uModulo;

{$R *.DFM}

procedure TFrmParamContInvent.FormCreate(Sender: TObject);
begin
  inherited;
  qryAlmox.Close;
  qryAlmox.SQL.Text:='SELECT DESCALMOX,CODCUSTEIO,CODALMOXARIFADO FROM ALMOX WHERE (IDPESSOA = '+inttostr(sistema.idempresa)+')';
  qryAlmox.Open;
  //
  qryInvent.Close;
  qryInvent.Sql.Text :=' Select IdInventario, DataInventario, AbertoFechado ' +
                       ' From Inventar ' +
                       ' Where (ContagemEncerrada = ''F'') ' +
                       '       And (idPessoa = ' + IntToStr( Sistema.idEmpresa )+')';
  qryInvent.Open;
  //
  RgOrd.ItemIndex := 0;
end;

procedure TFrmParamContInvent.bbtnConfirmarClick(Sender: TObject);
begin
  If Trim(dblcAlmox.Text) = '' Then
     Begin
          MsgDlg('Almoxarifado não foi preenchido','Erro',MtError,[mbOk],0);
          Exit;
     End;
  With DtmRptRelats.qryContInvent Do
     Begin
        Close;
        Sql.Clear;
        Sql.add(' SELECT ');
        Sql.add('      I.IdInventario,   ');
        Sql.add('      I.DataInventario, ');
        Sql.add('      G.CODGRUPOPROD,   ');
        Sql.add('      G.DESCGRUPOPROD,  ');
        Sql.add('      D.CodArtigo,      ');
        Sql.add('      D.QtdeContada,    ');
        Sql.add('      D.DiferencaAtual, ');
        Sql.add('      D.SaldoInicial,   ');
        Sql.add('      Decode(D.IdMov,NULL,(D.SaldoInicial * C.CustoMedio),(D.SaldoInicial * M.CustoMedioMov)) as ValInicial, ');
        Sql.add('      Decode(D.IdMov,NULL,(D.QtdeContada * C.CustoMedio),(D.QtdeContada * M.CustoMedioMov)) as ValContada,   ');
        Sql.add('      Decode(D.IdMov,NULL,(D.DiferencaAtual * C.CustoMedio),(D.DiferencaAtual * M.CustoMedioMov)) as ValDiferenca, ');
        Sql.add('      S.Localizacao,    ');
        Sql.add('      (P.DescProd || '' '' || A.CodTamanho || '' '' || A.CodCor) as Descricao ');
        Sql.add(' FROM              ');
        Sql.add('      Inventar I,  ');
        Sql.add('      ResCont D,   ');
        Sql.add('      Produto P,   ');
        Sql.add('      Artigo A,    ');
        Sql.add('      Saldo S,     ');
        Sql.add('      CustoMed C,  ');
        Sql.add('      GrupProd G, ');        
        Sql.add('      Moviment M   ');
        Sql.add(' WHERE             ');
        Sql.add('      (I.ContagemEncerrada = ''F'')       ');
        Sql.add('      And (D.DiferencaAtual <>  0)        ');
        Sql.add('      And (D.DiferencaAtual is Not Null)  ');
        Sql.add('      And (S.CodAlmoxarifado = ' +dblcAlmox.LookUpValue +')');
        Sql.add('      And (I.CodAlmoxarifado = ' +dblcAlmox.LookUpValue +')');
        Sql.add('      And (I.IdPessoa = '+ IntToStr( Sistema.IdEmpresa )+')');
        Sql.add('      And (S.IdPessoa = '+ IntToStr( Sistema.IdEmpresa )+')');
        Sql.add('      And (C.CODCUSTEIO = '+ qryAlmox.FieldByName('CODCUSTEIO').AsString +')');
       If Trim(dblcInvent.Text) <> '' Then
            Sql.Add(' And (I.idInventario = '+dblcInvent.LookUpValue+')')
       Else
       If Trim(edData.Text) <> '' Then
            Sql.Add(' And (I.DataInventario = To_Date('''+edData.Text+''',''dd/mm/yyyy''))');

            Sql.Add(' And (I.idInventario = D.idInventario) ');
            Sql.add(' And (A.CodArtigo = D.CodArtigo)       ');
            Sql.add(' And (A.CodArtigo = C.CodArtigo)       ');
            Sql.add(' And (A.CodArtigo = S.CodArtigo(+))    ');
            Sql.add(' And (P.CodProduto =  A.CodProduto)    ');
            Sql.add(' And (G.CODGRUPOPROD =  P.CODGRUPOPROD)');
            Sql.add(' And (M.IdMov(+) =  D.IdMov)           ');

       Case RgOrd.ItemIndex Of
               0 : Sql.Add(' Order By I.IdInventario,G.CODGRUPOPROD, D.CodArtigo ');
               1 : Sql.Add(' Order By I.IdInventario,G.CODGRUPOPROD, Descricao   ');
               2 : Sql.Add(' Order By I.IdInventario,G.CODGRUPOPROD, P.CodGrupoProd, Descricao ');
               3 : Sql.Add(' Order By I.IdInventario,G.CODGRUPOPROD, S.Localizacao, Descricao ');
       End;
       dtmRptRelats.lblAlmoxInvent.Caption := dblcAlmox.Text;
       Open;
     End;
end;

procedure TFrmParamContInvent.dblcAlmoxExit(Sender: TObject);
begin
  inherited;
  IF Trim(dblcAlmox.Text) = '' Then
     Begin
         qryInvent.Close;
         qryInvent.Sql.Text :=' Select IdInventario, DataInventario, AbertoFechado ' +
                              ' From Inventar ' +
                              ' Where (ContagemEncerrada = ''F'')  ' +
                              '       And (idPessoa = ' + IntToStr( Sistema.idEmpresa )+')';
         qryInvent.Open;
     End
  Else
     Begin
         qryInvent.Sql.Text :=' Select IdInventario, DataInventario, AbertoFechado ' +
                              ' From Inventar ' +
                              ' Where (ContagemEncerrada = ''F'') ' +
                              '       And (idPessoa = ' + IntToStr( Sistema.idEmpresa )+ ')'+
                              '       And (CodAlmoxarifado = ' +dblcAlmox.LookUpValue+ ')';
         qryInvent.Open;
     End;

end;

end.
